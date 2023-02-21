# SPDX-License-Identifier: GPL-2.0-only

include ./common.mk

define Device/allnet_all-sg8208m
  SOC := rtl8382
  IMAGE_SIZE := 7168k
  DEVICE_VENDOR := ALLNET
  DEVICE_MODEL := ALL-SG8208M
  UIMAGE_MAGIC := 0x00000006
  UIMAGE_NAME := 2.2.2.0
endef

define Device/apresia_aplgs120gtss
  $(Device/Common/cameo-fw)
  SOC := rtl8382
  IMAGE_SIZE := 14848k
  DEVICE_VENDOR := APRESIA
  DEVICE_MODEL := ApresiaLightGS120GT-SS
  UIMAGE_MAGIC := 0x12345000
  CAMEO_KERNEL_PART_SIZE := 1572864
  CAMEO_KERNEL_PART := 3
  CAMEO_ROOTFS_PART := 4
  CAMEO_CUSTOMER_SIGNATURE := 2
  CAMEO_BOARD_MODEL := APLGS120GTSS
  CAMEO_BOARD_VERSION := 4
endef

define Device/d-link_dgs-1210-10mp-f
  $(Device/Common/d-link_dgs-1210)
  SOC := rtl8380
  DEVICE_MODEL := DGS-1210-10MP
  DEVICE_VARIANT := F
  DEVICE_PACKAGES += realtek-poe
endef

define Device/d-link_dgs-1210-10p
  $(Device/Common/d-link_dgs-1210)
  SOC := rtl8382
  DEVICE_MODEL := DGS-1210-10P
  DEVICE_PACKAGES += lua-rs232
endef

define Device/d-link_dgs-1210-16
  $(Device/Common/d-link_dgs-1210)
  SOC := rtl8382
  DEVICE_MODEL := DGS-1210-16
endef

define Device/d-link_dgs-1210-20
  $(Device/Common/d-link_dgs-1210)
  SOC := rtl8382
  DEVICE_MODEL := DGS-1210-20
endef

define Device/d-link_dgs-1210-28
  $(Device/Common/d-link_dgs-1210)
  SOC := rtl8382
  DEVICE_MODEL := DGS-1210-28
endef

define Device/d-link_dgs-1210-28mp-f
  $(Device/Common/d-link_dgs-1210)
  SOC := rtl8382
  DEVICE_MODEL := DGS-1210-28MP
  DEVICE_VARIANT := F
  DEVICE_PACKAGES += realtek-poe
endef

# The "IMG-" uImage name allows flashing the iniramfs from the vendor Web UI.
# Avoided for sysupgrade, as the vendor FW would do an incomplete flash.
define Device/engenius_ews2910p
  SOC := rtl8380
  IMAGE_SIZE := 8192k
  DEVICE_VENDOR := EnGenius
  DEVICE_MODEL := EWP2910P
  UIMAGE_MAGIC := 0x03802910
  KERNEL_INITRAMFS := \
	kernel-bin | \
	append-dtb | \
	libdeflate-gzip | \
	uImage gzip -n 'IMG-0.00.00-c0.0.00'
endef

define Device/hpe_1920-8g
  $(Device/Common/hpe_1920)
  SOC := rtl8380
  DEVICE_MODEL := 1920-8G (JG920A)
  H3C_DEVICE_ID := 0x00010023
endef

define Device/hpe_1920-16g
  $(Device/Common/hpe_1920)
  SOC := rtl8382
  DEVICE_MODEL := 1920-16G (JG923A)
  H3C_DEVICE_ID := 0x00010026
endef

define Device/hpe_1920-24g
  $(Device/Common/hpe_1920)
  SOC := rtl8382
  DEVICE_MODEL := 1920-24G (JG924A)
  H3C_DEVICE_ID := 0x00010027
endef

define Device/inaba_aml2-17gp
  SOC := rtl8382
  IMAGE_SIZE := 13504k
  DEVICE_VENDOR := INABA
  DEVICE_MODEL := Abaniact AML2-17GP
  UIMAGE_MAGIC := 0x83800000
endef

define Device/iodata_bsh-g24mb
  SOC := rtl8382
  IMAGE_SIZE := 13696k
  DEVICE_VENDOR := I-O DATA
  DEVICE_MODEL := BSH-G24MB
  UIMAGE_MAGIC := 0x83800013
endef

# "NGE" refers to the uImage magic
define Device/Common/netgear_nge
  KERNEL := \
	kernel-bin | \
	append-dtb | \
	lzma | \
	uImage lzma
  KERNEL_INITRAMFS := \
	kernel-bin | \
	append-dtb | \
	lzma | \
	uImage lzma
  SOC := rtl8380
  IMAGE_SIZE := 14848k
  UIMAGE_MAGIC := 0x4e474520
  DEVICE_VENDOR := NETGEAR
endef

