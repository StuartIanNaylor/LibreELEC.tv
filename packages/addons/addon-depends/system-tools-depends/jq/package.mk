################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2016-present Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="jq"
PKG_VERSION="1.6rc1"
PKG_SHA256="1273c34c8db9c33870c559f475247771139d008d9266c673c13111acab3a77d4"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="http://stedolan.github.io/jq/"
PKG_URL="https://github.com/stedolan/jq/archive/jq-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="jq-jq-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain oniguruma"
PKG_SECTION="tools"
PKG_LONGDESC="jq is a lightweight and flexible command-line JSON processor."
PKG_TOOLCHAIN="configure"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared \
                           --enable-static \
                           --disable-docs \
                           --disable-maintainer-mode"

pre_configure_target() {
  LIBS="$LIBS -lm"
  LDFLAGS="$LDFLAGS -lm"
  CFFLAGS="$CFFLAGS -lm"
#  cp -RP $(get_build_dir oniguruma)/* $PKG_BUILD/modules/oniguruma
  autoreconf -fi
  
}

makeinstall_target() {
  :
}
