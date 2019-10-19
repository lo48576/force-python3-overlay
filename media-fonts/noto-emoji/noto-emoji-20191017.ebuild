# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_7,3_{5,6,7}} )

inherit font python-any-r1

DESCRIPTION="Google Noto Emoji fonts"
HOMEPAGE="https://www.google.com/get/noto/ https://github.com/googlei18n/noto-emoji"

COMMIT="16151a2312a1f8a7d79e91789d3cfe24559d61f7"
SRC_URI="https://github.com/googlei18n/noto-emoji/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="${PYTHON_DEPS}
	app-arch/zopfli
	dev-python/fonttools
	dev-python/nototools
	media-gfx/pngquant
	x11-libs/cairo
	|| ( media-gfx/imagemagick[png] media-gfx/graphicsmagick[png] )
"
RDEPEND=""

RESTRICT="binchecks strip"

S="${WORKDIR}/${PN}-${COMMIT}"

FONT_S="${S}"
FONT_SUFFIX="ttf"

PATCHES=(
	# From Fedora
	"${FILESDIR}/${PN}-build-all-flags.patch"

	# https://github.com/googlei18n/noto-emoji/issues/240
	"${FILESDIR}/${PN}-20180823-build-path.patch"
)

src_prepare() {
	default

	# Based on Fedora patch to allow graphicsmagick usage
	if has_version media-gfx/graphicsmagick; then
		eapply "${FILESDIR}/${PN}-20190328-use-gm.patch"
	fi
}

src_install() {
	font_src_install

	# Don't lose fancy emoji icons
	insinto /usr/share/icons/"${PN}"/128x128/emotes/
	doins png/128/*.png

	insinto /usr/share/icons/"${PN}"/scalable/emotes/
	doins svg/*.svg
}
