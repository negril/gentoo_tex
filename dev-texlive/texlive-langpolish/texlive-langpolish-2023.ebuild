# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TEXLIVE_MODULE_CONTENTS="
	babel-polish.r62680
	bredzenie.r44371
	cc-pl.r58602
	collection-basic.r59159
	collection-latex.r63515
	gustlib.r54074
	gustprog.r54074
	hyphen-polish.r58609
	lshort-polish.r63289
	mex.r58661
	mwcls.r44352
	pl.r58661
	polski.r60322
	przechlewski-book.r23552
	qpxqtx.r45797
	tap.r31731
	tex-virtual-academy-pl.r67718
	texlive-pl.r66576
	utf8mex.r15878
	collection-langpolish.r54074
"
TEXLIVE_MODULE_DOC_CONTENTS="
	babel-polish.doc.r62680
	bredzenie.doc.r44371
	cc-pl.doc.r58602
	gustlib.doc.r54074
	gustprog.doc.r54074
	lshort-polish.doc.r63289
	mex.doc.r58661
	mwcls.doc.r44352
	pl.doc.r58661
	polski.doc.r60322
	przechlewski-book.doc.r23552
	qpxqtx.doc.r45797
	tap.doc.r31731
	tex-virtual-academy-pl.doc.r67718
	texlive-pl.doc.r66576
	utf8mex.doc.r15878
"
TEXLIVE_MODULE_SRC_CONTENTS="
	babel-polish.source.r62680
	mex.source.r58661
	mwcls.source.r44352
	polski.source.r60322
"
inherit texlive-module
DESCRIPTION="TeXLive Polish"
RESTRICT="mirror"

LICENSE="FDL-1.3 GPL-2 LPPL-1.2 LPPL-1.3 LPPL-1.3c TeX public-domain"
SLOT="0/2023"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~loong ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x64-solaris"
DEPEND="
	>=dev-texlive/texlive-latex-2019
	>=dev-texlive/texlive-basic-2019
"
RDEPEND="
	${DEPEND}
"
