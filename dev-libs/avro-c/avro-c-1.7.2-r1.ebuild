# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit cmake-utils eutils subversion

DESCRIPTION=""
HOMEPAGE="http://avro.apache.org/"
SRC_URI=""
ESVN_REPO_URI="http://svn.apache.org/repos/asf/avro/trunk/lang/c@r1386906"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64-linux ~x86-linux ~amd64 ~x86 ~x64-macos"
IUSE=""

DEPEND="dev-util/cmake
!dev-python/avrocat
"
RDEPEND="${DEPEND}"

src_prepare() {
	echo "${PV}-SNAPSHOT" > VERSION.txt
}

src_configure() {
	mycmakeargs=(
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
	)

	cmake-utils_src_configure
}
