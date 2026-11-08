# SPDX-License-Identifier: GPL-2.0-only
# Copyright (C) 2026-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="mtd-utils"
PKG_VERSION="2.3.1"
PKG_SHA256="03d9dc58ad10ea3549d9528f6b17a44d8944e18e96c0f31474f9f977078b83dc"
PKG_LICENSE="GPL-2.0-only"
PKG_SITE="http://www.linux-mtd.infradead.org/"
PKG_URL="https://infraroot.at/pub/mtd/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Tools for MTD devices: UBI (ubimkvol, ubinfo, ubiformat, ...), raw NAND and flash erase utilities."
PKG_BUILD_FLAGS="-sysroot"

# UBI, NAND, NOR and misc tools only: the UBIFS and JFFS2 image tools would
# need zlib, lzo, zstd and libuuid in the addon
PKG_CONFIGURE_OPTS_TARGET="--without-tests \
                           --without-jffs \
                           --without-ubifs \
                           --without-zlib \
                           --without-lzo \
                           --without-zstd \
                           --without-xattr \
                           --without-selinux \
                           --without-crypto"