define Device/netgear_gs108t-v3
  $(Device/Common/netgear_nge)
  DEVICE_MODEL := GS108T
  DEVICE_VARIANT := v3
endef

define Device/netgear_gs110tpp-v1
  $(Device/Common/netgear_nge)
  DEVICE_MODEL := GS110TPP
  DEVICE_VARIANT := v1
endef

define Device/netgear_gs308t-v1
  $(Device/Common/netgear_nge)
  DEVICE_MODEL := GS308T
  DEVICE_VARIANT := v1
  UIMAGE_MAGIC := 0x4e474335
endef

define Device/netgear_gs310tp-v1
  $(Device/Common/netgear_nge)
  DEVICE_MODEL := GS310TP
  DEVICE_VARIANT := v1
  UIMAGE_MAGIC := 0x4e474335
  DEVICE_PACKAGES += lua-rs232
endef

define Device/panasonic_m16eg-pn28160k
  SOC := rtl8382
  IMAGE_SIZE := 16384k
  DEVICE_VENDOR := Panasonic
  DEVICE_MODEL := Switch-M16eG
  DEVICE_VARIANT := PN28160K
  DEVICE_PACKAGES := kmod-i2c-mux-pca954x
endef

define Device/panasonic_m24eg-pn28240k
  SOC := rtl8382
  IMAGE_SIZE := 16384k
  DEVICE_VENDOR := Panasonic
  DEVICE_MODEL := Switch-M24eG
  DEVICE_VARIANT := PN28240K
  DEVICE_PACKAGES := kmod-i2c-mux-pca954x
endef

define Device/panasonic_m8eg-pn28080k
  SOC := rtl8380
  IMAGE_SIZE := 16384k
  DEVICE_VENDOR := Panasonic
  DEVICE_MODEL := Switch-M8eG
  DEVICE_VARIANT := PN28080K
  DEVICE_PACKAGES := kmod-i2c-mux-pca954x
endef

define Device/tplink_sg2008p-v1
  SOC := rtl8380
  KERNEL_SIZE := 6m
  IMAGE_SIZE := 26m
  DEVICE_VENDOR := TP-Link
  DEVICE_MODEL := SG2008P
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-hwmon-tps23861
endef

define Device/tplink_sg2210p-v3
  SOC := rtl8380
  KERNEL_SIZE := 6m
  IMAGE_SIZE := 26m
  DEVICE_VENDOR := TP-Link
  DEVICE_MODEL := SG2210P
  DEVICE_VARIANT := v3
  DEVICE_PACKAGES := kmod-hwmon-tps23861
endef

define Device/zyxel_gs1900-10hp
  $(Device/Common/zyxel_gs1900)
  SOC := rtl8380
  DEVICE_MODEL := GS1900-10HP
  ZYXEL_VERS := AAZI
endef

define Device/zyxel_gs1900-16
  $(Device/Common/zyxel_gs1900)
  SOC := rtl8382
  DEVICE_MODEL := GS1900-16
  ZYXEL_VERS := AAHJ
endef

define Device/zyxel_gs1900-8
  $(Device/Common/zyxel_gs1900)
  SOC := rtl8380
  DEVICE_MODEL := GS1900-8
  ZYXEL_VERS := AAHH
endef

define Device/zyxel_gs1900-8hp-v1
  $(Device/Common/zyxel_gs1900)
  SOC := rtl8380
  DEVICE_MODEL := GS1900-8HP
  DEVICE_VARIANT := v1
  ZYXEL_VERS := AAHI
  DEVICE_PACKAGES += lua-rs232
endef

define Device/zyxel_gs1900-8hp-v2
  $(Device/Common/zyxel_gs1900)
  SOC := rtl8380
  DEVICE_MODEL := GS1900-8HP
  DEVICE_VARIANT := v2
  ZYXEL_VERS := AAHI
  DEVICE_PACKAGES += lua-rs232
endef

define Device/zyxel_gs1900-24-v1
  $(Device/Common/zyxel_gs1900)
  SOC := rtl8382
  DEVICE_MODEL := GS1900-24
  DEVICE_VARIANT := v1
  ZYXEL_VERS := AAHL
endef

define Device/zyxel_gs1900-24e
  $(Device/Common/zyxel_gs1900)
  SOC := rtl8382
  DEVICE_MODEL := GS1900-24E
  ZYXEL_VERS := AAHK
endef

define Device/zyxel_gs1900-24hp-v1
  $(Device/Common/zyxel_gs1900)
  SOC := rtl8382
  DEVICE_MODEL := GS1900-24HP
  DEVICE_VARIANT := v1
  ZYXEL_VERS := AAHM
endef

define Device/zyxel_gs1900-24hp-v2
  $(Device/Common/zyxel_gs1900)
  SOC := rtl8382
  DEVICE_MODEL := GS1900-24HP
  DEVICE_VARIANT := v2
  ZYXEL_VERS := ABTP
endef
