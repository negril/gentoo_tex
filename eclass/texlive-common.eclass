# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: texlive-common.eclass
# @MAINTAINER:
# tex@gentoo.org
# @AUTHOR:
# Original Author: Alexis Ballier <aballier@gentoo.org>
# @SUPPORTED_EAPIS: 7 8
# @BLURB: Provide various functions used by both texlive-core and texlive modules
# @DESCRIPTION:
# Purpose: Provide various functions used by both texlive-core and texlive
# modules.
#
# Note that this eclass *must* not assume the presence of any standard tex too

case ${EAPI} in
	7)
		inherit eapi8-dosym
		dosym(){ dosym8 "$@"; }
		;;
	8) ;;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

if [[ -z ${_TEXLIVE_COMMON_ECLASS} ]]; then
_TEXLIVE_COMMON_ECLASS=1

# @ECLASS_VARIABLE: TEXMFROOT
# @DESCRIPTION:
# root of the installation
TEXMFROOT="/usr/share"

# @ECLASS_VARIABLE: TEXMFDIST
# @DESCRIPTION:
# files from TEX Live
# TEXMFROOT/texmf-dist
TEXMFDIST="${TEXMFROOT}/texmf-dist"

# @ECLASS_VARIABLE: TEXMFLOCAL
# @DESCRIPTION:
# site-wide additions
# TEXMFROOT/../texmf-local
TEXMFLOCAL="${TEXMFROOT}/texmf-site"

# @ECLASS_VARIABLE: TEXMFSYSVAR
# @DESCRIPTION:
# cached data
# TEXMFROOT/texmf-var
TEXMFSYSVAR="/var/lib/texmf"

# @ECLASS_VARIABLE: TEXMFSYSCONFIG
# @DESCRIPTION:
# configuration data
# TEXMFROOT/texmf-config
TEXMFSYSCONFIG="/etc/texmf"

# @ECLASS_VARIABLE: VARTEXFONTS
# @DESCRIPTION:
# location of generated fonts
# TEXMFVAR/fonts
VARTEXFONTS="/var/cache/fonts"

