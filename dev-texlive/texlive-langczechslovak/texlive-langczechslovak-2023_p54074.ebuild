# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TL_PV="2023"
TEXLIVE_MODULE_CONTENTS="
	babel-czech.r30261
	babel-slovak.r30292
	cnbwp.r32550
	collection-basic.r59159
	collection-latex.r63515
	cs.r41553
	csbulletin.r65250
	cslatex.r67494
	csplain.r67934
	cstex.r64149
	hyphen-czech.r58609
	hyphen-slovak.r58609
	lshort-czech.r55643
	lshort-slovak.r15878
	texlive-cz.r62854
	collection-langczechslovak.r54074
"
TEXLIVE_MODULE_DOC_CONTENTS="
	babel-czech.doc.r30261
	babel-slovak.doc.r30292
	cnbwp.doc.r32550
	csbulletin.doc.r65250
	cstex.doc.r64149
	lshort-czech.doc.r55643
	lshort-slovak.doc.r15878
	texlive-cz.doc.r62854
"
TEXLIVE_MODULE_SRC_CONTENTS="
	babel-czech.source.r30261
	babel-slovak.source.r30292
	cslatex.source.r67494
"
inherit texlive-module
DESCRIPTION="TeXLive Czech/Slovak"
RESTRICT="mirror"

LICENSE="GPL-1 LPPL-1.3 LPPL-1.3c TeX-other-free"
SLOT="0/2023"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~loong ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x64-solaris"
DEPEND="
	>=dev-texlive/texlive-basic-2019
	>=dev-texlive/texlive-latex-2019
	>=app-text/texlive-core-2014[xetex]
	>=dev-texlive/texlive-luatex-2016
	>=dev-texlive/texlive-langenglish-2019
	>=dev-texlive/texlive-langeuropean-2019
	>=dev-texlive/texlive-langfrench-2019
	>=dev-texlive/texlive-langgerman-2019
	>=dev-texlive/texlive-langpolish-2019
	>=dev-texlive/texlive-langspanish-2019
	>=dev-texlive/texlive-langitalian-2019
"
RDEPEND="
	${DEPEND}
"
