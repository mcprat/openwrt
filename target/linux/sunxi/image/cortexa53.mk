# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2013-2016 OpenWrt.org
# Copyright (C) 2016 Yousong Zhou

define DeviceCommon/sun50i
  SUNXI_DTS_DIR := allwinner/
  KERNEL_NAME := Image
  KERNEL := kernel-bin
endef

define DeviceCommon/sun50i-a64
  SOC := sun50i-a64
  $(DeviceCommon/sun50i)
endef

define DeviceCommon/sun50i-h5
  SOC := sun50i-h5
  $(DeviceCommon/sun50i)
endef

define DeviceCommon/sun50i-h6
  SOC := sun50i-h6
  $(DeviceCommon/sun50i)
endef

define Device/friendlyarm_nanopi-neo-plus2
  DEVICE_VENDOR := FriendlyARM
  DEVICE_MODEL := NanoPi NEO Plus2
  SUPPORTED_DEVICES:=nanopi-neo-plus2
  $(DeviceCommon/sun50i-h5)
endef

define Device/friendlyarm_nanopi-neo2
  DEVICE_VENDOR := FriendlyARM
  DEVICE_MODEL := NanoPi NEO2
  SUPPORTED_DEVICES:=nanopi-neo2
  $(DeviceCommon/sun50i-h5)
endef

define Device/friendlyarm_nanopi-r1s-h5
  DEVICE_VENDOR := FriendlyARM
  DEVICE_MODEL := Nanopi R1S H5
  DEVICE_PACKAGES := kmod-gpio-button-hotplug kmod-usb-net-rtl8152
  SUPPORTED_DEVICES:=nanopi-r1s-h5
  $(DeviceCommon/sun50i-h5)
endef

define Device/libretech_all-h3-cc-h5
  DEVICE_VENDOR := Libre Computer
  DEVICE_MODEL := ALL-H3-CC
  DEVICE_VARIANT := H5
  $(DeviceCommon/sun50i-h5)
  SUNXI_DTS := $$(SUNXI_DTS_DIR)$$(SOC)-libretech-all-h3-cc
endef

define Device/olimex_a64-olinuxino
  DEVICE_VENDOR := Olimex
  DEVICE_MODEL := A64-Olinuxino
  DEVICE_PACKAGES := kmod-rtl8723bs rtl8723bu-firmware
  $(DeviceCommon/sun50i-a64)
  SUNXI_DTS := $$(SUNXI_DTS_DIR)$$(SOC)-olinuxino
endef

define Device/olimex_a64-olinuxino-emmc
  DEVICE_VENDOR := Olimex
  DEVICE_MODEL := A64-Olinuxino
  DEVICE_VARIANT := eMMC
  DEVICE_PACKAGES := kmod-rtl8723bs rtl8723bu-firmware
  $(DeviceCommon/sun50i-a64)
  SUNXI_DTS := $$(SUNXI_DTS_DIR)$$(SOC)-olinuxino-emmc
endef

define Device/pine64_pine64-plus
  DEVICE_VENDOR := Pine64
  DEVICE_MODEL := Pine64+
  DEVICE_PACKAGES := kmod-rtl8723bs rtl8723bu-firmware
  $(DeviceCommon/sun50i-a64)
endef

define Device/pine64_sopine-baseboard
  DEVICE_VENDOR := Pine64
  DEVICE_MODEL := SoPine
  DEVICE_PACKAGES := kmod-rtl8723bs rtl8723bu-firmware
  $(DeviceCommon/sun50i-a64)
endef

define Device/xunlong_orangepi-one-plus
  $(DeviceCommon/sun50i-h6)
  DEVICE_VENDOR := Xunlong
  DEVICE_MODEL := Orange Pi One Plus
  SUNXI_DTS_DIR := allwinner/
endef

define Device/xunlong_orangepi-pc2
  DEVICE_VENDOR := Xunlong
  DEVICE_MODEL := Orange Pi PC 2
  $(DeviceCommon/sun50i-h5)
endef

define Device/xunlong_orangepi-zero-plus
  DEVICE_VENDOR := Xunlong
  DEVICE_MODEL := Orange Pi Zero Plus
  $(DeviceCommon/sun50i-h5)
endef
