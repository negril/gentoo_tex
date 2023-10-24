# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TEXLIVE_MODULE_CONTENTS="
	aleph.r66203
	antomega.r21933
	collection-basic.r59159
	collection-latex.r63515
	edmac.r61719
	eplain.r64721
	hitex.r66924
	jadetex.r67493
	lambda.r45756
	lollipop.r67930
	mltex.r62145
	mxedruli.r30021
	omega.r33046
	omegaware.r66186
	otibet.r45777
	passivetex.r15878
	psizzl.r15878
	startex.r35718
	texsis.r67930
	xmltex.r62145
	xmltexconfig.r45845
	collection-formatsextra.r62226
"
TEXLIVE_MODULE_DOC_CONTENTS="
	aleph.doc.r66203
	antomega.doc.r21933
	edmac.doc.r61719
	eplain.doc.r64721
	hitex.doc.r66924
	jadetex.doc.r67493
	lollipop.doc.r67930
	mltex.doc.r62145
	mxedruli.doc.r30021
	omega.doc.r33046
	omegaware.doc.r66186
	otibet.doc.r45777
	psizzl.doc.r15878
	startex.doc.r35718
	texsis.doc.r67930
	xmltex.doc.r62145
"
TEXLIVE_MODULE_SRC_CONTENTS="
	antomega.source.r21933
	edmac.source.r61719
	eplain.source.r64721
	jadetex.source.r67493
	otibet.source.r45777
	psizzl.source.r15878
	startex.source.r35718
"
inherit texlive-module
DESCRIPTION="TeXLive Additional formats"
RESTRICT="mirror"

LICENSE="GPL-1 GPL-2 GPL-3 LPPL-1.3 MIT TeX TeX-other-free public-domain"
SLOT="0/2023"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~loong ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x64-solaris"
DEPEND="
	>=dev-texlive/texlive-basic-2019
	>=dev-texlive/texlive-latex-2019
	dev-texlive/texlive-xetex
"
RDEPEND="
	${DEPEND}
"
