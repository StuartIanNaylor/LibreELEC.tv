# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="inputstream.adaptive"
PKG_VERSION="2.2.27"
PKG_SHA256="15d1e2f05d3ddeb31a9509e9fc6c8a305a6055ba68329c717606bb895ed5aacf"
PKG_LICENSE="GPL"
PKG_SITE="http://www.kodi.tv"
PKG_URL="https://github.com/peak3d/inputstream.adaptive/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION=""
PKG_SHORTDESC="inputstream.adaptive"
PKG_LONGDESC="inputstream.adaptive"

PKG_IS_ADDON="yes"

PKG_CMAKE_OPTS_TARGET="-DCMAKE_PREFIX_PATH=/home/cvh/Git/LE-CvH/build.LibreELEC-Generic.x86_64-9.0-devel/kodi-platform-e8574b883ffa2131f2eeb96ff3724d60b21130f7 \
                       -DCMAKE_MODULE_PATH=/home/cvh/Git/LE-CvH/build.LibreELEC-Generic.x86_64-9.0-devel/kodi-platform-e8574b883ffa2131f2eeb96ff3724d60b21130f7"

if [ "$TARGET_ARCH" = "x86_64" ] || [ "$TARGET_ARCH" = "arm" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET nss"
fi

addon() {
  install_binary_addon $PKG_ADDON_ID

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID
  cp -P $PKG_BUILD/.$TARGET_NAME/wvdecrypter/libssd_wv.so $ADDON_BUILD/$PKG_ADDON_ID
}
