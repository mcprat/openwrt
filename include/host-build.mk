# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2006-2020 OpenWrt.org

include $(INCLUDE_DIR)/download.mk

HOST_BUILD_DIR ?= $(BUILD_DIR_HOST)/$(PKG_NAME)$(if $(PKG_VERSION),-$(PKG_VERSION))
HOST_SOURCE_DIR ?= $(HOST_BUILD_DIR)
HOST_INSTALL_DIR ?= $(HOST_SOURCE_DIR)/host-install
HOST_BUILD_PARALLEL ?=

HOST_MAKE_J:=$(if $(MAKE_JOBSERVER),$(MAKE_JOBSERVER) $(if $(filter 3.% 4.0 4.1,$(MAKE_VERSION)),-j))

ifeq ($(strip $(HOST_BUILD_PARALLEL)),0)
HOST_JOBS?=-j1
else
HOST_JOBS?=$(if $(HOST_BUILD_PARALLEL),$(HOST_MAKE_J),-j1)
endif

include $(INCLUDE_DIR)/unpack.mk
include $(INCLUDE_DIR)/depends.mk
include $(INCLUDE_DIR)/quilt.mk

BUILD_TYPES += host
HOST_STAMP_PREPARED=$(HOST_SOURCE_DIR)/.prepared$(if $(HOST_QUILT)$(DUMP),,$(shell $(call find_md5,${CURDIR} $(PKG_FILE_DEPENDS),))_$(call confvar,CONFIG_AUTOREMOVE $(HOST_PREPARED_DEPENDS)))
HOST_STAMP_CONFIGURED:=$(HOST_SOURCE_DIR)/.configured
HOST_STAMP_BUILT:=$(HOST_SOURCE_DIR)/.built
HOST_BUILD_PREFIX?=$(if $(IS_PACKAGE_BUILD),$(STAGING_DIR_HOSTPKG),$(STAGING_DIR_HOST))
HOST_STAMP_INSTALLED:=$(HOST_BUILD_PREFIX)/stamp/.$(PKG_NAME)_installed

override MAKEFLAGS=

include $(INCLUDE_DIR)/autotools.mk

_host_target:=$(if $(HOST_QUILT),,.)

HOST_SRC_DIR ?= src

