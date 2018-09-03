# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="glm"
PKG_VERSION="0.9.9.0"
PKG_SHA256="e1c707407c43589e8eeb8b69b902f1a34aaaa59bda1ca144181c2d2d6e531246"
PKG_ARCH="x86_64"
PKG_LICENSE="MIT"
PKG_SITE="https://glm.g-truc.net/"
PKG_URL="https://github.com/g-truc/glm/releases/download/$PKG_VERSION/glm-$PKG_VERSION.zip"
PKG_SOURCE_DIR="glm"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="OpenGL Mathematics (GLM)"

if [ "$OPENGL" = "no" ] ; then
  exit 0
fi
