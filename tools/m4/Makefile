# 
# Copyright (C) 2008-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=m4
PKG_CPE_ID:=cpe:/a:gnu:m4
PKG_VERSION:=1.4.19

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@GNU/$(PKG_NAME)
PKG_HASH:=63aede5c6d33b6d9b13511cd0be2cac046f2e70fd0a07aa9573a04a82783af96
PKG_CAT:=xzcat

HOST_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/host-build.mk

export GNULIB_SRCDIR:=$(HOST_GNULIB_SRCDIR)

HOST_CONFIGURE_VARS += gl_cv_func_strstr_linear=no

define Host/Prepare
	$(call Host/Prepare/Default)
	$(if $(QUILT),,(cd $(HOST_BUILD_DIR); touch README-release; ./bootstrap --skip-git --skip-po --force --gnulib-srcdir=$(GNULIB_SRCDIR)))
endef

define Host/Configure
	$(if $(QUILT),(cd $(HOST_BUILD_DIR); touch README-release; ./bootstrap --skip-git --skip-po --force --gnulib-srcdir=$(GNULIB_SRCDIR)))
	$(call Host/Configure/Default)
endef

define Host/Uninstall
	-$(call Host/Compile/Default,uninstall)
endef

$(eval $(call HostBuild))
