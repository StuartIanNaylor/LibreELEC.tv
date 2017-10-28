################################################################################
#      This file is part of LibreELEC - https://LibreELEC.tv
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

PKG_NAME="dvb.tbs"
PKG_VERSION="2017-10-27"
PKG_SHA256="0ef527a46855c9601d1ae92c39606d46784d0a3b2d63066a25868f312666ae0c"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/tbsdtv/linux_media"
#PKG_URL="$DISTRO_SRC/dvb.tbs-$PKG_VERSION.tar.xz"
PKG_URL="http://sources.libreelec.tv/devel/dvb.tbs-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_BUILD_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_SECTION="driver"
PKG_LONGDESC="DVB driver for TBS cards."
PKG_AUTORECONF="no"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="DVB drivers for TBS (Official)"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_VERSION="${ADDON_VERSION}.${PKG_REV}"

pre_make_target() {
  export KERNEL_VER=$(get_module_dir)
  export LDFLAGS=""
}

make_target() {
  make untar
  make VER=$KERNEL_VER SRCDIR=$(kernel_path) allyesconfig
  make VER=$KERNEL_VER SRCDIR=$(kernel_path)
}

makeinstall_target() {
  MODULE_DIR="$INSTALL/$(get_full_module_dir $PKG_ADDON_ID)/updates/$PKG_ADDON_ID"
  ADDON_DIR="$INSTALL/usr/share/$MEDIACENTER/addons/$PKG_ADDON_ID"

  mkdir -p $MODULE_DIR
  find $PKG_BUILD/v4l/ -name \*.ko -exec cp {} $MODULE_DIR \;

  find $MODULE_DIR -name \*.ko -exec $STRIP --strip-debug {} \;

  mkdir -p $ADDON_DIR
  cp $PKG_DIR/changelog.txt $ADDON_DIR
  install_addon_files "$ADDON_DIR"
}
