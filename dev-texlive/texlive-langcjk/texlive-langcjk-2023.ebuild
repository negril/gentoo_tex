# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TEXLIVE_MODULE_CONTENTS="
	adobemapping.r66552
	c90.r60830
	cjk.r60865
	cjk-gs-integrate.r59705
	cjkpunct.r41119
	cjkutils.r60833
	collection-basic.r59159
	dnp.r54074
	evangelion-jfm.r68059
	fixjfm.r63967
	garuda-c90.r60832
	jfmutil.r60987
	norasi-c90.r60831
	pxtatescale.r63967
	xcjk2uni.r54958
	xecjk.r64059
	zitie.r60676
	zxjafont.r62864
	collection-langcjk.r65824
"
TEXLIVE_MODULE_DOC_CONTENTS="
	c90.doc.r60830
	cjk.doc.r60865
	cjk-gs-integrate.doc.r59705
	cjkpunct.doc.r41119
	cjkutils.doc.r60833
	evangelion-jfm.doc.r68059
	fixjfm.doc.r63967
	jfmutil.doc.r60987
	pxtatescale.doc.r63967
	xcjk2uni.doc.r54958
	xecjk.doc.r64059
	zitie.doc.r60676
	zxjafont.doc.r62864
"
TEXLIVE_MODULE_SRC_CONTENTS="
	c90.source.r60830
	cjk.source.r60865
	cjk-gs-integrate.source.r59705
	cjkpunct.source.r41119
	evangelion-jfm.source.r68059
	garuda-c90.source.r60832
	norasi-c90.source.r60831
	xcjk2uni.source.r54958
	xecjk.source.r64059
"
inherit texlive-module
DESCRIPTION="TeXLive Chinese/Japanese/Korean (base)"
RESTRICT="mirror"

LICENSE="BSD GPL-2 GPL-3 LPPL-1.3 LPPL-1.3c MIT TeX"
SLOT="0/2023"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~loong ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x64-solaris"
DEPEND="
	>=dev-texlive/texlive-basic-2019
	>=app-text/texlive-core-2010[cjk]
	>=dev-texlive/texlive-latex-2011
	>=dev-texlive/texlive-xetex-2023
"
RDEPEND="
	${DEPEND}
"

TEXLIVE_MODULE_BINSCRIPTS="texmf-dist/scripts/cjk-gs-integrate/cjk-gs-integrate.pl"
