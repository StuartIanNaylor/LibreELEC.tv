# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="aom"
PKG_VERSION="e1cbb13df2493a30778dae04e0728a1b45f892c7"
PKG_SHA256="b6710a9c5c1d7d46adf2c34c4188c87aac15d71c49d06b6351adc2e3addd51dd"
PKG_ARCH="any"
PKG_LICENSE="BSD"
PKG_SITE="https://www.webmproject.org"
PKG_URL="http://repo.or.cz/aom.git/snapshot/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="AV1 Codec Library"

PKG_CMAKE_OPTS_TARGET="-DENABLE_CCACHE=1 \
                       -DENABLE_DOCS=0 \
                       -DENABLE_TOOLS=0"
