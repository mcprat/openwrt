DEVICE_VARS += TPLINK_FLASHLAYOUT TPLINK_HWID TPLINK_HWREV TPLINK_HWREVADD TPLINK_HVERSION

define DeviceCommon/dsa-migration
  DEVICE_COMPAT_VERSION := 1.1
  DEVICE_COMPAT_MESSAGE := Config cannot be migrated from swconfig to DSA
endef

define DeviceCommon/lantiqTpLink
  DEVICE_VENDOR := TP-Link
  TPLINK_HWREVADD := 0
  TPLINK_HVERSION := 2
  KERNEL := kernel-bin | append-dtb | lzma
  KERNEL_INITRAMFS := kernel-bin | append-dtb | lzma | \
	tplink-v2-header -s -V "ver. 1.0"
  IMAGES := sysupgrade.bin
  IMAGE/sysupgrade.bin := tplink-v2-image -s -V "ver. 1.0" | \
	check-size | append-metadata
endef

define Device/tplink_tdw8970
  $(DeviceCommon/dsa-migration)
  $(DeviceCommon/lantiqTpLink)
  DEVICE_MODEL := TD-W8970
  DEVICE_VARIANT := v1
  TPLINK_FLASHLAYOUT := 8Mltq
  TPLINK_HWID := 0x89700001
  TPLINK_HWREV := 1
  IMAGE_SIZE := 7680k
  DEVICE_PACKAGES:= kmod-ath9k wpad-basic-mbedtls kmod-usb-dwc2 kmod-usb-ledtrig-usbport
  SUPPORTED_DEVICES += TDW8970
endef

define Device/tplink_tdw8980
  $(DeviceCommon/dsa-migration)
  $(DeviceCommon/lantiqTpLink)
  DEVICE_MODEL := TD-W8980
  DEVICE_VARIANT := v1
  TPLINK_FLASHLAYOUT := 8Mltq
  TPLINK_HWID := 0x89800001
  TPLINK_HWREV := 14
  IMAGE_SIZE := 7680k
  DEVICE_PACKAGES:= kmod-ath9k kmod-owl-loader wpad-basic-mbedtls kmod-usb-dwc2 kmod-usb-ledtrig-usbport
  SUPPORTED_DEVICES += TDW8980
endef

define Device/tplink_vr200
  $(DeviceCommon/dsa-migration)
  $(DeviceCommon/lantiqTpLink)
  DEVICE_MODEL := Archer VR200
  DEVICE_VARIANT := v1
  TPLINK_FLASHLAYOUT := 16Mltq
  TPLINK_HWID := 0x63e64801
  TPLINK_HWREV := 0x53
  IMAGE_SIZE := 15808k
  DEVICE_PACKAGES:= kmod-mt76x0e wpad-basic-mbedtls kmod-usb-dwc2 kmod-usb-ledtrig-usbport
  SUPPORTED_DEVICES += VR200
endef

define Device/tplink_vr200v
  $(DeviceCommon/dsa-migration)
  $(DeviceCommon/lantiqTpLink)
  DEVICE_MODEL := Archer VR200v
  DEVICE_VARIANT := v1
  TPLINK_FLASHLAYOUT := 16Mltq
  TPLINK_HWID := 0x73b70801
  TPLINK_HWREV := 0x2f
  IMAGE_SIZE := 15808k
  DEVICE_PACKAGES:= kmod-mt76x0e wpad-basic-mbedtls kmod-usb-dwc2 kmod-usb-ledtrig-usbport kmod-ltq-tapi kmod-ltq-vmmc
  SUPPORTED_DEVICES += VR200v
endef
