# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2006-2020 OpenWrt.org

PKG_DEFAULT_DEPENDS = +libc +USE_GLIBC:librt +USE_GLIBC:libpthread

ifneq ($(PKG_NAME),toolchain)
  PKG_FIXUP_DEPENDS = $(if $(filter kmod-%,$(1)),$(2),$(PKG_DEFAULT_DEPENDS) $(filter-out $(PKG_DEFAULT_DEPENDS),$(2)))
else
  PKG_FIXUP_DEPENDS = $(2)
endif

define Package/Default
  CONFIGFILE:=
  SECTION:=opt
  CATEGORY:=Extra packages
  DEPENDS:=
  MDEPENDS:=
  CONFLICTS:=
  PROVIDES:=
  EXTRA_DEPENDS:=
  MAINTAINER:=$(PKG_MAINTAINER)
  SOURCE:=$(patsubst $(TOPDIR)/%,%,$(CURDIR))
  ifneq ($(PKG_VERSION),)
    ifneq ($(PKG_RELEASE),)
      VERSION:=$(PKG_VERSION)-$(PKG_RELEASE)
    else
      VERSION:=$(PKG_VERSION)
    endif
  else
    VERSION:=$(PKG_RELEASE)
  endif
  ABI_VERSION:=
  ifneq ($(PKG_FLAGS),)
    PKGFLAGS:=$(PKG_FLAGS)
  else
    PKGFLAGS:=
  endif
  ifneq ($(ARCH_PACKAGES),)
    PKGARCH:=$(ARCH_PACKAGES)
  else
    PKGARCH:=$(BOARD)
  endif
  DEFAULT:=
  MENU:=
  SUBMENU:=
  SUBMENUDEP:=
  TITLE:=
  KCONFIG:=
  BUILDONLY:=
  HIDDEN:=
  URL:=
  VARIANT:=
  DEFAULT_VARIANT:=
  USERID:=
  ALTERNATIVES:=
  LICENSE:=$(PKG_LICENSE)
  LICENSE_FILES:=$(PKG_LICENSE_FILES)
  FILE_MODES:=$(PKG_FILE_MODES)
endef

PKG_SRC_DIR ?= src

Build/Patch:=$(Build/Patch/Default)
ifneq ($(strip $(PKG_UNPACK)),)
  define Build/Prepare/Default
	$(PKG_UNPACK)
	[ ! -d ./$(PKG_SRC_DIR)/ ] || $(CP) ./$(PKG_SRC_DIR)/. $(PKG_SOURCE_DIR)
	$(Build/Patch)
  endef
endif

EXTRA_CXXFLAGS = $(EXTRA_CFLAGS)
ifeq ($(CONFIG_BUILD_NLS),y)
    DISABLE_NLS:=
else
    DISABLE_NLS:=--disable-nls
endif

CONFIGURE_PREFIX:=/usr
CONFIGURE_ARGS = \
		--target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \
		--disable-dependency-tracking \
		--program-prefix="" \
		--program-suffix="" \
		--prefix=$(CONFIGURE_PREFIX) \
		--exec-prefix=$(CONFIGURE_PREFIX) \
		--bindir=$(CONFIGURE_PREFIX)/bin \
		--sbindir=$(CONFIGURE_PREFIX)/sbin \
		--libexecdir=$(CONFIGURE_PREFIX)/lib \
		--sysconfdir=/etc \
		--datadir=$(CONFIGURE_PREFIX)/share \
		--localstatedir=/var \
		--mandir=$(CONFIGURE_PREFIX)/man \
		--infodir=$(CONFIGURE_PREFIX)/info \
		$(DISABLE_NLS) \
		$(DISABLE_IPV6)

CONFIGURE_VARS = \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
		CXXFLAGS="$(TARGET_CXXFLAGS) $(EXTRA_CXXFLAGS)" \
		CPPFLAGS="$(TARGET_CPPFLAGS) $(EXTRA_CPPFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS) $(EXTRA_LDFLAGS)" \

CONFIGURE_PATH = .
CONFIGURE_CMD = ./configure

define Build/Configure/Default
	( \
	cd $(PKG_BUILD_DIR)/$(CONFIGURE_PATH)/$(strip $(3)); \
	if [ -x $(CONFIGURE_CMD) ]; then \
		$(call replace_script,$(PKG_BUILD_DIR)/$(CONFIGURE_PATH)$(if $(3),/$(strip $(3))),config.guess,$(SCRIPT_DIR)) \
		$(call replace_script,$(PKG_BUILD_DIR)/$(CONFIGURE_PATH)$(if $(3),/$(strip $(3))),config.sub,$(SCRIPT_DIR)) \
		$(if $(BUILD_ALLOW_WERROR),, \
			$(call replace_string,$(PKG_BUILD_DIR)/$(CONFIGURE_PATH)$(if $(3),/$(strip $(3))),'Makefile*',\(-Werror\)\([^=\-].*$$$$\),-Wextra\2) \
		) \
		$(if $(HOST_ARCH_GNU), \
			echo "echo $(GNU_HOST_NAME)" > \
				$(PKG_BUILD_DIR)/$(CONFIGURE_PATH)$(if $(3),/$(strip $(3)))/config.guess ; \
			$(call replace_script,$(PKG_BUILD_DIR)/$(CONFIGURE_PATH)$(if $(3),/$(strip $(3))),config.guess,$(PKG_BUILD_DIR)/$(CONFIGURE_PATH)$(if $(3),/$(strip $(3)))) \
		) \
		$(CONFIGURE_VARS) \
		$(2) \
		$(CONFIGURE_CMD) \
		$(CONFIGURE_ARGS) \
		$(1); \
	fi; \
	)
endef

MAKE_VARS = \
	CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS) $(TARGET_CPPFLAGS) $(EXTRA_CPPFLAGS)" \
	CXXFLAGS="$(TARGET_CXXFLAGS) $(EXTRA_CXXFLAGS) $(TARGET_CPPFLAGS) $(EXTRA_CPPFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS) $(EXTRA_LDFLAGS)"

MAKE_FLAGS = \
	$(TARGET_CONFIGURE_OPTS) \
	CROSS="$(TARGET_CROSS)" \
	ARCH="$(ARCH)"

MAKE_INSTALL_FLAGS = \
	$(MAKE_FLAGS) \
	DESTDIR="$(PKG_INSTALL_DIR)"

MAKE_PATH ?= .

define Build/Compile/Default
	$(MAKE_VARS) \
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR)/$(MAKE_PATH) \
		$(MAKE_FLAGS) \
		$(1)
endef

define Build/Compile/Fixup
	$(call autoreconf_target) \
	$(call Build/Configure/Default); \
	$(call Build/Compile/Default)
endef

define Build/Install/Default
	$(MAKE_VARS) \
	$(MAKE) -C $(PKG_BUILD_DIR)/$(MAKE_PATH) \
		$(MAKE_INSTALL_FLAGS) \
		$(if $(1), $(1), install)
endef

define Build/Dist/Default
	$(call Build/Compile/Default, DESTDIR="$(PKG_BUILD_DIR)/tmp" CC="$(TARGET_CC)" dist)
endef

define Build/DistCheck/Default
	$(call Build/Compile/Default, DESTDIR="$(PKG_BUILD_DIR)/tmp" CC="$(TARGET_CC)" distcheck)
endef
