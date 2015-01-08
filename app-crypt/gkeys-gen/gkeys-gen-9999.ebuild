# Copyright 2014-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-crypt/gkeys/gkeys-9999.ebuild,v 1.2 2014/12/25 20:58:50 dolsen Exp $

EAPI="5"

PYTHON_COMPAT=(python{2_7,3_3,3_4})

EGIT_BRANCH="master"
#EGIT_BRANCH="gen-update"

inherit distutils-r1 git-r3

#EGIT_REPO_URI="git://git.overlays.gentoo.org/proj/gentoo-keys.git"
EGIT_REPO_URI="https://github.com/gentoo/gentoo-keys.git"

DESCRIPTION="A Openpgp/gpg key management program and python libs"
HOMEPAGE="https://wiki.gentoo.org/wiki/Project:Gentoo-keys"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
IUSE=""

KEYWORDS=""

DEPEND=""
RDEPEND="${DEPEND}
	app-crypt/gnupg
	dev-python/snakeoil[${PYTHON_USEDEP}]
	dev-python/pygpgme[${PYTHON_USEDEP}]
	=app-crypt/gkeys-9999[${PYTHON_USEDEP}]
	"

S="${WORKDIR}/$P/gkeys-gen"

python_prepare_all() {
	distutils-r1_python_prepare_all
	# copy these 2 into our subdir from the master level
	cp ../LICENSE ./ || die "cp LICENSE failed"
	cp ../README.md ./ || die "cp README.me failed"
}

pkg_postinst() {
	einfo
	einfo "This is experimental software."
	einfo "The API's it installs should be considered unstable"
	einfo "and are subject to change."
	einfo
	einfo "Please file any enhancement requests, or bugs"
	einfo "at https://bugs.gentoo.org"
	einfo "We are also on IRC @ #gentoo-keys of the freenode network"
	einfo
	ewarn "There may be some python 3 compatibility issues still."
	ewarn "Please help debug/fix/report them in bugzilla."
}
