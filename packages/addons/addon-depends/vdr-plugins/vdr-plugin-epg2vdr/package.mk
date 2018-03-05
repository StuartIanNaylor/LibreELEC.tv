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

PKG_NAME="vdr-plugin-epg2vdr"
PKG_VERSION="1.1.91"
PKG_SHA256="0726e320a17b5cafb4f277096c3feae5a752be3311f25c727fbfa86ba3d0c1bf"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://projects.vdr-developer.org/projects/plg-epg2vdr"
PKG_URL="https://github.com/vdr-projects/vdr-plugin-epg2vdr/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain zlib vdr mysql tinyxml2 util-linux:libuuid jansson libarchive"
PKG_SECTION="multimedia"
PKG_SHORTDESC="vdr-epg2vdr"
PKG_LONGDESC="vdr-epg2vdr"

pre_configure_target() {
  CFLAGS="$CFLAGS -I$(get_build_dir tinyxml2)"
  CFLAGS="$CFLAGS -I$(get_build_dir jansson)/.$TARGET_NAME/include"
}

make_target() {
  VDR_DIR=$(get_build_dir vdr)
  export PKG_CONFIG_PATH=$VDR_DIR:$PKG_CONFIG_PATH
  export CPLUS_INCLUDE_PATH=$VDR_DIR/include

  make \
    CC="$CXX" \
    LIBDIR="." \
    LOCDIR="./locale" \
    all install-i18n
}

post_make_target() {
  VDR_DIR=$(get_build_dir vdr)
  VDR_APIVERSION=`sed -ne '/define APIVERSION/s/^.*"\(.*\)".*$/\1/p' $VDR_DIR/config.h`
  LIB_NAME=lib${PKG_NAME/-plugin/}

  cp --remove-destination $PKG_BUILD/${LIB_NAME}.so $PKG_BUILD/${LIB_NAME}.so.${VDR_APIVERSION}
  $STRIP libvdr-*.so*
}

makeinstall_target() {
  :
}
