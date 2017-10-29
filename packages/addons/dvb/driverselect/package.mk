################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2017-present Team LibreELEC
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

PKG_NAME="driverselect"
PKG_VERSION="ca816da"
PKG_SHA256="7df68e23d1ca687747f77487d7f7db1fa6122b965cc0280ad660771b688a3889"
PKG_REV="100"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="https://libreelec.tv"
PKG_URL="https://github.com/b-jesch/script.program.driverselect/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="${PKG_SECTION}.${PKG_NAME}-${PKG_VERSION}*"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="script.program"
PKG_SHORTDESC="script.program.driverselect"
PKG_LONGDESC="script.program.driverselect"
PKG_AUTORECONF="no"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Driver Selector"
PKG_ADDON_TYPE="xbmc.python.script"

unpack() {
  mkdir -p $PKG_BUILD/addon
  tar --strip-components=1 -xf $SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz -C $PKG_BUILD/addon
}

make_target() {
  : # nothing to do here
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/kodi/addons/${PKG_SECTION}.${PKG_NAME}
  cp -rP $PKG_BUILD/addon/* $INSTALL/usr/share/kodi/addons/${PKG_SECTION}.${PKG_NAME}
}
