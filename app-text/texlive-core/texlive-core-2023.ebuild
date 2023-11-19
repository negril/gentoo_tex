# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

TL_SOURCE_VERSION=20230311
WITH_BINEXTRA=1
inherit flag-o-matic toolchain-funcs libtool texlive-common

MY_P=${PN%-core}-${TL_SOURCE_VERSION}-source

DESCRIPTION="A complete TeX distribution"
HOMEPAGE="https://tug.org/texlive/"
SLOT="0"
LICENSE="Apache-2.0 Artistic BSD BSD-2 FDL-1.3 GPL-1 GPL-2 GPL-3 GPL-3+ LGPL-3 LPPL-1.0 LPPL-1.2 LPPL-1.3 LPPL-1.3c MIT TeX TeX-other-free public-domain"
RESTRICT="mirror"

SRC_URI="
	mirror://ctan/Source/${MY_P}.tar.xz
	https://github.com/Flowdalic/texlive-source/commit/9d53bc46fc5259542e32299ec695df375a4f54c9.patch
		-> texlive-2023-drop-luazlip-version-check.patch
"

# We ship binextra collection alongside
TL_CORE_BINEXTRA_MODULES="
	a2ping.r52964
	adhocfilelist.r29349
	arara.r68431
	asymptote.r67300
	bundledoc.r64620
	checklistings.r38300
	chklref.r52649
	clojure-pamphlet.r67201
	cluttex.r60964
	ctan-o-mat.r51578
	ctan_chk.r36304
	ctanbib.r68650
	ctanify.r44129
	ctanupload.r26313
	ctie.r66186
	cweb.r68647
	de-macro.r66746
	digestif.r65223
	dtl.r62387
	dtxgen.r51663
	dvi2tty.r66186
	dviasm.r68043
	dvicopy.r66186
	dvidvi.r65952
	dviinfox.r59216
	dviljk.r66186
	dviout-util.r66186
	dvipng.r66203
	dvipos.r66186
	easydtx.r68514
	findhyph.r47444
	fragmaster.r26313
	git-latexdiff.r54732
	gsftopk.r52851
	hook-pre-commit-pkg.r41378
	installfont.r31205
	ketcindy.r58661
	lacheck.r66186
	latex-git-log.r54010
	latex-papersize.r53131
	latex2man.r64477
	latex2nemeth.r65269
	latexfileversion.r29349
	latexindent.r68533
	latexpand.r66226
	light-latex-make.r66473
	listings-ext.r29349
	ltxfileinfo.r38663
	ltximg.r59335
	luajittex.r66186
	make4ht.r66130
	match_parens.r66681
	mflua.r62774
	mkjobtexmf.r29725
	optexcount.r59817
	patgen.r66186
	pdfbook2.r53521
	pdfcrop.r66862
	pdfjam.r68597
	pdflatexpicscale.r46617
	pdftex-quiet.r49169
	pdftosrc.r66186
	pdfxup.r59001
	pfarrei.r31934
	pkfix.r26032
	pkfix-helper.r56061
	purifyeps.r29725
	pythontex.r59514
	runtexshebang.r68269
	seetexk.r57972
	spix.r65050
	srcredact.r38710
	sty2dtx.r64967
	synctex.r66203
	tex4ebook.r66621
	texaccents.r64447
	texcount.r49013
	texdef.r64967
	texdiff.r29752
	texdirflatten.r55064
	texdoc.r66227
	texdoctk.r62186
	texfot.r68110
	texlive-scripts-extra.r62517
	texliveonfly.r55777
	texloganalyser.r54526
	texlogfilter.r62792
	texlogsieve.r64301
	texosquery.r53676
	texplate.r67201
	texware.r66186
	tie.r66186
	tlcockpit.r54857
	tpic2pdftex.r52851
	typeoutfileinfo.r67526
	upmendex.r66381
	web.r66186
	xindex.r67771
	xindy.r65958
	xpdfopen.r65952
	collection-binextra.r68514
