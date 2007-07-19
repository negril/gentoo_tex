# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/eclass/gst-plugins-good.eclass,v 1.12 2007/01/25 16:47:56 lack Exp $


HOMEPAGE="http://www.tug.org/texlive/"
SRC_URI="mirror://gentoo/${P}.tar.bz2"

COMMON_DEPEND=">=app-text/texlive-bin-${PV}"
DEPEND="${COMMON_DEPEND}
	app-arch/unzip
	${TEXLIVE_MODULES_DEPS}"

RDEPEND="${COMMON_DEPEND}
	${TEXLIVE_MODULES_DEPS}"

texlive-module_src_unpack() {
	unpack ${A}
	cd "${S}"

	mkdir -p "${S}/unpacked"
	cd "${S}/unpacked"

	for i in "${S}"/*zip ; do
		einfo "Unpacking ${i}"
		unzip -q "${i}"
	done
}

texlive-module_src_install() {
	cd "${S}/unpacked"
	insinto /usr/share
	doins -r *
	for i in "${S}"/unpacked/texmf/lists/*;
	do
		grep '^!' "${i}" | tr ' ' '=' |sort|uniq >> "${T}/jobs"
	done

	for j in `cat ${T}/jobs`;
	do
		command=`echo $j | sed 's/.\(.*\)=.*/\1/'`
		parameter=`echo $j | sed 's/.*=\(.*\)/\1/'`
		case $command in
			addMap)
				dodir /etc/texmf/updmap.d
				echo "Map $parameter" >> ${D}etc/texmf/updmap.d/${PN}.cfg;;
			addMixedMap)
				dodir /etc/texmf/updmap.d
				echo "MixedMap $parameter" >> ${D}etc/texmf/updmap.d/${PN}.cfg;;
			addDvipsMap)
				dodir /etc/texmf/dvips/config
				echo "p	+$parameter" >> ${D}etc/texmf/dvips/config/config.ps;;
			addDvipdfmMap)
				dodir /etc/texmf/dvipdfm/config
				echo "f	$parameter" >> ${D}etc/texmf/dvipdfm/config/config;;
			esac
		done
}

texlive-module_pkg_postinst() {
		texmf-update
}

texlive-module_pkg_postrm() {
	texmf-update
}

EXPORT_FUNCTIONS src_unpack src_install pkg_postinst pkg_postrm
