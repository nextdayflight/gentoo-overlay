# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=2

inherit autotools

DESCRIPTION="Tools for generating DVD files to be played on standalone DVD players"
HOMEPAGE="http://dvdauthor.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="doc"

S="${WORKDIR}/${PN}"

DEPEND="dev-libs/fribidi
	>=dev-libs/libxml2-2.6.0
	media-libs/libdvdread
	|| ( >=media-gfx/imagemagick-5.5.7.14 media-gfx/graphicsmagick )
	media-libs/freetype
	media-libs/libpng
	sys-devel/gettext
	sys-libs/zlib
	virtual/libiconv
	doc? ( app-text/docbook-sgml-utils )"

src_prepare() {
	epatch "${FILESDIR}/${P}-gmagick138-599000.patch"

	if ! use doc ; then
		sed -i -e "s:doc::" Makefile.am
	fi

	eautoreconf
}

src_configure() {
	econf \
		--enable-largefile \
		--disable-dependency-tracking \
		--disable-rpath \
		--disable-xmltest
}

src_install() {
	make install DESTDIR="${D}" || die
	dodoc AUTHORS ChangeLog README TODO || die
}
