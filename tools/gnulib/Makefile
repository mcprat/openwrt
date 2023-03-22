include $(TOPDIR)/rules.mk

PKG_NAME:=gnulib
PKG_CPE_ID:=cpe:/a:gnu:gnulib
PKG_VERSION:=stable-202301

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://git.savannah.gnu.org/git/gnulib.git
PKG_SOURCE_DATE:=2023-03-02
PKG_SOURCE_VERSION:=00adbdffd0bf4a612ec8414afcffc663e98f459b
PKG_MIRROR_HASH:=747fb640a0596cab7d516979188e1f85be58c470df85cf1f7e3dcf8a4c1b36e5

include $(INCLUDE_DIR)/host-build.mk

define Host/Configure
endef

define Host/Install
	$(INSTALL_DIR) $(STAGING_DIR_HOST)/share/gnulib
	$(CP) $(HOST_BUILD_DIR)/* $(STAGING_DIR_HOST)/share/gnulib/
endef

define Host/Clean
	rm -rf $(STAGING_DIR_HOST)/share/gnulib/
endef

$(eval $(call HostBuild))
