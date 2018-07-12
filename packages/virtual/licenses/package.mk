# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="licenses"
PKG_VERSION="8651cf2"
PKG_SHA256="739e6345c7b263bf84eefd651e8ac8cd04b6b9d8dffb7ecdb238120a4dee237b"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="https://spdx.org/"
PKG_URL="https://github.com/spdx/license-list-data/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="license-list-data-$PKG_VERSION*"
PKG_DEPENDS_TARGET=""
PKG_LONGDESC="Various data formats for the SPDX License List"
PKG_TOOLCHAIN="manual"

post_unpack(){
  cd $PKG_BUILD
  mkdir -p le
  mv $PKG_BUILD/text/* $PKG_BUILD/le
}
