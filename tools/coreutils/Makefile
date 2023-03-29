#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=coreutils
PKG_CPE_ID:=cpe:/a:gnu:$(PKG_NAME)
PKG_VERSION:=9.2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://git.savannah.gnu.org/cgit/$(PKG_NAME).git/snapshot
PKG_HASH:=3d1f5696b03d6a38c9b422409a8988ffa5c948b6a5b714b78c25c04fd53b7e6f

HOST_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/host-build.mk

export GNULIB_SRCDIR:=$(HOST_GNULIB_SRCDIR)

BUILD_PROGRAMS = date readlink touch ln chown ginstall
BUILD_BINS = $(patsubst %,src/%,$(BUILD_PROGRAMS))

HOST_CONFIGURE_ARGS += \
	 --enable-install-program=$(subst $(space),$(comma),$(strip $(BUILD_PROGRAMS)))

HOST_MAKE_FLAGS += \
	PROGRAMS="$(BUILD_BINS)" \
	LIBRARIES= MANS= SUBDIRS=.

define Host/Bootstrap
	( \
		cd $(HOST_BUILD_DIR); \
		$(filter-out %true,$(AM_TOOL_PATHS)) \
		./bootstrap \
			--bootstrap-sync \
			--no-git \
			--skip-po \
			--gnulib-srcdir=$(GNULIB_SRCDIR) \
	)
endef

define Host/Prepare
	$(call Host/Prepare/Default)
	$(if $(QUILT),,$(call Host/Bootstrap))
endef

define Host/Configure
	$(if $(QUILT),$(call Host/Bootstrap))
	$(call Host/Configure/Default)
endef

define Host/Install
	$(call Host/Compile/Default,install)
	$(LN) ginstall $(1)/bin/install
endef

define Host/Uninstall
	-$(call Host/Compile/Default,uninstall)
endef

define Host/Clean
	rm -f $(STAGING_DIR_HOST)/bin/install
	rm -f $(foreach program,$(BUILD_PROGRAMS),$(STAGING_DIR_HOST)/bin/$(program) )
endef

$(eval $(call HostBuild))
