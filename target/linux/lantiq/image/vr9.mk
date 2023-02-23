DEVICE_VARS += NETGEAR_BOARD_ID NETGEAR_HW_ID

define DeviceCommon/dsa-migration
  DEVICE_COMPAT_VERSION := 1.1
  DEVICE_COMPAT_MESSAGE := Config cannot be migrated from swconfig to DSA
endef

define Device/alphanetworks_asl56026
  $(DeviceCommon/dsa-migration)
  DEVICE_VENDOR := Alpha
  DEVICE_MODEL := ASL56026
  DEVICE_ALT0_VENDOR := BT Openreach
  DEVICE_ALT0_MODEL := ECI VDSL Modem V-2FUb/I
  IMAGE_SIZE := 7488k
endef

define Device/arcadyan_arv7519rw22
  $(DeviceCommon/dsa-migration)
  DEVICE_VENDOR := Arcadyan
  DEVICE_MODEL := ARV7519RW22
  DEVICE_ALT0_VENDOR := Orange
  DEVICE_ALT0_MODEL := Livebox
  DEVICE_ALT0_VARIANT := 2.1
  DEVICE_ALT1_VENDOR := Astoria Networks
  DEVICE_ALT1_MODEL := ARV7519RW22
  KERNEL_SIZE := 2048k
  IMAGE_SIZE := 31232k
  DEVICE_PACKAGES := kmod-usb-dwc2
  SUPPORTED_DEVICES += ARV7519RW22
  DEFAULT := n
endef

define Device/arcadyan_vg3503j
  $(DeviceCommon/dsa-migration)
  DEVICE_VENDOR := BT Openreach
  DEVICE_MODEL := ECI VDSL Modem V-2FUb/R
  IMAGE_SIZE := 8000k
  SUPPORTED_DEVICES += VG3503J
endef

define Device/arcadyan_vgv7510kw22-brn
  $(DeviceCommon/dsa-migration)
  $(DeviceCommon/lantiqBrnImage)
  DEVICE_VENDOR := Arcadyan
  DEVICE_MODEL := VGV7510KW22
  DEVICE_VARIANT := BRN
  DEVICE_ALT0_VENDOR := o2
  DEVICE_ALT0_MODEL := Box 6431
  DEVICE_ALT0_VARIANT := BRN
  IMAGE_SIZE := 7168k
  SIGNATURE := BRNDA6431
  MAGIC := 0x12345678
  CRC32_POLY := 0x04c11db7
  DEVICE_PACKAGES := kmod-rt2800-pci wpad-basic-mbedtls kmod-usb-dwc2 kmod-ltq-tapi kmod-ltq-vmmc
  SUPPORTED_DEVICES += VGV7510KW22BRN
endef

define Device/arcadyan_vgv7510kw22-nor
  $(DeviceCommon/dsa-migration)
  DEVICE_VENDOR := Arcadyan
  DEVICE_MODEL := VGV7510KW22
  DEVICE_VARIANT := NOR
  DEVICE_ALT0_VENDOR := o2
  DEVICE_ALT0_MODEL := Box 6431
  DEVICE_ALT0_VARIANT := NOR
  IMAGE_SIZE := 15232k
  DEVICE_PACKAGES := kmod-rt2800-pci wpad-basic-mbedtls kmod-usb-dwc2 kmod-ltq-tapi kmod-ltq-vmmc
  SUPPORTED_DEVICES += VGV7510KW22NOR
endef

define Device/arcadyan_vgv7519-brn
  $(DeviceCommon/dsa-migration)
  $(DeviceCommon/lantiqBrnImage)
  DEVICE_VENDOR := Arcadyan
  DEVICE_MODEL := VGV7519
  DEVICE_VARIANT := BRN
  DEVICE_ALT0_VENDOR := KPN
  DEVICE_ALT0_MODEL := Experiabox 8
  DEVICE_ALT0_VARIANT := BRN
  IMAGE_SIZE := 7168k
  SIGNATURE := 5D00008000
  MAGIC := 0x12345678
  CRC32_POLY := 0x2083b8ed
  DEVICE_PACKAGES := kmod-rt2800-pci wpad-basic-mbedtls kmod-usb-dwc2 kmod-ltq-tapi kmod-ltq-vmmc
  SUPPORTED_DEVICES += VGV7519BRN
endef

