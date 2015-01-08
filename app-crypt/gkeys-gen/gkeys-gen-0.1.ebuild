# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-crypt/gkeys/gkeys-9999.ebuild,v 1.2 2014/12/25 20:58:50 dolsen Exp $

EAPI="5"

PYTHON_COMPAT=(python{2_7,3_3,3_4})

inherit distutils-r1

DESCRIPTION="Tool for generating OpenPGP/GPG keys using a specifications file"
HOMEPAGE="https://wiki.gentoo.org/wiki/Project:Gentoo-keys"
SRC_URI="http://dev.gentoo.org/~dolsen/releases/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	app-crypt/gnupg
	dev-python/snakeoil[${PYTHON_USEDEP}]
	dev-python/pygpgme[${PYTHON_USEDEP}]
	=app-crypt/gkeys-0.1[${PYTHON_USEDEP}]
	"

pkg_postinst() {
	einfo "This is experimental software."
	einfo "The API's it installs should be considered unstable"
	einfo "and are subject to change."
	einfo
	einfo "Please file any enhancement requests, or bugs"
	einfo "at https://bugs.gentoo.org"
	einfo "We are also on IRC @ #gentoo-keys of the Freenode network"
	einfo
	ewarn "There may be some Python 3 compatibility issues still."
	ewarn "Please help us debug, fix and report them in Bugzilla."
}
