################################################################################
#      This file is part of LibreELEC - https://LibreELEC.tv
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

PKG_NAME="argtable2"
PKG_VERSION="2.13"
PKG_ARCH="any"
PKG_LICENSE="BSD"
PKG_SITE="http://argtable.sourceforge.net/"
PKG_URL="$SOURCEFORGE_SRC/argtable/argtable/argtable-${PKG_VERSION}/argtable2-${PKG_VERSION:2:4}.tar.gz"
PKG_SOURCE_DIR="${PKG_NAME}-${PKG_VERSION:2:4}"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="tools"
PKG_SHORTDESC="Argtable is an open source ANSI C library that parses GNU-style command-line options"
PKG_LONGDESC="Argtable is an open source ANSI C library that parses GNU-style command-line options"
PKG_AUTORECONF="yes"

make_target() {
  :
}