define Device/arcadyan_vgv7519-nor
  $(DeviceCommon/dsa-migration)
  DEVICE_VENDOR := Arcadyan
  DEVICE_MODEL := VGV7519
  DEVICE_VARIANT := NOR
  DEVICE_ALT0_VENDOR := KPN
  DEVICE_ALT0_MODEL := Experiabox 8
  DEVICE_ALT0_VARIANT := NOR
  IMAGE_SIZE := 15360k
  DEVICE_PACKAGES := kmod-rt2800-pci wpad-basic-mbedtls kmod-usb-dwc2 kmod-ltq-tapi kmod-ltq-vmmc
  SUPPORTED_DEVICES += VGV7519NOR
endef

define DeviceCommon/avm_fritz3370
  $(DeviceCommon/dsa-migration)
  $(DeviceCommon/AVM)
  $(DeviceCommon/NAND)
  DEVICE_MODEL := FRITZ!Box 3370
  DEVICE_VARIANT := Rev. 2
  KERNEL_SIZE := 4096k
  UBINIZE_OPTS := -E 5
  IMAGES += eva-kernel.bin eva-filesystem.bin
  IMAGE/eva-kernel.bin := append-kernel
  IMAGE/eva-filesystem.bin := append-ubi
  DEVICE_PACKAGES := kmod-ath9k wpad-basic-mbedtls kmod-usb-dwc2 fritz-tffs
endef

define Device/avm_fritz3370-rev2-hynix
  $(DeviceCommon/dsa-migration)
  $(DeviceCommon/avm_fritz3370)
  DEVICE_MODEL := FRITZ!Box 3370
  DEVICE_VARIANT := Rev. 2 (Hynix NAND)
endef

define Device/avm_fritz3370-rev2-micron
  $(DeviceCommon/dsa-migration)
  $(DeviceCommon/avm_fritz3370)
  DEVICE_MODEL := FRITZ!Box 3370
  DEVICE_VARIANT := Rev. 2 (Micron NAND)
endef

define Device/avm_fritz3390
  $(DeviceCommon/dsa-migration)
  $(DeviceCommon/AVM)
  $(DeviceCommon/NAND)
  DEVICE_MODEL := FRITZ!Box 3390
  KERNEL_SIZE := 4096k
  IMAGE_SIZE := 49152k
  DEVICE_PACKAGES := kmod-ath9k kmod-owl-loader wpad-basic-mbedtls \
	kmod-usb-dwc2 fritz-tffs
endef

define Device/avm_fritz7360sl
  $(DeviceCommon/dsa-migration)
  $(DeviceCommon/AVM)
  DEVICE_MODEL := FRITZ!Box 7360 SL
  IMAGE_SIZE := 15744k
  DEVICE_PACKAGES := kmod-ath9k kmod-owl-loader wpad-basic-mbedtls \
	kmod-usb-dwc2 fritz-tffs
  SUPPORTED_DEVICES += FRITZ7360SL
endef

define Device/avm_fritz7360-v2
  $(DeviceCommon/dsa-migration)
  $(DeviceCommon/AVM)
  DEVICE_MODEL := FRITZ!Box 7360
  DEVICE_VARIANT := v2
  IMAGE_SIZE := 32128k
  DEVICE_PACKAGES := kmod-ath9k kmod-owl-loader wpad-basic-mbedtls \
	kmod-usb-dwc2 fritz-tffs
endef

define Device/avm_fritz7362sl
  $(DeviceCommon/dsa-migration)
  $(DeviceCommon/AVM)
  $(DeviceCommon/NAND)
  DEVICE_MODEL := FRITZ!Box 7362 SL
  KERNEL_SIZE := 4096k
  IMAGE_SIZE := 49152k
  DEVICE_PACKAGES := kmod-ath9k kmod-owl-loader wpad-basic-mbedtls \
	kmod-usb-dwc2 fritz-tffs
endef

define Device/avm_fritz7412
  $(DeviceCommon/dsa-migration)
  $(DeviceCommon/AVM)
  $(DeviceCommon/NAND)
  DEVICE_MODEL := FRITZ!Box 7412
  BOARD_NAME := FRITZ7412
  KERNEL_SIZE := 4096k
  IMAGE_SIZE := 49152k
  DEVICE_PACKAGES := kmod-ath9k kmod-owl-loader wpad-basic-mbedtls \
	fritz-tffs-nand fritz-caldata
endef

