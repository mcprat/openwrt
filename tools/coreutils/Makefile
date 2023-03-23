#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=coreutils
PKG_CPE_ID:=cpe:/a:gnu:coreutils
PKG_VERSION:=9.1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@GNU/coreutils
PKG_HASH:=61a1f410d78ba7e7f37a5a4f50e6d1320aca33375484a3255eddf17a38580423

HOST_BUILD_PARALLEL := 1

BUILD_PROGRAMS = date readlink touch ln chown ginstall

include $(INCLUDE_DIR)/host-build.mk

export GNULIB_SRCDIR:=$(HOST_GNULIB_SRCDIR)

BUILD_BINS = $(patsubst %,src/%,$(BUILD_PROGRAMS))

HOST_CONFIGURE_ARGS += \
	 --enable-install-program=$(subst $(space),$(comma),$(strip $(BUILD_PROGRAMS)))

HOST_MAKE_FLAGS += \
	PROGRAMS="$(BUILD_BINS)" \
	LIBRARIES= MANS= SUBDIRS=.

define Host/Prepare
	$(call Host/Prepare/Default)
	$(if $(QUILT),,(cd $(HOST_BUILD_DIR); touch README-release; $(AM_TOOL_PATHS) ./bootstrap --no-git --skip-po --force --gnulib-srcdir=$(GNULIB_SRCDIR) --bootstrap-sync))
endef

define Host/Configure
	$(if $(QUILT),(cd $(HOST_BUILD_DIR); touch README-release; $(AM_TOOL_PATHS) ./bootstrap --no-git --skip-po --force --gnulib-srcdir=$(GNULIB_SRCDIR) --bootstrap-sync))
	$(call Host/Configure/Default)
endef

define Host/Install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(patsubst %,$(HOST_BUILD_DIR)/%,$(BUILD_BINS)) $(1)/bin/
	ln -sf ginstall $(1)/bin/install
endef

define Host/Uninstall
	rm -f $(STAGING_DIR_HOST)/bin/install
	-$(call Host/Compile/Default,uninstall)
endef

$(eval $(call HostBuild))
