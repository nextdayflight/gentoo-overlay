# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Tools for generating DVD files to be played on standalone DVD players"
HOMEPAGE="http://dvdauthor.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

DEPEND="
	media-libs/libdvdread
	media-libs/libpng
	|| (
		>=media-gfx/imagemagick-5.5.7.14
		media-gfx/graphicsmagick[imagemagick]
	)
	media-libs/fontconfig
	dev-libs/fribidi
	media-libs/freetype
	>=dev-libs/libxml2-2.6.0
	app-text/docbook-sgml-utils
	dev-util/pkgconfig
	sys-devel/gettext
	"

S=${WORKDIR}/${PN}

src_configure() {
	econf \
		--enable-largefile \
		--disable-dependency-tracking \
		--disable-localize-filenames \
		--disable-rpath \
		--disable-xmltest
}

src_install() {
	make install DESTDIR="${D}" || die
	dodoc AUTHORS ChangeLog README TODO || die
}
