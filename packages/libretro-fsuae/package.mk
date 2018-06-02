################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2018-present Team LibreELEC
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

PKG_NAME="libretro-fsuae"
PKG_VERSION="7990f7a"
PKG_SHA256="ad8a499e86ad782a0ecbdc4452c7fb70e1fabff42a2e5fbb081ec1b1f314a897"
PKG_ARCH="none"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/libretro-fsuae"
PKG_URL="https://github.com/libretro/libretro-fsuae/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="$PKG_NAME-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain kodi-platform zlib"
PKG_SECTION="emulation"
PKG_LONGDESC="game.libretro.fsuae: fsuae for Kodi"
PKG_TOOLCHAIN="configure"

PKG_LIBNAME="fsuae_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"
PKG_LIBVAR="FSUAE_LIB"

PKG_CONFIGURE_OPTS_TARGET="--without-libmpeg2"

pre_configure_target() {
  ./autogen.sh
  export CFLAGS="$CFLAGS -I$SYSROOT_PREFIX/usr/include"
}

make_target() {
  make
}

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME
  cp $PKG_LIBPATH $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME
  echo "set($PKG_LIBVAR $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME)" > $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME/$PKG_NAME-config.cmake
}
