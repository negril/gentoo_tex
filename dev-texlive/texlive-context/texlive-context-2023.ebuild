# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

TEXLIVE_MODULE_CONTENTS="
	collection-basic.r59159
	context.r68525
	context-calendar-examples.r66947
	context-collating-marks.r66956
	context-cyrillicnumbers.r47085
	context-filter.r62070
	context-gnuplot.r47085
	context-handlecsv.r68150
	context-letter.r60787
	context-mathsets.r47085
	context-notes-zh-cn.r66725
	context-pocketdiary.r66953
	context-simpleslides.r67070
	context-squares.r68545
	context-sudoku.r67289
	context-texlive.r66924
	context-transliterator.r61127
	context-typescripts.r60422
	context-vim.r62071
	context-visualcounter.r47085
	jmn.r45751
	collection-context.r68545
"
TEXLIVE_MODULE_DOC_CONTENTS="
	context.doc.r68525
	context-calendar-examples.doc.r66947
	context-collating-marks.doc.r66956
	context-cyrillicnumbers.doc.r47085
	context-filter.doc.r62070
	context-gnuplot.doc.r47085
	context-handlecsv.doc.r68150
	context-letter.doc.r60787
	context-mathsets.doc.r47085
	context-notes-zh-cn.doc.r66725
	context-pocketdiary.doc.r66953
	context-simpleslides.doc.r67070
	context-squares.doc.r68545
	context-sudoku.doc.r67289
	context-transliterator.doc.r61127
	context-typescripts.doc.r60422
	context-vim.doc.r62071
	context-visualcounter.doc.r47085
"
TEXLIVE_MODULE_SRC_CONTENTS="
	context-visualcounter.source.r47085
"
inherit texlive-module
DESCRIPTION="TeXLive ConTeXt and packages"
RESTRICT="mirror"

LICENSE="BSD BSD-2 GPL-1 GPL-2 GPL-3 MIT TeX-other-free public-domain"
SLOT="0/2023"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~loong ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x64-solaris"
IUSE=""
DEPEND="
	>=dev-texlive/texlive-basic-2019
	>=dev-texlive/texlive-latex-2010
	>=app-text/texlive-core-2010[xetex]
	>=dev-texlive/texlive-metapost-2010
"
RDEPEND="
	${DEPEND}
	dev-lang/ruby
"

# This small hack is needed in order to have a sane upgrade path:
# the new TeX Live 2009 metapost produces this file but it is not recorded in
# any package; when running fmtutil (like texmf-update does) this file will be
# created and cause collisions.

pkg_setup() {
	if [ -f "${ROOT}/var/lib/texmf/web2c/metapost/metafun.log" ]; then
		einfo "Removing ${ROOT}/var/lib/texmf/web2c/metapost/metafun.log"
		rm -f "${ROOT}/var/lib/texmf/web2c/metapost/metafun.log"
	fi
}

# These comes without +x bit set...
src_prepare() {
	default
	# No need to install these .exe
	rm -rf texmf-dist/scripts/context/stubs/{mswin,win64} || die

}

TL_MODULE_INFORMATION="For using ConTeXt mkII simply use 'texexec' to generate
your documents.
If you plan to use mkIV and its 'context' command to generate your documents,
you have to run 'mtxrun --generate' as normal user before first use.

More information and advanced options on:
http://wiki.contextgarden.net/TeX_Live_2011"
