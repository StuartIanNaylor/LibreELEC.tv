################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="tinyxml2"
PKG_VERSION="3.0.0"
PKG_SHA256="128aa1553e88403833e0cccf1b651f45ce87bc207871f53fdcc8e7f9ec795747"
PKG_ARCH="any"
PKG_LICENSE="zlib"
PKG_SITE="http://www.grinninglizard.com/tinyxml2/index.html"
PKG_URL="https://github.com/leethomason/tinyxml2/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="textproc"
PKG_SHORTDESC="tinyxml2: XML parser library"
PKG_LONGDESC="TinyXML2 is a simple, small, C++ XML parser that can be easily integrating into other programs."

PKG_CMAKE_OPTS_TARGET="-DBUILD_SHARED_LIBS=off -DBUILD_STATIC_LIBS=on"

pre_configure_target() {
  export CFLAGS="$CFLAGS -fPIC"
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr
}
