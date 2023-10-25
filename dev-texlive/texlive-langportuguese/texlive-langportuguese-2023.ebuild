# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TEXLIVE_MODULE_CONTENTS="
	babel-portuges.r59883
	beamer-tut-pt.r15878
	collection-basic.r59159
	cursolatex.r24139
	feupphdteses.r30962
	hyphen-portuguese.r58609
	latex-via-exemplos.r68627
	latexcheat-ptbr.r15878
	lshort-portuguese.r55643
	numberpt.r51640
	ordinalpt.r15878
	ptlatexcommands.r67125
	xypic-tut-pt.r15878
	collection-langportuguese.r67125
"
TEXLIVE_MODULE_DOC_CONTENTS="
	babel-portuges.doc.r59883
	beamer-tut-pt.doc.r15878
	cursolatex.doc.r24139
	feupphdteses.doc.r30962
	latex-via-exemplos.doc.r68627
	latexcheat-ptbr.doc.r15878
	lshort-portuguese.doc.r55643
	numberpt.doc.r51640
	ordinalpt.doc.r15878
	ptlatexcommands.doc.r67125
	xypic-tut-pt.doc.r15878
"
TEXLIVE_MODULE_SRC_CONTENTS="
	babel-portuges.source.r59883
	numberpt.source.r51640
	ordinalpt.source.r15878
	ptlatexcommands.source.r67125
"
inherit texlive-module
DESCRIPTION="TeXLive Portuguese"
RESTRICT="mirror"

LICENSE="GPL-1 GPL-2 LPPL-1.3 LPPL-1.3c MIT public-domain"
SLOT="0/2023"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~loong ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x64-solaris"
DEPEND="
	>=dev-texlive/texlive-basic-2019
"
RDEPEND="
	${DEPEND}
"
