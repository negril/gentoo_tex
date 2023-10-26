# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TL_PV="2023"
TEXLIVE_MODULE_CONTENTS="
	baekmuk.r56915
	cjk-ko.r67252
	collection-langcjk.r65824
	kotex-oblivoir.r66513
	kotex-plain.r63689
	kotex-utf.r63690
	kotex-utils.r38727
	lshort-korean.r58468
	nanumtype1.r29558
	pmhanguljamo.r66361
	uhc.r16791
	unfonts-core.r56291
	unfonts-extra.r56291
	collection-langkorean.r54074
"
TEXLIVE_MODULE_DOC_CONTENTS="
	baekmuk.doc.r56915
	cjk-ko.doc.r67252
	kotex-oblivoir.doc.r66513
	kotex-plain.doc.r63689
	kotex-utf.doc.r63690
	kotex-utils.doc.r38727
	lshort-korean.doc.r58468
	nanumtype1.doc.r29558
	pmhanguljamo.doc.r66361
	uhc.doc.r16791
	unfonts-core.doc.r56291
	unfonts-extra.doc.r56291
"
TEXLIVE_MODULE_SRC_CONTENTS=""
inherit texlive-module
DESCRIPTION="TeXLive Korean"
RESTRICT="mirror"

LICENSE="FDL-1.3 GPL-1 GPL-2 LPPL-1.3 LPPL-1.3c OFL TeX-other-free public-domain"
SLOT="0/2023"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~loong ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x64-solaris"
DEPEND="
	>=dev-texlive/texlive-langcjk-2019
"
RDEPEND="
	${DEPEND}
"

TEXLIVE_MODULE_BINSCRIPTS="texmf-dist/scripts/kotex-utils/komkindex.pl texmf-dist/scripts/kotex-utils/jamo-normalize.pl texmf-dist/scripts/kotex-utils/ttf2kotexfont.pl"
