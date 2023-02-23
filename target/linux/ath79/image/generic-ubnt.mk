include ./common-ubnt.mk

define Device/ubnt_aircube-ac
  $(DeviceCommon/ubnt-acb)
  SOC := ar9342
  DEVICE_MODEL := airCube AC
  UBNT_CHIP := ar9342
  DEVICE_PACKAGES += kmod-ath10k-ct-smallbuffers ath10k-firmware-qca988x-ct
endef

define Device/ubnt_aircube-isp
  $(DeviceCommon/ubnt-acb)
  SOC := qca9533
  DEVICE_MODEL := airCube ISP
  UBNT_CHIP := qca9533
  SUPPORTED_DEVICES += ubnt,acb-isp
endef

define Device/ubnt_bullet-ac
  $(DeviceCommon/ubnt-2wa)
  DEVICE_MODEL := Bullet AC
  DEVICE_PACKAGES += kmod-ath10k-ct-smallbuffers ath10k-firmware-qca988x-ct rssileds
endef

define Device/ubnt_bullet-m-xw
  $(DeviceCommon/ubnt-xw)
  DEVICE_MODEL := Bullet M
  DEVICE_PACKAGES += rssileds
  SUPPORTED_DEVICES += bullet-m-xw
endef

define Device/ubnt_edgeswitch-5xp
  $(DeviceCommon/ubnt-sw)
  DEVICE_MODEL := EdgeSwitch 5XP
endef

define Device/ubnt_edgeswitch-8xp
  $(DeviceCommon/ubnt-sw)
  DEVICE_MODEL := EdgeSwitch 8XP
  DEVICE_PACKAGES += kmod-switch-bcm53xx-mdio
  DEFAULT := n
endef

define Device/ubnt_lap-120
  $(DeviceCommon/ubnt-wa)
  DEVICE_MODEL := LiteAP ac (LAP-120)
  DEVICE_PACKAGES += kmod-ath10k-ct-smallbuffers ath10k-firmware-qca988x-ct
endef

define Device/ubnt_litebeam-ac-gen2
  $(DeviceCommon/ubnt-wa)
  DEVICE_MODEL := LiteBeam AC
  DEVICE_VARIANT := Gen2
  DEVICE_PACKAGES := kmod-ath10k-ct-smallbuffers ath10k-firmware-qca988x-ct
endef

define Device/ubnt_nanobeam-ac
  $(DeviceCommon/ubnt-wa)
  DEVICE_MODEL := NanoBeam AC
  DEVICE_VARIANT := Gen1
  DEVICE_PACKAGES += kmod-ath10k-ct-smallbuffers ath10k-firmware-qca988x-ct rssileds
endef

define Device/ubnt_nanobeam-ac-gen2
  $(DeviceCommon/ubnt-wa)
  DEVICE_MODEL := NanoBeam AC
  DEVICE_VARIANT := Gen2
  DEVICE_PACKAGES += kmod-ath10k-ct-smallbuffers ath10k-firmware-qca988x-ct rssileds
endef

define Device/ubnt_nanobeam-ac-xc
  $(DeviceCommon/ubnt-xc)
  SOC := qca9558
  DEVICE_MODEL := NanoBeam AC
  DEVICE_VARIANT := Gen1 (XC)
  DEVICE_PACKAGES += kmod-ath10k-ct ath10k-firmware-qca988x-ct rssileds
endef

define Device/ubnt_nanobeam-m5-xw
  $(DeviceCommon/ubnt-xw)
  DEVICE_MODEL := NanoBeam M5
  DEVICE_PACKAGES += rssileds
  SUPPORTED_DEVICES += loco-m-xw
endef

define Device/ubnt_nanostation-ac
  $(DeviceCommon/ubnt-wa)
  DEVICE_MODEL := Nanostation AC
  DEVICE_PACKAGES += kmod-ath10k-ct-smallbuffers ath10k-firmware-qca988x-ct rssileds
endef

define Device/ubnt_nanostation-ac-loco
  $(DeviceCommon/ubnt-wa)
  DEVICE_MODEL := Nanostation AC loco
  DEVICE_PACKAGES += kmod-ath10k-ct-smallbuffers ath10k-firmware-qca988x-ct
endef

define Device/ubnt_nanostation-loco-m-xw
  $(DeviceCommon/ubnt-xw)
  DEVICE_MODEL := Nanostation Loco M
  DEVICE_PACKAGES += rssileds
  SUPPORTED_DEVICES += loco-m-xw
endef

define Device/ubnt_nanostation-m-xw
  $(DeviceCommon/ubnt-xw)
  DEVICE_MODEL := Nanostation M
  DEVICE_PACKAGES += rssileds
  SUPPORTED_DEVICES += nanostation-m-xw
endef

define Device/ubnt_powerbeam-5ac-500
  $(DeviceCommon/ubnt-xc)
  SOC := qca9558
  DEVICE_MODEL := PowerBeam 5AC
  DEVICE_VARIANT := 500
  DEVICE_PACKAGES := kmod-ath10k-ct ath10k-firmware-qca988x-ct
endef

define Device/ubnt_powerbeam-5ac-gen2
  $(DeviceCommon/ubnt-wa)
  DEVICE_MODEL := PowerBeam 5AC
  DEVICE_VARIANT := Gen2
  DEVICE_PACKAGES := kmod-ath10k-ct-smallbuffers ath10k-firmware-qca988x-ct rssileds
endef

define Device/ubnt_powerbeam-m2-xw
  $(DeviceCommon/ubnt-xw)
  DEVICE_MODEL := PowerBeam M2
  DEVICE_PACKAGES += rssileds
  SUPPORTED_DEVICES += loco-m-xw
endef