Host/Patch:=$(Host/Patch/Default)
ifneq ($(strip $(HOST_UNPACK)),)
  define Host/Prepare/Default
	$(HOST_UNPACK)
	[ ! -d ./$(HOST_SRC_DIR)/ ] || $(CP) ./$(HOST_SRC_DIR)/* $(HOST_SOURCE_DIR)
	$(Host/Patch)
  endef
endif

define Host/Prepare
  $(call Host/Prepare/Default)
endef

HOST_CONFIGURE_VARS = \
	CC="$(HOSTCC)" \
	CFLAGS="$(HOST_CFLAGS)" \
	CXX="$(HOSTCXX)" \
	CPPFLAGS="$(HOST_CPPFLAGS)" \
	CXXFLAGS="$(HOST_CXXFLAGS)" \
	LDFLAGS="$(HOST_LDFLAGS)" \
	CONFIG_SHELL="$(SHELL)"

HOST_CONFIGURE_ARGS = \
	--target=$(GNU_HOST_NAME) \
	--host=$(GNU_HOST_NAME) \
	--build=$(GNU_HOST_NAME) \
	--program-prefix="" \
	--program-suffix="" \
	--prefix=$(HOST_BUILD_PREFIX) \
	--exec-prefix=$(HOST_BUILD_PREFIX) \
	--sysconfdir=$(HOST_BUILD_PREFIX)/etc \
	--localstatedir=$(HOST_BUILD_PREFIX)/var \
	--sbindir=$(HOST_BUILD_PREFIX)/bin

HOST_MAKE_VARS = \
	CFLAGS="$(HOST_CFLAGS)" \
	CPPFLAGS="$(HOST_CPPFLAGS)" \
	CXXFLAGS="$(HOST_CXXFLAGS)" \
	LDFLAGS="$(HOST_LDFLAGS)"

HOST_MAKE_FLAGS =

ifeq ($(HOST_OS),Darwin)
  HOST_CONFIG_SITE:=$(INCLUDE_DIR)/site/darwin
endif

HOST_CONFIGURE_PATH = .
HOST_CONFIGURE_CMD = ./configure

define Host/Configure/Default
	$(if $(HOST_CONFIGURE_PARALLEL),+)(cd $(HOST_BUILD_DIR)/$(HOST_CONFIGURE_PATH)/$(strip $(3)); \
		if [ -x $(HOST_CONFIGURE_CMD) ]; then \
			$(call replace_script,$(HOST_BUILD_DIR)/$(HOST_CONFIGURE_PATH)$(if $(3),/$(strip $(3))),config.guess,$(SCRIPT_DIR)) \
			$(call replace_script,$(HOST_BUILD_DIR)/$(HOST_CONFIGURE_PATH)$(if $(3),/$(strip $(3))),config.sub,$(SCRIPT_DIR)) \
			$(call replace_string,$(HOST_BUILD_DIR)/$(HOST_CONFIGURE_PATH)$(if $(3),/$(strip $(3))),'Makefile*',\(-Werror\)\([^=].*$$$$\),-Wextra\2) \
			$(if $(HOST_ARCH_GNU), \
				echo "echo $(GNU_HOST_NAME)" > \
					$(HOST_BUILD_DIR)/$(HOST_CONFIGURE_PATH)$(if $(3),/$(strip $(3)))/config.guess ; \
				$(call replace_script,$(HOST_BUILD_DIR)/$(HOST_CONFIGURE_PATH)$(if $(3),/$(strip $(3))),config.guess,$(HOST_BUILD_DIR)/$(HOST_CONFIGURE_PATH)$(if $(3),/$(strip $(3)))) \
			) \
			$(HOST_CONFIGURE_VARS) \
			$(2) \
			$(HOST_CONFIGURE_CMD) \
			$(HOST_CONFIGURE_ARGS) \
			$(1); \
		fi \
	)
endef

define Host/Configure
  $(call Host/Configure/Default)
endef

define Host/Compile/Default
	+$(HOST_MAKE_VARS) \
	$(MAKE) $(HOST_JOBS) -C $(HOST_BUILD_DIR) \
		$(HOST_MAKE_FLAGS) \
		$(1)
endef

define Host/Compile
  $(call Host/Compile/Default)
endef

define Host/Install/Default
	$(call Host/Compile/Default,install)
endef

define Host/Install
  $(call Host/Install/Default,$(HOST_BUILD_PREFIX))
endef


ifneq ($(if $(HOST_QUILT),,$(CONFIG_AUTOREBUILD)),)
  define HostHost/Autoclean
    $(call rdep,${CURDIR} $(PKG_FILE_DEPENDS),$(HOST_STAMP_PREPARED))
    $(if $(if $(Host/Compile),$(filter prepare,$(MAKECMDGOALS)),1),,$(call rdep,$(HOST_SOURCE_DIR),$(HOST_STAMP_BUILT)))
  endef
endif

define Host/Exports/Default
  $(1) : export ACLOCAL_INCLUDE=$$(foreach p,$$(wildcard $$(STAGING_DIR_HOST)/share/aclocal $$(STAGING_DIR_HOST)/share/aclocal-* $(if $(IS_PACKAGE_BUILD),$$(STAGING_DIR)/host/share/aclocal $$(STAGING_DIR_HOSTPKG)/share/aclocal $$(STAGING_DIR)/host/share/aclocal-*)),-I $$(p))
  $(1) : export STAGING_PREFIX=$$(HOST_BUILD_PREFIX)
  $(1) : export PKG_CONFIG_PATH=$$(STAGING_DIR_HOST)/lib/pkgconfig:$$(HOST_BUILD_PREFIX)/lib/pkgconfig
  $(1) : export PKG_CONFIG_LIBDIR=$$(HOST_BUILD_PREFIX)/lib/pkgconfig
  $(if $(HOST_CONFIG_SITE),$(1) : export CONFIG_SITE:=$(HOST_CONFIG_SITE))
  $(if $(IS_PACKAGE_BUILD),$(1) : export PATH=$$(TARGET_PATH_PKG))
endef
Host/Exports=$(Host/Exports/Default)

.NOTPARALLEL:

ifndef DUMP
  define HostBuild/Core
  $(if $(HOST_QUILT),$(Host/Quilt))
  $(if $(DUMP),,$(call HostHost/Autoclean))

  $(HOST_STAMP_PREPARED):
	$(Q)-$(RM) -r $(HOST_BUILD_DIR)
	$(Q)mkdir -p $(HOST_BUILD_DIR)
	$(Q)mkdir -p $(HOST_SOURCE_DIR)
	$(foreach hook,$(Hooks/HostPrepare/Pre),$(call $(hook))$(sep))
	$(call Host/Prepare)
	$(foreach hook,$(Hooks/HostPrepare/Post),$(call $(hook))$(sep))
	touch $$@

  $(call Host/Exports,$(HOST_STAMP_CONFIGURED))
  $(HOST_STAMP_CONFIGURED): $(HOST_STAMP_PREPARED)
	$(foreach hook,$(Hooks/HostConfigure/Pre),$(call $(hook))$(sep))
	$(call Host/Configure)
	$(foreach hook,$(Hooks/HostConfigure/Post),$(call $(hook))$(sep))
	touch $$@

  $(call Host/Exports,$(HOST_STAMP_BUILT))
  $(HOST_STAMP_BUILT): $(HOST_STAMP_CONFIGURED)
		$(foreach hook,$(Hooks/HostCompile/Pre),$(call $(hook))$(sep))
		$(call Host/Compile)
		$(foreach hook,$(Hooks/HostCompile/Post),$(call $(hook))$(sep))
		touch $$@

  $(call Host/Exports,$(HOST_STAMP_INSTALLED))
  $(HOST_STAMP_INSTALLED): $(HOST_STAMP_BUILT) $(if $(FORCE_HOST_INSTALL),FORCE)
		$(call Host/Install,$(HOST_BUILD_PREFIX))
		$(foreach hook,$(Hooks/HostInstall/Post),$(call $(hook))$(sep))
		mkdir -p $$(shell dirname $$@)
		touch $(HOST_STAMP_BUILT)
		touch $$@

  $(call DefaultTargets,$(patsubst %,host-%,$(DEFAULT_SUBDIR_TARGETS)))
  ifndef STAMP_BUILT
    $(foreach t,$(DEFAULT_SUBDIR_TARGETS),
      $(t): host-$(t)
      .$(t): .host-$(t)
    )
    clean-build: host-clean-build
  endif

  $(call check_download_integrity)

  $(_host_target)host-prepare: $(HOST_STAMP_PREPARED)
  $(_host_target)host-configure: $(HOST_STAMP_CONFIGURED)
  $(_host_target)host-compile: $(HOST_STAMP_BUILT) $(HOST_STAMP_INSTALLED)
  host-install: host-compile

  host-clean-build: FORCE
	$(call Host/Uninstall)
	$(RM) -r $(HOST_BUILD_DIR) $(HOST_STAMP_BUILT)

  host-clean: host-clean-build
	$(call Host/Clean)
	$(RM) -r $(HOST_STAMP_INSTALLED)

    ifneq ($(CONFIG_AUTOREMOVE),)
      host-compile:
		$(call find_depth,$(HOST_SOURCE_DIR),'!' '(' -type f -name '.*' -size 0 ')',1,1) | \
			$(XARGS) $(RM) -r
    endif
  endef
endif

define HostBuild
  $(HostBuild/Core)
  $(if $(if $(PKG_HOST_ONLY),,$(if $(and $(filter host-%,$(MAKECMDGOALS)),$(PKG_SKIP_DOWNLOAD)),,$(STAMP_PREPARED))),,$(if $(strip $(PKG_SOURCE_URL)),$(call Download,default)))
endef