# @FUNCTION: texlive-common_handle_config_files
# @DESCRIPTION:
# Has to be called in src_install after having installed the files in ${D}
# This function will move the relevant files to TEXMFSYSCONFIG and symlink them
# from their original location. This is to allow easy update of texlive's
# configuration.
# Called by app-text/texlive-core and texlive-module.eclass.
texlive-common_handle_config_files() {
	# Handle config files properly
	[[ -d ${ED}${TEXMFDIST} ]] || return
	cd "${ED}${TEXMFDIST}" || die

	while read -r f; do
		if [[ ${f#*config} != "${f}" || ${f#doc} != "${f}" || ${f#source} != "${f}" || ${f#tex} != "${f}" ]] ; then
			continue
		fi
		local rel_dir
		rel_dir="$(dirname "${f}")"

		dodir "${TEXMFSYSCONFIG}/${rel_dir}.d"
		einfo "Moving (and symlinking) ${EPREFIX}${TEXMFDIST}/${f} to ${EPREFIX}${TEXMFSYSCONFIG}/${rel_dir}.d"
		mv "${ED}/${TEXMFDIST}/${f}" "${ED}${TEXMFSYSCONFIG}/${rel_dir}.d" || die "mv ${f} failed."
		dosym -r "${TEXMFSYSCONFIG}/${rel_dir}).d/$(basename "${f}")" "${TEXMFDIST}/${f}"
	done < <(find . -name '*.cnf' -type f -o -name '*.cfg' -type f | sed -e "s:\./::g")
}

# @FUNCTION: texlive-common_is_file_present_in_texmf
# @DESCRIPTION:
# Return if a file is present in the texmf tree
# Call it from the directory containing texmf and texmf-dist
# Called by app-text/texlive-core.
texlive-common_is_file_present_in_texmf() {
	local mark="${T}/${1}.found"
	if [[ -d texmf ]]; then
		find texmf -name "${1}" -exec touch "${mark}" {} + || die
	fi

	if [[ -d texmf-dist ]]; then
		find texmf-dist -name "${1}" -exec touch "${mark}" {} + || die
	fi
	[ -f "${mark}" ]
}

# @FUNCTION: texlive-common_do_symlinks
# @USAGE: <src> <dest>
# @DESCRIPTION:
# Mimic the install_link function of texlinks
#
# Should have the same behavior as the one in TEXMFROOT/../bin/texlinks
# except that it is under the control of the package manager
# Note that $1 corresponds to $src and $2 to $dest in this function
# ( Arguments are switched because texlinks main function sends them switched )
# This function should not be called from an ebuild, prefer etexlinks that will
# also do the fmtutil file parsing.
# Called by texlive-common.eclass and texlive-module.eclass.
texlive-common_do_symlinks() {
	local texmfbinroot
	texmfbinroot=$(realpath "${TEXMFROOT}/../bin")
	while [[ ${#} != 0 ]]; do
		case ${1} in
			cont-??|metafun|mptopdf)
				einfo "Symlink ${1} skipped (special case)"
				;;
			mf)
				einfo "Symlink ${1} -> ${2} skipped (texlive-core takes care of it)"
				;;
			*)
				if [[ ${1} == "${2}" ]]; then
					einfo "Symlink ${1} -> ${2} skipped"
				elif [[ -e ${ED}${texmfbinroot}/${1} || -L ${ED}${texmfbinroot}/${1} ]]; then
					einfo "Symlink ${1} skipped (file exists)"
				else
					einfo "Making symlink from ${1} to ${2}"
					dosym "${2}" "${texmfbinroot}/${1}"
				fi
				;;
		esac
		shift; shift;
	done
}

# @FUNCTION: etexlinks
# @USAGE: <file>
# @DESCRIPTION:
# Mimic texlinks on a fmtutil format file
#
# $1 has to be a fmtutil format file like fmtutil.cnf
# etexlinks foo will install the symlinks that texlinks --cnffile foo would have
# created. We cannot use texlinks with portage as it is not DESTDIR aware.
# (It would not fail but will not create the symlinks if the target is not in
# the same dir as the source)
# Also, as this eclass must not depend on a tex distribution to be installed we
# cannot use texlinks from here.
# Called by texlive-module.eclass.
etexlinks() {
	# Install symlinks from formats to engines
	texlive-common_do_symlinks $(sed '/^[      ]*#/d; /^[      ]*$/d' "$1" | awk '{print $1, $2}')
}

# @FUNCTION: dobin_texmf_scripts
# @USAGE: <file1> [file2] ...
# @DESCRIPTION:
# Symlinks a script from the texmf tree to TEXMFROOT/../bin. Requires permissions to be
# correctly set for the file that it will point to.
# Called by app-text/epspdf and texlive-module.eclass.
dobin_texmf_scripts() {
	local texmfbinroot
	texmfbinroot=$(realpath "${TEXMFROOT}/../bin")
	while [[ ${#} -gt 0 ]] ; do
		local trg
		trg=$(basename "${1}" | sed 's,\.[^/]*$,,' | tr '[:upper:]' '[:lower:]')
		einfo "Installing ${1} as ${trg} bin wrapper"
		[[ -x ${ED}${TEXMFROOT}/${1} ]] || die "Trying to install a non existing or non executable symlink to ${texmfbinroot}: ${ED}${TEXMFROOT}/${1}"
		dosym -r "${TEXMFROOT}/${1}" "${texmfbinroot}/${trg}"
		shift
	done
}

# @FUNCTION: etexmf-update
# @DESCRIPTION:
# Runs texmf-update if it is available and prints a warning otherwise. This
# function helps in factorizing some code.  Useful in ebuilds' pkg_postinst and
# pkg_postrm phases.
# Called by app-text/dvipsk, app-text/texlive-core, dev-libs/kpathsea, and
# texlive-module.eclass.
etexmf-update() {
	if has_version 'app-text/texlive-core' ; then
		if [[ -z ${ROOT} && -x "${EPREFIX}"/usr/sbin/texmf-update ]] ; then
			"${EPREFIX}"/usr/sbin/texmf-update
		else
			ewarn "Cannot run texmf-update for some reason."
			ewarn "Your texmf tree might be inconsistent with your configuration"
			ewarn "Please try to figure what has happened"
		fi
	fi
}

# @FUNCTION: efmtutil-sys
# @DESCRIPTION:
# Runs fmtutil-sys if it is available and prints a warning otherwise. This
# function helps in factorizing some code. Used in ebuilds' pkg_postinst to
# force a rebuild of TeX formats.
efmtutil-sys() {
	if has_version 'app-text/texlive-core' ; then
		if [[ -z ${ROOT} && -x "${EPREFIX}${TEXMFROOT}/../bin/fmtutil-sys" ]] ; then
			einfo "Rebuilding formats"
			"${EPREFIX}${TEXMFROOT}/../bin/fmtutil-sys" --all &> /dev/null || die
		else
			ewarn "Cannot run fmtutil-sys for some reason."
			ewarn "Your formats might be inconsistent with your installed ${PN} version"
			ewarn "Please try to figure what has happened"
		fi
	fi
}

# @FUNCTION: texlive-common_append_to_src_uri
# @DESCRIPTION:
# Takes the name of a variable as input.  The variable must contain a
# list of texlive packages.  Every texlive package in the variable is
# transformed to an URL and appended to SRC_URI.
texlive-common_append_to_src_uri() {
	local tl_uri=( ${!1} )

	# Starting from TeX Live 2009, upstream provides .tar.xz modules.
	local tl_pkgext=tar.xz

	local tl_uri_prefix="https://dev.gentoo.org/~@dev@/distfiles/texlive/tl-"
	local tl_2023_uri_prefix="https://dev.gentoo.org/~@dev@/distfiles/texlive/"

	local tl_dev
	# If the version is less than 2023 and the package is the
	# dev-texlive category, we fallback to the old SRC_URI layout. With
	# the 2023 bump, packages outside the dev-texlive category start to
	# inherit texlive-common.eclass.
	if ver_test -lt 2023 && [[ ${CATEGORY} == dev-texlive ]]; then
		local texlive_lt_2023_devs=( zlogene dilfridge sam )
		local tl_uri_suffix="-${PV}.${tl_pkgext}"

		tl_uri=( "${tl_uri[@]/%/${tl_uri_suffix}}" )
		for tl_dev in "${texlive_lt_2023_devs[@]}"; do
			SRC_URI+=" ${tl_uri[*]/#/${tl_uri_prefix/@dev@/${tl_dev}}}"
		done
	else
		local texlive_ge_2023_devs=( flow )
		local tl_mirror="mirror://ctan/systems/texlive/tlnet/archive/"

		tl_uri=( "${tl_uri[@]/%/.${tl_pkgext}}" )
		SRC_URI+=" ${tl_uri[*]/#/${tl_mirror}}"
		for tl_dev in "${texlive_ge_2023_devs[@]}"; do
			SRC_URI+=" ${tl_uri[*]/#/${tl_2023_uri_prefix/@dev@/${tl_dev}}}"
		done
	fi
}

fi