"
TL_CORE_BINEXTRA_DOC_MODULES="
	a2ping.doc.r52964
	adhocfilelist.doc.r29349
	arara.doc.r68431
	asymptote.doc.r67300
	bundledoc.doc.r64620
	checklistings.doc.r38300
	chklref.doc.r52649
	clojure-pamphlet.doc.r67201
	cluttex.doc.r60964
	ctan-o-mat.doc.r51578
	ctan_chk.doc.r36304
	ctanbib.doc.r68650
	ctanify.doc.r44129
	ctanupload.doc.r26313
	ctie.doc.r66186
	cweb.doc.r68647
	de-macro.doc.r66746
	digestif.doc.r65223
	dtl.doc.r62387
	dtxgen.doc.r51663
	dvi2tty.doc.r66186
	dviasm.doc.r68043
	dvicopy.doc.r66186
	dvidvi.doc.r65952
	dviinfox.doc.r59216
	dviljk.doc.r66186
	dviout-util.doc.r66186
	dvipng.doc.r66203
	dvipos.doc.r66186
	easydtx.doc.r68514
	findhyph.doc.r47444
	fragmaster.doc.r26313
	git-latexdiff.doc.r54732
	gsftopk.doc.r52851
	hook-pre-commit-pkg.doc.r41378
	installfont.doc.r31205
	ketcindy.doc.r58661
	lacheck.doc.r66186
	latex-git-log.doc.r54010
	latex-papersize.doc.r53131
	latex2man.doc.r64477
	latex2nemeth.doc.r65269
	latexfileversion.doc.r29349
	latexindent.doc.r68533
	latexpand.doc.r66226
	light-latex-make.doc.r66473
	listings-ext.doc.r29349
	ltxfileinfo.doc.r38663
	ltximg.doc.r59335
	luajittex.doc.r66186
	make4ht.doc.r66130
	match_parens.doc.r66681
	mkjobtexmf.doc.r29725
	optexcount.doc.r59817
	patgen.doc.r66186
	pdfbook2.doc.r53521
	pdfcrop.doc.r66862
	pdfjam.doc.r68597
	pdflatexpicscale.doc.r46617
	pdftex-quiet.doc.r49169
	pdftosrc.doc.r66186
	pdfxup.doc.r59001
	pfarrei.doc.r31934
	pkfix.doc.r26032
	pkfix-helper.doc.r56061
	purifyeps.doc.r29725
	pythontex.doc.r59514
	runtexshebang.doc.r68269
	seetexk.doc.r57972
	spix.doc.r65050
	srcredact.doc.r38710
	sty2dtx.doc.r64967
	synctex.doc.r66203
	tex4ebook.doc.r66621
	texaccents.doc.r64447
	texcount.doc.r49013
	texdef.doc.r64967
	texdiff.doc.r29752
	texdirflatten.doc.r55064
	texdoc.doc.r66227
	texdoctk.doc.r62186
	texfot.doc.r68110
	texlive-scripts-extra.doc.r62517
	texliveonfly.doc.r55777
	texloganalyser.doc.r54526
	texlogfilter.doc.r62792
	texlogsieve.doc.r64301
	texosquery.doc.r53676
	texplate.doc.r67201
	texware.doc.r66186
	tie.doc.r66186
	tlcockpit.doc.r54857
	tpic2pdftex.doc.r52851
	typeoutfileinfo.doc.r67526
	upmendex.doc.r66381
	web.doc.r66186
	xindex.doc.r67771
	xindy.doc.r65958
	xpdfopen.doc.r65952
"
TL_CORE_BINEXTRA_SRC_MODULES="
	adhocfilelist.source.r29349
	arara.source.r68431
	checklistings.source.r38300
	clojure-pamphlet.source.r67201
	listings-ext.source.r29349
	mkjobtexmf.source.r29725
	optexcount.source.r59817
	pfarrei.source.r31934
	pythontex.source.r59514
	texaccents.source.r64447
	texdef.source.r64967
	texosquery.source.r53676
	texplate.source.r67201
	tlcockpit.source.r54857
"
# Macros that are not a part of texlive-sources or collection-binextra but still needed
# for other packages during installation
TL_CORE_EXTRA_MODULES="
	hyphen-base.r68321
	gsftopk.r52851
	texlive.infra.r68562
	texlive-scripts.r68642
"

TL_CORE_EXTRA_DOC_MODULES="
	gsftopk.doc.r52851
	texlive.infra.doc.r68562
	texlive-scripts.doc.r68642
