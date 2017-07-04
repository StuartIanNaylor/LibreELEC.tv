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

PKG_NAME="comskip"
PKG_VERSION="f277835"
PKG_ARCH="any"
PKG_LICENSE=""
PKG_SITE="http://www.kaashoek.com/comskip/"
PKG_URL="https://github.com/erikkaashoek/Comskip/archive/${PKG_VERSION}.tar.gz"
PKG_SOURCE_DIR="Comskip-${PKG_VERSION}*"
PKG_DEPENDS_TARGET="toolchain argtable2 ffmpeg"
PKG_SECTION="tools"
PKG_SHORTDESC="Comskip detects commercial breaks from a video stream. It can be used for post-processing recordings"
PKG_LONGDESC="ComSkip is a free video commercial detector. It is a console application that reads a video file and analyses the content based on a large amount of configurable parameters. After analysis it generates a file in various possible formats containing the location of the commercials inside the video file. Comskip can read MPEG and h.264 video, MPEG2, AC3 and AAC audio from PS , TS and dvr-ms files upto HD resolution (max 2000x1200) at 25fps (PAL) and 29.97fps (NTSC)."
PKG_AUTORECONF="yes"

pre_configure_target() {
  export argtable2_CFLAGS="-I$(get_build_dir argtable2)/src"
  export argtable2_LIBS="-L$(get_build_dir argtable2)/src/.libs -largtable2"
}

make_target() {
 :
}
