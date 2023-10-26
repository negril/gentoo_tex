# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TL_PV="2023"
TEXLIVE_MODULE_CONTENTS="
	accfonts.r18835
	afm2pl.r66186
	albatross.r65647
	collection-basic.r59159
	dosepsbin.r29752
	dvipsconfig.r13293
	epstopdf.r68301
	fontinst.r62517
	fontools.r68285
	fontware.r66186
	lcdftypetools.r52851
	luafindfont.r67468
	metatype1.r37105
	mf2pt1.r61217
	ps2eps.r62856
	ps2pk.r66186
	psutils.r61719
	t1utils.r57972
	collection-fontutils.r61207
"
TEXLIVE_MODULE_DOC_CONTENTS="
	accfonts.doc.r18835
	afm2pl.doc.r66186
	albatross.doc.r65647
	dosepsbin.doc.r29752
	epstopdf.doc.r68301
	fontinst.doc.r62517
	fontools.doc.r68285
	fontware.doc.r66186
	lcdftypetools.doc.r52851
	luafindfont.doc.r67468
	mf2pt1.doc.r61217
	ps2eps.doc.r62856
	ps2pk.doc.r66186
	psutils.doc.r61719
	t1utils.doc.r57972
"
TEXLIVE_MODULE_SRC_CONTENTS="
	albatross.source.r65647
	dosepsbin.source.r29752
	fontinst.source.r62517
	metatype1.source.r37105
"
inherit texlive-module
DESCRIPTION="TeXLive Graphics and font utilities"
RESTRICT="mirror"

LICENSE="Artistic BSD GPL-1 GPL-2 LPPL-1.3 LPPL-1.3c TeX TeX-other-free public-domain"
SLOT="0/2023"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~loong ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x64-solaris"
DEPEND="
	>=dev-texlive/texlive-basic-2019
"
RDEPEND="
	${DEPEND}
"

TEXLIVE_MODULE_BINSCRIPTS="
	texmf-dist/scripts/accfonts/mkt1font
	texmf-dist/scripts/accfonts/vpl2ovp
	texmf-dist/scripts/accfonts/vpl2vpl
	texmf-dist/scripts/epstopdf/epstopdf.pl
	texmf-dist/scripts/fontools/afm2afm
	texmf-dist/scripts/fontools/autoinst
	texmf-dist/scripts/fontools/ot2kpx
	texmf-dist/scripts/mf2pt1/mf2pt1.pl
	texmf-dist/scripts/dosepsbin/dosepsbin.pl
	texmf-dist/scripts/texlive-extra/fontinst.sh
"
TEXLIVE_MODULE_BINLINKS="
	epstopdf:repstopdf
"