"
TEXLIVE_MODULE_BINSCRIPTS="
	texmf-dist/scripts/make4ht/make4ht
	texmf-dist/scripts/texlive/fmtutil.pl
	texmf-dist/scripts/texlive/fmtutil-sys.sh
	texmf-dist/scripts/texlive/fmtutil-user.sh
	texmf-dist/scripts/texlive/mktexmf
	texmf-dist/scripts/texlive/mktexpk
	texmf-dist/scripts/texlive/mktextfm
	texmf-dist/scripts/texlive/rungs.lua
	texmf-dist/scripts/texlive/updmap-sys.sh
	texmf-dist/scripts/texlive/updmap-user.sh
	texmf-dist/scripts/texlive/updmap.pl
	texmf-dist/scripts/texlive/tlmgr.pl
	texmf-dist/scripts/texlive/mktexlsr
"
TEXLIVE_MODULE_BINLINKS="
	mktexlsr:texhash
	fmtutil:mktexfmt
"
TEXLIVE_MODULE_BINSCRIPTS+="
	texmf-dist/scripts/texlive-extra/allcm.sh
	texmf-dist/scripts/texlive-extra/allneeded.sh
	texmf-dist/scripts/texlive-extra/dvi2fax.sh
	texmf-dist/scripts/texlive-extra/dvired.sh
	texmf-dist/scripts/texlive-extra/e2pall.pl
	texmf-dist/scripts/texlive-extra/kpsetool.sh
	texmf-dist/scripts/texlive-extra/kpsewhere.sh
	texmf-dist/scripts/texlive-extra/ps2frag.sh
	texmf-dist/scripts/texlive-extra/pslatex.sh
	texmf-dist/scripts/texlive-extra/texconfig-dialog.sh
	texmf-dist/scripts/texlive-extra/texconfig-sys.sh
	texmf-dist/scripts/texlive-extra/texconfig.sh
	texmf-dist/scripts/texlive-extra/texlinks.sh
"

# TL_CORE_EXTRA_SRC_MODULES=""

texlive-common_append_to_src_uri TL_CORE_EXTRA_MODULES

SRC_URI="${SRC_URI} doc? ( "
texlive-common_append_to_src_uri TL_CORE_EXTRA_DOC_MODULES
SRC_URI="${SRC_URI} )"
# SRC_URI="${SRC_URI} source? ( "
# for i in ${TL_CORE_EXTRA_SRC_MODULES}; do
# 	SRC_URI="${SRC_URI} mirror://ctan/tlnet/archive/${i}.tar.xz"
# done
# SRC_URI="${SRC_URI} )"

if [[ $WITH_BINEXTRA -gt 0 ]]; then
texlive-common_append_to_src_uri TL_CORE_BINEXTRA_MODULES

SRC_URI="${SRC_URI} doc? ( "
texlive-common_append_to_src_uri TL_CORE_BINEXTRA_DOC_MODULES
SRC_URI="${SRC_URI} )"

SRC_URI="${SRC_URI} source? ( "
texlive-common_append_to_src_uri TL_CORE_BINEXTRA_SRC_MODULES
SRC_URI="${SRC_URI} )"
fi

KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~loong ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="cjk X doc source tk +luajittex xetex xindy"

TEXMF_PATH=/usr/share/texmf-dist

MODULAR_X_DEPEND="
	X? (
		x11-libs/libX11
		x11-libs/libXmu
	)"

COMMON_DEPEND="
	${MODULAR_X_DEPEND}
	!app-text/epspdf
	!app-text/pdfjam
	sys-libs/zlib
	>=media-libs/harfbuzz-1.4.5:=[icu,graphite]
	>=media-libs/libpng-1.2.43-r2:0=
	media-libs/gd[png]
	media-gfx/graphite2:=
	media-gfx/potrace:=
	>=x11-libs/cairo-1.12
	>=x11-libs/pixman-0.18
	dev-libs/zziplib:=
	app-text/libpaper:=
	dev-libs/gmp:=
	dev-libs/mpfr:=
	>=dev-libs/ptexenc-1.4.3
	xetex? (
		>=app-text/teckit-2.5.3
		media-libs/fontconfig
	)
	xindy? ( dev-lisp/clisp:= )
	media-libs/freetype:2
	>=dev-libs/icu-50:=
	>=dev-libs/kpathsea-6.3.2:=
"

BDEPEND="
	sys-apps/ed
	sys-devel/flex
	virtual/pkgconfig