define Device/ubnt_powerbeam-m5-xw
  $(DeviceCommon/ubnt-xw)
  DEVICE_MODEL := PowerBeam M5
  DEVICE_PACKAGES += rssileds
  SUPPORTED_DEVICES += loco-m-xw
endef

define Device/ubnt_rocket-5ac-lite
  $(DeviceCommon/ubnt-xc)
  SOC := qca9558
  DEVICE_MODEL := Rocket 5AC
  DEVICE_VARIANT := Lite
  DEVICE_PACKAGES := kmod-ath10k-ct ath10k-firmware-qca988x-ct
endef

define DeviceCommon/ubnt_routerstation
  DEVICE_PACKAGES := -kmod-ath9k -wpad-basic-mbedtls -uboot-envtools kmod-usb-ohci \
	kmod-usb2 fconfig
  DEVICE_VENDOR := Ubiquiti
  SOC := ar7161
  LOADER_TYPE := bin
  LOADER_FLASH_OFFS := 0x50000
  COMPILE := loader-$(1).bin
  COMPILE/loader-$(1).bin := loader-okli-compile | lzma | pad-to 128k
  IMAGE_SIZE := 16000k
  IMAGES += factory.bin
  IMAGE/factory.bin := append-kernel | uImage lzma -M 0x4f4b4c49 | pad-to $$$$(BLOCKSIZE) | \
	append-rootfs | pad-rootfs | pad-to $$$$(BLOCKSIZE) | \
	mkubntimage $$$$(KDIR)/loader-$(1).bin | check-size
  IMAGE/sysupgrade.bin := append-kernel | uImage lzma -M 0x4f4b4c49 | pad-to $$$$(BLOCKSIZE) | \
	append-rootfs | pad-rootfs | pad-to $$$$(BLOCKSIZE) | check-size | \
	sysupgrade-tar kernel=$$$$(KDIR)/loader-$(1).bin rootfs=$$$$@ | append-metadata
  KERNEL := kernel-bin | append-dtb | lzma
  KERNEL_INITRAMFS := kernel-bin | append-dtb
  DEVICE_COMPAT_VERSION := 2.0
  DEVICE_COMPAT_MESSAGE := Partition design has changed compared to older versions (19.07 and 21.02) \
	due to kernel drivers restrictions. Upgrade via sysupgrade mechanism is one way operation. \
	Downgrading OpenWrt version will involve usage of TFTP recovery or bootloader command line interface.
endef

define Device/ubnt_routerstation
  $(DeviceCommon/ubnt_routerstation)
  DEVICE_MODEL := RouterStation
  UBNT_BOARD := RS
  UBNT_TYPE := RSx
  UBNT_CHIP := ar7100
  DEVICE_PACKAGES += -swconfig
endef

define Device/ubnt_routerstation-pro
  $(DeviceCommon/ubnt_routerstation)
  DEVICE_MODEL := RouterStation Pro
  UBNT_BOARD := RSPRO
  UBNT_TYPE := RSPRO
  UBNT_CHIP := ar7100pro
endef

define Device/ubnt_unifi-ap
  $(DeviceCommon/ubnt-bz)
  DEVICE_MODEL := UniFi AP
  SUPPORTED_DEVICES += unifi ubnt,unifi
endef

define Device/ubnt_unifi-ap-lr
  $(DeviceCommon/ubnt-bz)
  DEVICE_MODEL := UniFi AP
  DEVICE_VARIANT := LR
  SUPPORTED_DEVICES += unifi ubnt,unifi ubnt,unifi-ap
endef

define DeviceCommon/ubnt_unifiac
  DEVICE_VENDOR := Ubiquiti
  SOC := qca9563
  IMAGE_SIZE := 15488k
  DEVICE_PACKAGES := kmod-ath10k-ct ath10k-firmware-qca988x-ct
endef

define Device/ubnt_unifiac-lite
  $(DeviceCommon/ubnt_unifiac)
  DEVICE_MODEL := UniFi AC Lite
  DEVICE_PACKAGES += -swconfig
  SUPPORTED_DEVICES += unifiac-lite
endef

define Device/ubnt_unifiac-lr
  $(DeviceCommon/ubnt_unifiac)
  DEVICE_MODEL := UniFi AC LR
  DEVICE_PACKAGES += -swconfig
  SUPPORTED_DEVICES += unifiac-lite ubnt,unifiac-lite
endef

define Device/ubnt_unifiac-mesh
  $(DeviceCommon/ubnt_unifiac)
  DEVICE_MODEL := UniFi AC Mesh
  DEVICE_PACKAGES += -swconfig
  SUPPORTED_DEVICES += unifiac-lite
endef

define Device/ubnt_unifiac-mesh-pro
  $(DeviceCommon/ubnt_unifiac)
  DEVICE_MODEL := UniFi AC Mesh Pro
  SUPPORTED_DEVICES += unifiac-pro
endef

define Device/ubnt_unifiac-pro
  $(DeviceCommon/ubnt_unifiac)
  DEVICE_MODEL := UniFi AC Pro
  DEVICE_PACKAGES += kmod-usb2
  SUPPORTED_DEVICES += unifiac-pro
endef

define Device/ubnt_unifi-ap-outdoor-plus
  $(DeviceCommon/ubnt-bz)
  $(DeviceCommon/ubnt-unifi-jffs2)
  DEVICE_MODEL := UniFi AP Outdoor+
  SUPPORTED_DEVICES += unifi-outdoor-plus
endef

define Device/ubnt_unifi-ap-pro
  $(DeviceCommon/ubnt-unifi-jffs2)
  SOC := ar9344
  DEVICE_MODEL := UniFi AP Pro
  UBNT_CHIP := ar934x
  SUPPORTED_DEVICES += uap-pro
endef
