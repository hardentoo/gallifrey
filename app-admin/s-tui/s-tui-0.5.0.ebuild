# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="ncurses"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3 distutils-r1
	EGIT_REPO_URI="https://github.com/amanusk/${PN}.git"
else
	inherit distutils-r1
	SRC_URI="https://github.com/amanusk/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Stress-Terminal UI monitoring tool"
HOMEPAGE="https://amanusk.github.io/s-tui"

LICENSE="GPL-2"
SLOT="0"
IUSE="stress"

RDEPEND="dev-python/urwid[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	stress? ( app-benchmarks/stress )"