"

DEPEND="
	${COMMON_DEPEND}
"

RDEPEND="
	${COMMON_DEPEND}
	>=app-text/ps2pkm-1.8_p20230311
	>=app-text/dvipsk-2023.1_p20230311
	>=dev-tex/bibtexu-4.00_p20230311
	virtual/perl-Getopt-Long
	dev-perl/File-HomeDir
	dev-perl/Log-Dispatch
	dev-perl/Unicode-LineBreak
	dev-perl/YAML-Tiny
	tk? (
		dev-lang/tk
		dev-perl/Tk
	)
"

S="${WORKDIR}/${MY_P}"
BUILDDIR="${WORKDIR}/${P}_build"

src_unpack() {
	default

	mkdir -p "${BUILDDIR}" || die "failed to create build dir"
}

RELOC_TARGET=texmf-dist

src_prepare() {
	cd "${WORKDIR}" || die

	# mv texlive.tlpdb tlpkg/ || die "failed to move texlive.tlpdb"

	# From texlive-module.eclass.
	sed -n -e 's:\s*RELOC/::p' tlpkg/tlpobj/* > "${T}/reloclist" || die
	sed -e 's/\/[^/]*$//' -e "s:^:${RELOC_TARGET}/:" "${T}/reloclist" |
		sort -u |
		xargs mkdir -p || die
	local i
	while read -r i; do
		mv "${i}" "${RELOC_TARGET}/${i%/*}" || die
	done < "${T}/reloclist"
	mv "${WORKDIR}"/texmf* "${S}" || die "failed to move texmf files"

	cd "${S}" || die

	sed -i \
		-e "s,/usr/include /usr/local/include.*echo \$KPATHSEA_INCLUDES.*,$(pkg-config kpathsea --variable=includedir)\"," \
		texk/web2c/configure || die

	# eapply "${WORKDIR}"/patches
	# eapply "${FILESDIR}"/${P}-cairo-strings.patch
	# eapply "${FILESDIR}"/${P}-slibtool.patch
	# eapply "${FILESDIR}"/${P}-clang-16.patch
	# eapply "${WORKDIR}"/${P}-CVE-2023-32700.patch

	eapply "${DISTDIR}/texlive-2023-drop-luazlip-version-check.patch"

	default

	elibtoolize

	# Drop this on 2022 bump!
	"${S}"/reautoconf libs/cairo || die
}

src_configure() {
	# It fails on alpha without this
	use alpha && append-ldflags "-Wl,--no-relax"

	# Too many regexps use A-Z a-z constructs, what causes problems with locales
	# that don't have the same alphabetical order than ascii. Bug #242430
	# So we set LC_ALL to C in order to avoid problems.
	export LC_ALL=C

	# Disable freetype-config as this is considered obsolete.
	# Also only pkg-config works for prefix as described in bug #690094
	export ac_cv_prog_ac_ct_FT2_CONFIG=no

	# revisit/upstream once we bump to 2022, bug #882245
	append-cppflags -D_GNU_SOURCE

	tc-export CC CXX AR RANLIB
	myconf=(
		--disable-native-texlive-build
		--enable-shared
		--disable-static
		--with-banner-add="/Gentoo Linux"

		--with-system-freetype2
		--with-system-zlib
		--with-system-libpng
		--with-system-teckit
		--with-teckit-includes="${EPREFIX}"/usr/include/teckit
		--with-system-kpathsea
		--with-kpathsea-includes="${EPREFIX}"/usr/include
		--with-system-icu
		--with-system-ptexenc
		--with-system-harfbuzz
		--with-system-graphite2
		--with-system-cairo
		--with-system-pixman
		--with-system-zziplib
		--with-system-libpaper
		--with-system-gmp
		--with-system-gd
		--with-system-mpfr
		--with-system-potrace
		# --with-system-xpdf
		--without-texinfo
		--disable-dialog
		--disable-multiplatform
		--enable-chktex
		--enable-epsfwin
		--enable-detex
		--enable-dvi2tty
		--enable-mftalkwin
		--enable-regiswin
		--enable-tektronixwin
		--enable-unitermwin
		--enable-vlna
		--with-ps=gs
		--disable-psutils
		--disable-t1utils
		--enable-ipc
		--disable-biber
		--disable-bibtex-x
		--disable-dvipng
		--disable-dvipsk
		--disable-lcdf-typetools
		--disable-ps2pk
		--disable-ttf2pk2
		--disable-tex4htk
		--disable-cjkutils
		--disable-xdvik
		--enable-luatex
		--disable-dvisvgm
		--disable-ps2eps
		--disable-largefile
		--disable-build-in-source-tree
		--disable-xindy-docs
		--disable-xindy-rules
		"$(use_enable luajittex)"
		"$(use_enable luajittex luajithbtex)"
		"$(use_enable luajittex mfluajit)"
		"$(use_enable xetex)"
		"$(use_enable cjk dviout-util)"
		# "$(use_enable cjk ptex)"
		"$(use_enable cjk eptex)"
		# "$(use_enable cjk uptex)"
		"$(use_enable cjk euptex)"
		"$(use_enable cjk mendexk)"
		"$(use_enable cjk makejvf)"
		"$(use_enable cjk pmp)"
		"$(use_enable cjk upmp)"
		"$(use_enable tk texdoctk)"
		"$(use_with X x)"
		"$(use_enable xindy)"

		--enable-ptex=no
		--enable-uptex=no

		--enable-autosp=yes
		--enable-axodraw2=yes
		--enable-devnag=yes
		--enable-lacheck=yes
		--enable-m-tx=yes
		--enable-pmx=yes
		--enable-tpic2pdftex=yes
		--with-clisp-runtime=system
		--enable-xml2pmx=yes
		--enable-xpdfopen=yes
		--enable-web2c=yes
		--enable-afm2pl=yes
		--enable-dtl=yes
		--enable-dvidvi=yes
		--enable-dviljk=yes
		--enable-dvipdfm-x=yes
		--enable-dvipos=yes
		--enable-gregorio=yes
		--enable-gsftopk=yes
		--enable-makeindexk=yes
		--enable-musixtnt=yes
		--enable-seetexk=yes
		--enable-ttfdump=yes
		--enable-upmendex=yes
		--enable-texlive=yes

		--enable-linked-scripts=no
		# web2c afm2pl chktex detex dtl dvi2tty dvidvi dviljk dviout-util dvipdfm-x dvipos gregorio gsftopk makeindexk makejvf mendexk musixtnt seetexk ttfdump upmendex texlive
	)
	cd "${BUILDDIR}" || die
	ECONF_SOURCE="${S}" \
		econf -C \
		--bindir="${EPREFIX}"/usr/bin \
		--datadir="${BUILDDIR}" \
		"${myconf[@]}"
}

src_compile() {
	cd "${BUILDDIR}" || die
	tc-export CC CXX AR RANLIB

	emake AR="$(tc-getAR)" SHELL="${EPREFIX}"/bin/sh texmf="${EPREFIX}"${TEXMF_PATH:-/usr/share/texmf-dist}

	cd "${S}" || die
	# Mimic updmap --syncwithtrees to enable only fonts installed
	# Code copied from updmap script
	while read -r i; do
		texlive-common_is_file_present_in_texmf "${i}" || echo "${i}"
	done > "${T}/updmap_update" < <(grep -E '^(Mixed|Kanji)?Map' "texmf-dist/web2c/updmap.cfg" | sed 's@.* @@')
	{
		sed 's@/@\\/@g; s@^@/^MixedMap[     ]*@; s@$@$/s/^/#! /@' <"${T}/updmap_update"
		sed 's@/@\\/@g; s@^@/^Map[  ]*@; s@$@$/s/^/#! /@' <"${T}/updmap_update"
		sed 's@/@\\/@g; s@^@/^KanjiMap[     ]*@; s@$@$/s/^/#! /@' <"${T}/updmap_update"
	} > "${T}/updmap_update2"
	sed -f "${T}/updmap_update2" "texmf-dist/web2c/updmap.cfg" >	"${T}/updmap_update3"\
		&& cat "${T}/updmap_update3" > "texmf-dist/web2c/updmap.cfg"
}

src_install() {
	cd "${BUILDDIR}" || die
	dodir ${TEXMF_PATH:-/usr/share/texmf-dist}/web2c

	emake DESTDIR="${D}" texmf="${ED}${TEXMF_PATH:-/usr/share/texmf-dist}" run_texlinks="true" run_mktexlsr="true" install

	cd "${S}" || die
	dodir /usr/share # just in case
	cp -pR texmf-dist "${ED}/usr/share/" || die "failed to install texmf trees"
	cp -pR "${WORKDIR}"/tlpkg "${ED}/usr/share/" || die "failed to install tlpkg files"

	# When X is disabled mf-nowin doesn't exist but some scripts expect it to
	# exist. Instead, it is called mf, so we symlink it to please everything.
	use X || dosym mf /usr/bin/mf-nowin

	docinto texk
	cd "${S}/texk" || die
	dodoc ChangeLog README

	docinto dviljk
	cd "${S}/texk/dviljk" || die
	dodoc ChangeLog README NEWS

	docinto makeindexk
	cd "${S}/texk/makeindexk" || die
	dodoc ChangeLog NOTES README

	docinto web2c
	cd "${S}/texk/web2c" || die
	dodoc ChangeLog NEWS PROJECTS README

	use doc || rm -rf "${ED}/usr/share/texmf-dist/doc"

	dodir /etc/env.d
	echo 'CONFIG_PROTECT_MASK="/etc/texmf/web2c /etc/texmf/language.dat.d /etc/texmf/language.def.d /etc/texmf/updmap.d"' > "${ED}/etc/env.d/98texlive"
	# populate /etc/texmf
	keepdir /etc/texmf/web2c

	# take care of updmap.cfg and language.d files
	keepdir /etc/texmf/{updmap.d,language.dat.d,language.def.d,language.dat.lua.d}

	mv "${ED}${TEXMF_PATH}/web2c/updmap.cfg" "${ED}/etc/texmf/updmap.d/00updmap.cfg" || die "moving updmap.cfg failed"

	# Remove fmtutil.cnf, it will be regenerated from /etc/texmf/fmtutil.d files
	# by texmf-update
	rm -f "${ED}${TEXMF_PATH}/web2c/fmtutil.cnf" || die
	# Remove bundled and invalid updmap.cfg
	rm -f "${ED}/usr/share/texmf-dist/web2c/updmap.cfg" || die

	rm -f "${ED}/usr/bin/"{,u}ptex

	[[ -n ${TEXLIVE_MODULE_BINSCRIPTS} ]] && dobin_texmf_scripts ${TEXLIVE_MODULE_BINSCRIPTS}
	if [[ -n ${TEXLIVE_MODULE_BINLINKS} ]] ; then
		dodir "/usr/bin"
		for i in ${TEXLIVE_MODULE_BINLINKS} ; do
			[[ -f ${ED}/usr/bin/${i%:*} ]] || die "Trying to install an invalid BINLINK ${i%:*}. This should not happen. Please file a bug."
			dosym "${i%:*}" "/usr/bin/${i#*:}"
		done
	fi

	texlive-common_handle_config_files

	keepdir /usr/share/texmf-site

	# the virtex symlink is not installed
	# The links has to be relative, since the targets
	# is not present at this stage and MacOS doesn't
	# like non-existing targets
	dosym tex /usr/bin/virtex
	dosym pdftex /usr/bin/pdfvirtex

	find "${ED}" -name '*.la' -delete || die
}

pkg_postinst() {
	etexmf-update

	einfo "Regenerating TeX formats"
	fmtutil-sys --all &> /dev/null

	elog
	elog "If you have configuration files in ${EPREFIX}/etc/texmf to merge,"
	elog "please update them and run ${EPREFIX}/usr/sbin/texmf-update."
	elog

	local display_migration_hint=false
	if [[ -n ${REPLACING_VERSIONS} ]]; then
		local new_texlive_version
		local replaced_version
		new_texlive_version=$(ver_cut 1)
		for replaced_version in ${REPLACING_VERSIONS}; do
			replaced_version=$(ver_cut 1 "${replaced_version}")
			if ver_test "${replaced_version}" -lt "${new_texlive_version}" ; then
				display_migration_hint=true
				break
			fi
		done
	fi

	if ! ${display_migration_hint}; then
		return
	fi

	ewarn "If you are migrating from an older TeX distribution"
	ewarn "Please make sure you have read:"
	ewarn "https://wiki.gentoo.org/wiki/Project:TeX/Tex_Live_Migration_Guide"
	ewarn "in order to avoid possible problems"
}