define Device/avm_fritz7430
  $(DeviceCommon/dsa-migration)
  $(DeviceCommon/AVM)
  $(DeviceCommon/NAND)
  DEVICE_MODEL := FRITZ!Box 7430
  KERNEL_SIZE := 4096k
  IMAGE_SIZE := 49152k
  DEVICE_PACKAGES := kmod-ath9k kmod-owl-loader wpad-basic-mbedtls \
	kmod-usb-dwc2 fritz-tffs-nand fritz-caldata
endef

define Device/bt_homehub-v5a
  $(DeviceCommon/dsa-migration)
  $(DeviceCommon/NAND)
  DEVICE_VENDOR := British Telecom (BT)
  DEVICE_MODEL := Home Hub 5
  DEVICE_VARIANT := Type A
  BOARD_NAME := BTHOMEHUBV5A
  DEVICE_PACKAGES := kmod-ath9k kmod-owl-loader \
	kmod-ath10k-ct ath10k-firmware-qca988x-ct wpad-basic-mbedtls kmod-usb-dwc2
  SUPPORTED_DEVICES += BTHOMEHUBV5A
endef

define Device/buffalo_wbmr-300hpd
  $(DeviceCommon/dsa-migration)
  DEVICE_VENDOR := Buffalo
  DEVICE_MODEL := WBMR-300HPD
  IMAGE_SIZE := 15616k
  DEVICE_PACKAGES := kmod-mt7603 wpad-basic-mbedtls kmod-usb-dwc2
  SUPPORTED_DEVICES += WBMR300
endef

define Device/lantiq_easy80920-nand
  $(DeviceCommon/dsa-migration)
  $(DeviceCommon/lantiqFullImage)
  DEVICE_VENDOR := Lantiq
  DEVICE_MODEL := VR9 EASY80920
  DEVICE_VARIANT := NAND
  IMAGE_SIZE := 64512k
  DEVICE_PACKAGES := kmod-ath9k kmod-owl-loader wpad-basic-mbedtls kmod-usb-dwc2 kmod-usb-ledtrig-usbport
endef

define Device/lantiq_easy80920-nor
  $(DeviceCommon/dsa-migration)
  DEVICE_VENDOR := Lantiq
  DEVICE_MODEL := VR9 EASY80920
  DEVICE_VARIANT := NOR
  IMAGE_SIZE := 7936k
  DEVICE_PACKAGES := kmod-ath9k kmod-owl-loader wpad-basic-mbedtls kmod-usb-dwc2 kmod-usb-ledtrig-usbport
endef

define Device/netgear_dm200
  $(DeviceCommon/dsa-migration)
  DEVICE_VENDOR := NETGEAR
  DEVICE_MODEL := DM200
  IMAGES := sysupgrade.bin factory.img
  IMAGE/sysupgrade.bin := append-kernel | \
	pad-offset 64k 64 | append-uImage-fakehdr filesystem | \
	pad-offset 64k 64 | append-uImage-fakehdr filesystem | \
	append-rootfs | pad-rootfs | check-size | append-metadata
  IMAGE/factory.img := $$(IMAGE/sysupgrade.bin) | netgear-dni
  IMAGE_SIZE := 7872k
  NETGEAR_BOARD_ID := DM200
  NETGEAR_HW_ID := 29765233+8+0+64+0+0
endef

define Device/zyxel_p-2812hnu-f1
  $(DeviceCommon/dsa-migration)
  $(DeviceCommon/NAND)
  DEVICE_VENDOR := ZyXEL
  DEVICE_MODEL := P-2812HNU
  DEVICE_VARIANT := F1
  BOARD_NAME := P2812HNUF1
  DEVICE_PACKAGES := kmod-rt2800-pci wpad-basic-mbedtls kmod-usb-dwc2 kmod-usb-ledtrig-usbport
  KERNEL_SIZE := 3072k
  SUPPORTED_DEVICES += P2812HNUF1
endef

define Device/zyxel_p-2812hnu-f3
  $(DeviceCommon/dsa-migration)
  $(DeviceCommon/NAND)
  DEVICE_VENDOR := ZyXEL
  DEVICE_MODEL := P-2812HNU
  DEVICE_VARIANT := F3
  BOARD_NAME := P2812HNUF3
  DEVICE_PACKAGES := kmod-rt2800-pci wpad-basic-mbedtls kmod-usb-dwc2
  KERNEL_SIZE := 2048k
  SUPPORTED_DEVICES += P2812HNUF3
  DEFAULT := n
endef
