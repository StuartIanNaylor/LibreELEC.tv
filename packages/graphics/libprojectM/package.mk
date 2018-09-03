# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libprojectM"
PKG_VERSION="8f442c5b17af63e3584bfcd0e537b7814b599677"
PKG_SHA256="967634b830bc0025ef724a9ea4dc2ba4394f5a4d51484433b6d64fa0ee3e1dd0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/projectM-visualizer/projectm"
PKG_URL="https://github.com/projectM-visualizer/projectm/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="projectm-${PKG_VERSION}*"
PKG_DEPENDS_TARGET="toolchain freetype glm $OPENGL"
PKG_LONGDESC="a MilkDrop compatible opensource music visualizer"
PKG_TOOLCHAIN="configure"
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared \
                           --enable-static"

# workaround due broken release files, remove at next bump
pre_configure_target() {
  ./autogen.sh
}
