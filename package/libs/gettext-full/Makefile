#
# Copyright (C) 2006-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gettext-full
PKG_VERSION:=0.21.1
PKG_RELEASE:=2

PKG_SOURCE:=gettext-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@GNU/gettext
PKG_HASH:=50dbc8f39797950aa2c98e939947c527e5ac9ebd2c1b99dd7b06ba33a6767ae6
PKG_BUILD_DIR:=$(BUILD_DIR)/gettext-$(PKG_VERSION)
HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/gettext-$(PKG_VERSION)

PKG_MAINTAINER:=Jo-Philipp Wich <jo@mein.io>
PKG_LICENSE:=GPL-3.0-or-later
PKG_CPE_ID:=cpe:/a:gnu:gettext

PKG_INSTALL:=1
PKG_BUILD_DEPENDS:=gettext-full/host
PKG_BUILD_PARALLEL:=0

HOST_BUILD_DEPENDS:=gperf/host libxml2/host
HOST_BUILD_PARALLEL:=0

PKG_SUBDIRS:= \
	$$$$(foreach dir, \
		gnulib-lib \
		$$$$(if $$$$(wildcard ../libtextstyle/gnulib-local),,gnulib-local) \
		intl \
		intl-csharp \
		intl-java \
		its \
		lib \
		$$$$(SUBDIR_libasprintf) \
		libgettextpo \
		libgrep \
		libtextstyle \
		$$$$(if $$$$(wildcard ../gnulib-local/m4 ../gettext-$(PKG_VERSION)/m4),,m4) \
		misc \
		po \
		projects \
		src \
		styles \
		gettext-runtime \
		gettext-tools \
	,$$$$(wildcard $$$$(dir)) )

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk

define Package/libintl-full
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=GNU Internationalization library
  URL:=http://www.gnu.org/software/gettext/
  ABI_VERSION:=8
endef

export GNULIB_SRCDIR:=$(HOST_GNULIB_SRCDIR)

TARGET_CFLAGS += $(FPIC)
ifneq ($(HOST_OS),Linux)
  TARGET_CFLAGS += -I$(STAGING_DIR_HOSTPKG)/include
endif

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--disable-libasprintf \
	--disable-rpath \
	--enable-nls \
	--disable-java \
	--disable-openmp \
	--disable-curses \
	--with-included-gettext \
	--without-libintl-prefix \
	--without-libexpat-prefix \
	--without-emacs

HOST_CONFIGURE_ARGS += \
	--disable-shared \
	--enable-static \
	--disable-libasprintf \
	--disable-rpath \
	--disable-java \
	--disable-openmp \
	--without-emacs \
	--with-libxml2-prefix=$(STAGING_DIR_HOSTPKG)

HOST_CONFIGURE_VARS += \
	EMACS="no" \
	am_cv_lib_iconv=no \
	am_cv_func_iconv=no \
	ac_cv_header_iconv_h=no \

HOST_CFLAGS += $(HOST_FPIC)

define Host/Bootstrap
	( \
		cd $(HOST_BUILD_DIR); \
		$(AM_TOOL_PATHS) \
		./autogen.sh \
	)
endef

define Host/Compile
	$(call Host/Compile/Default,SUBDIRS='$(PKG_SUBDIRS)')
endef

define Build/Compile
	$(call Build/Compile/Default,SUBDIRS='$(PKG_SUBDIRS)')
endef

define Host/Prepare
	$(call Host/Prepare/Default)
	$(if $(QUILT),,$(call Host/Bootstrap))
endef

define Host/Configure
	$(if $(QUILT),$(call Host/Bootstrap))
	$(call Host/Configure/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/libintl-full/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libintl.h $(1)/usr/lib/libintl-full/include/

	$(INSTALL_DIR) $(1)/usr/lib/libintl-full/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libintl.{a,so*} $(1)/usr/lib/libintl-full/lib/

	$(INSTALL_DIR) $(1)/usr/share/aclocal
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/aclocal/* $(1)/usr/share/aclocal/

	$(SED) '/read dummy/d' $(STAGING_DIR_HOSTPKG)/bin/gettextize
endef

define Host/Install
	$(call Host/Install/Default,SUBDIRS='$(PKG_SUBDIRS)')
	$(LN) msgfmt $(STAGING_DIR_HOSTPKG)/bin/gmsgfmt
endef

define Build/Install
	$(call Build/Install/Default,SUBDIRS='$(PKG_SUBDIRS)')
endef

define Package/libintl-full/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libintl.so.* $(1)/usr/lib/
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,libintl-full))
