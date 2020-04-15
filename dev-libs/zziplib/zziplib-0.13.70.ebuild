# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit cmake flag-o-matic python-any-r1

DESCRIPTION="Lightweight library for extracting data from files archived in a single zip file"
HOMEPAGE="http://zziplib.sourceforge.net/ https://github.com/gdraheim/zziplib"
SRC_URI="https://github.com/gdraheim/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( LGPL-2.1 MPL-1.1 )"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="doc sdl static-libs test"

RDEPEND="
	sys-libs/zlib
	sdl? ( >=media-libs/libsdl-1.2.6 )"
DEPEND="${RDEPEND}
	${PYTHON_DEPS}
	virtual/pkgconfig
	test? ( app-arch/zip )"

PATCHES=( "${FILESDIR}"/${P}_20200416.patch )

src_prepare() {
	cmake_src_prepare

	python_fix_shebang .
}

src_configure() {
	local mycmakeargs=(
		-DZZIPCOMPAT=OFF
		-DZZIPSDL=$(usex sdl ON OFF)
		-DBUILD_STATIC_LIBS=$(usex static-libs ON OFF)
		-DBASH=/bin/bash
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install

	# fowners fails when we don't have enough permissions (Prefix)
	if [[ ${EUID} == 0 ]] ; then
		fowners -R root /usr/share/man #321975
	fi

	find "${ED}" -name "*.la" -delete || die

	if use doc ; then
		docinto html
		dodoc -r docs/*
	fi
}

src_test() {
	# need this because `make test` will always return true
	# tests fail with -j > 1 (bug #241186)
	emake -j1 check
}
