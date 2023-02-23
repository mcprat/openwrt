#################################################
# Subtarget legacy
#################################################

define Device/asus_wl-300g
  DEVICE_MODEL := WL-300g
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/asus)
  PRODUCTID := "WL300g      "
endef

define Device/asus_wl-320gp
  DEVICE_MODEL := WL-320gP
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/asus)
  PRODUCTID := "WL320gP     "
endef

define Device/asus_wl-330ge
  DEVICE_MODEL := WL-330gE
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/asus)
  PRODUCTID := "WL-330gE    "
endef

define Device/asus_wl-500gd
  DEVICE_MODEL := WL-500g Deluxe
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/asus)
  PRODUCTID := "WL500gx     "
endef

define Device/asus_wl-500gp-v1
  DEVICE_MODEL := WL-500gP
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/asus)
  PRODUCTID := "WL500gp     "
endef

define Device/asus_wl-500gp-v2
  DEVICE_MODEL := WL-500gP
  DEVICE_VARIANT := v2
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/asus)
  PRODUCTID := "WL500gpv2   "
endef

define Device/asus_wl-500w
  DEVICE_MODEL := WL-500W
  DEVICE_PACKAGES := kmod-b43 kmod-usb-uhci kmod-usb2-pci
  $(DeviceCommon/asus)
  PRODUCTID := "WL500W      "
endef

define Device/asus_wl-520gu
  DEVICE_MODEL := WL-520gU
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/asus)
  PRODUCTID := "WL520gu     "
endef

define Device/asus_wl-550ge
  DEVICE_MODEL := WL-550gE
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/asus)
  PRODUCTID := "WL550gE     "
endef

define Device/asus_wl-hdd25
  DEVICE_MODEL := WL-HDD25
  DEVICE_PACKAGES := kmod-b43 $(USB1_PACKAGES)
  $(DeviceCommon/asus)
  PRODUCTID := "WLHDD       "
endef

define Device/dlink_dwl-3150
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DWL-3150
  IMAGES := bin
  IMAGE/bin := append-rootfs | trx-with-loader | tailed-bin
  BIN_TAIL := BCM-5352-2050-0000000-01
endef

define Device/edimax_ps1208-mfg
  DEVICE_VENDOR := Edimax
  DEVICE_MODEL := PS-1208MFg
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  IMAGES := bin
  IMAGE/bin := append-rootfs | trx-with-loader | edimax-bin
endef

define Device/huawei_e970
  DEVICE_VENDOR := Huawei
  DEVICE_MODEL := E970
  DEVICE_PACKAGES := kmod-b43
  KERNEL_NAME = vmlinux.gz
  IMAGES := bin
  IMAGE/bin := append-rootfs | trx-without-loader | huawei-bin
endef

define Device/linksys_wrt54g3g
  DEVICE_MODEL := WRT54G3G
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/linksys)
  DEVICE_ID := W54F
  VERSION := 2.20.1
endef

define Device/linksys_wrt54g3g-em
  DEVICE_MODEL := WRT54G3G-EM
  $(DeviceCommon/linksys)
  DEVICE_ID := W3GN
  VERSION := 2.20.1
endef

define Device/linksys_wrt54g3gv2-vf
  DEVICE_VENDOR := Linksys
  DEVICE_MODEL := WRT54G3GV2-VF
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  FILESYSTEMS := $(FS_128K)
  IMAGES := noheader.bin bin
  IMAGE/noheader.bin := linksys-pattern-partition | append-rootfs | trx-v2-with-loader
  IMAGE/bin := linksys-pattern-partition | append-rootfs | trx-v2-with-loader | linksys-bin
  DEVICE_ID := 3G2V
  VERSION := 3.00.24
  SERIAL := 6
endef

define Device/linksys_wrt54g
  DEVICE_MODEL := WRT54G
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/linksys)
  DEVICE_ID := W54G
  VERSION := 4.71.1
endef

define Device/linksys_wrt54gs
  DEVICE_MODEL := WRT54GS
  DEVICE_VARIANT := v1/v2/v3
  DEVICE_ALT0_VENDOR := Linksys
  DEVICE_ALT0_MODEL := WRT54G-TM
  DEVICE_ALT0_VARIANT := v1
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/linksys)
  FILESYSTEMS := $(FS_128K)
  DEVICE_ID := W54S
  VERSION := 4.80.1
endef

define Device/linksys_wrt54gs-v4
  DEVICE_MODEL := WRT54GS
  DEVICE_VARIANT := v4
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/linksys)
  DEVICE_ID := W54s
  VERSION := 1.09.1
endef

define Device/linksys_wrtsl54gs
  DEVICE_MODEL := WRTSL54GS
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/linksys)
  FILESYSTEMS := $(FS_128K)
  DEVICE_ID := W54U
  VERSION := 2.08.1
endef

define Device/linksys_wrt150n
  DEVICE_MODEL := WRT150N
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/linksys)
  DEVICE_ID := N150
  VERSION := 1.51.3
endef

define Device/linksys_wrt160n-v1
  DEVICE_MODEL := WRT160N
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/linksys)
  DEVICE_ID := N150
  VERSION := 1.50.1
endef

define Device/linksys_wrt300n-v1
  DEVICE_MODEL := WRT300N
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/linksys)
  IMAGES := bin trx
  DEVICE_ID := EWCB
  VERSION := 1.03.6
endef

define Device/motorola_wa840g
  DEVICE_MODEL := WA840G
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/motorola)
  MOTOROLA_DEVICE := 2
endef

define Device/motorola_we800g
  DEVICE_MODEL := WE800G
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/motorola)
  MOTOROLA_DEVICE := 3
endef

define Device/motorola_wr850g
  DEVICE_MODEL := WR850G
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/motorola)
  MOTOROLA_DEVICE := 1
endef

define Device/netgear_wgr614-v8
  DEVICE_MODEL := WGR614
  DEVICE_VARIANT := v8
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/netgear)
  NETGEAR_BOARD_ID := U12H072T00_NETGEAR
  NETGEAR_REGION := 2
endef

define Device/netgear_wgt634u
  DEVICE_VENDOR := NETGEAR
  DEVICE_MODEL := WGT634U
  DEVICE_PACKAGES := kmod-ath5k $(USB2_PACKAGES)
  FILESYSTEMS := $(FS_128K)
  IMAGES := bin
  IMAGE/bin := append-rootfs | trx-with-loader | prepend-with-elf
endef

define Device/netgear_wndr3300-v1
  DEVICE_MODEL := WNDR3300
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/netgear)
  NETGEAR_BOARD_ID := U12H093T00_NETGEAR
  NETGEAR_REGION := 2
endef

define Device/netgear_wnr834b-v2
  DEVICE_MODEL := WNR834B
  DEVICE_VARIANT := v2
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/netgear)
  NETGEAR_BOARD_ID := U12H081T00_NETGEAR
  NETGEAR_REGION := 2
endef

define Device/standard-legacy
  DEVICE_VENDOR := Generic
  DEVICE_MODEL := Image with LZMA loader and LZMA compressed kernel
endef

define Device/standard-legacy-noloader-gz
  DEVICE_VENDOR := Generic
  DEVICE_MODEL := Image with gzipped kernel
  KERNEL_NAME = vmlinux.gz
  IMAGE/trx := append-rootfs | trx-without-loader
endef

define Device/usrobotics_usr5461
  DEVICE_VENDOR := US Robotics
  DEVICE_MODEL := USR5461
  DEVICE_PACKAGES := kmod-b43 $(USB1_PACKAGES)
  IMAGES := bin
  IMAGE/bin := append-rootfs | trx-with-loader | usrobotics-bin
endef
