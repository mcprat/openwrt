#################################################
# Subtarget mips74k
#################################################

define Device/asus_rt-ac53u
  DEVICE_MODEL := RT-AC53U
  DEVICE_PACKAGES := $(USB2_PACKAGES)
  $(DeviceCommon/asus)
  PRODUCTID := RT-AC53U
endef

define Device/asus_rt-ac66u
  DEVICE_MODEL := RT-AC66U
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/asus)
  PRODUCTID := RT-AC66U
  DEFAULT := n
endef

define Device/asus_rt-n10
  DEVICE_MODEL := RT-N10
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/asus)
  PRODUCTID := "RT-N10      "
endef

define Device/asus_rt-n10p
  DEVICE_MODEL := RT-N10P
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/asus)
  PRODUCTID := RT-N10P
endef

define Device/asus_rt-n10p-v2
  DEVICE_MODEL := RT-N10P
  DEVICE_VARIANT := v2
  $(DeviceCommon/asus)
  PRODUCTID := RT-N10PV2
endef

define Device/asus_rt-n10u
  DEVICE_MODEL := RT-N10U
  DEVICE_VARIANT := A
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/asus)
  PRODUCTID := RT-N10U
endef

define Device/asus_rt-n10u-b
  DEVICE_MODEL := RT-N10U
  DEVICE_VARIANT := B
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/asus)
  PRODUCTID := RT-N10U
endef

define Device/asus_rt-n12
  DEVICE_MODEL := RT-N12
  DEVICE_VARIANT := A1
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/asus)
  PRODUCTID := "RT-N12      "
endef

define Device/asus_rt-n12-b1
  DEVICE_MODEL := RT-N12
  DEVICE_VARIANT := B1
  $(DeviceCommon/asus)
  PRODUCTID := RT-N12B1
endef

define Device/asus_rt-n12-c1
  DEVICE_MODEL := RT-N12
  DEVICE_VARIANT := C1
  $(DeviceCommon/asus)
  PRODUCTID := RT-N12C1
endef

define Device/asus_rt-n12-d1
  DEVICE_MODEL := RT-N12
  DEVICE_VARIANT := D1
  $(DeviceCommon/asus)
  PRODUCTID := RT-N12D1
endef

define Device/asus_rt-n12hp
  DEVICE_MODEL := RT-N12HP
  $(DeviceCommon/asus)
  PRODUCTID := RT-N12HP
endef

define Device/asus_rt-n14uhp
  DEVICE_MODEL := RT-N14UHP
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/asus)
  PRODUCTID := RT-N14UHP
endef

define Device/asus_rt-n15u
  DEVICE_MODEL := RT-N15U
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/asus)
  PRODUCTID := RT-N15U
endef

define Device/asus_rt-n16
  DEVICE_MODEL := RT-N16
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/asus)
  PRODUCTID := RT-N16
endef

define Device/asus_rt-n53
  DEVICE_MODEL := RT-N53
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/asus)
  PRODUCTID := RT-N53
endef

define Device/asus_rt-n66u
  DEVICE_MODEL := RT-N66U
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/asus)
  PRODUCTID := RT-N66U
endef

define Device/asus_rt-n66w
  DEVICE_MODEL := RT-N66W
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/asus)
  PRODUCTID := RT-N66U
endef

define Device/linksys_wrt160n-v3
  DEVICE_MODEL := WRT160N
  DEVICE_VARIANT := v3
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/linksys)
  DEVICE_ID := N150
  VERSION := 3.0.3
  DEFAULT := n
endef

define Device/linksys_wrt310n-v2
  DEVICE_MODEL := WRT310N
  DEVICE_VARIANT := v2
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/linksys)
  DEVICE_ID := 310N
  VERSION := 2.0.1
endef

define Device/linksys_wrt320n-v1
  DEVICE_MODEL := WRT320N
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/linksys)
  DEVICE_ID := 320N
  VERSION := 1.0.5
endef

define Device/linksys_e900-v1
  DEVICE_MODEL := E900
  DEVICE_VARIANT := v1
  $(DeviceCommon/linksys)
  DEVICE_ID := E900
  VERSION := 1.0.4
endef

define Device/linksys_e1000
  DEVICE_MODEL := E1000
  DEVICE_VARIANT := v1/v2/v2.1
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/linksys)
  DEVICE_ID := E100
  VERSION := 1.1.3
endef

define Device/linksys_e1200-v1
  DEVICE_MODEL := E1200
  DEVICE_VARIANT := v1
  $(DeviceCommon/linksys)
  DEVICE_ID := E120
  VERSION := 1.0.3
endef

define Device/linksys_e1200-v2
  DEVICE_MODEL := E1200
  DEVICE_VARIANT := v2
  $(DeviceCommon/linksys)
  DEVICE_ID := E122
  VERSION := 1.0.4
endef

define Device/linksys_e1500-v1
  DEVICE_MODEL := E1500
  DEVICE_VARIANT := v1
  $(DeviceCommon/linksys)
  DEVICE_ID := E150
  VERSION := 1.0.5
endef

define Device/linksys_e1550-v1
  DEVICE_MODEL := E1550
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/linksys)
  DEVICE_ID := 1550
  VERSION := 1.0.3
endef

define Device/linksys_e2000-v1
  DEVICE_MODEL := E2000
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/linksys)
  DEVICE_ID := 32XN
  VERSION := 1.0.4
endef

define Device/linksys_e2500-v1
  DEVICE_MODEL := E2500
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/linksys)
  DEVICE_ID := E25X
  VERSION := 1.0.7
endef

define Device/linksys_e2500-v2
  DEVICE_MODEL := E2500
  DEVICE_VARIANT := v2
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/linksys)
  DEVICE_ID := E25X
  VERSION := 2.0.0
endef

define Device/linksys_e2500-v2.1
  DEVICE_MODEL := E2500
  DEVICE_VARIANT := v2.1
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/linksys)
  DEVICE_ID := 25RU
  VERSION := 2.1.0
endef

define Device/linksys_e2500-v3
  DEVICE_MODEL := E2500
  DEVICE_VARIANT := v3
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/linksys)
  DEVICE_ID := 25V3
  VERSION := 3.0.0
endef

define Device/linksys_e3200-v1
  DEVICE_MODEL := E3200
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/linksys)
  DEVICE_ID := 3200
  VERSION := 1.0.1
endef

define Device/linksys_e4200-v1
  DEVICE_MODEL := E4200
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/linksys)
  DEVICE_ID := 4200
  VERSION := 1.0.5
endef

define Device/netgear_r6200-v1
  DEVICE_MODEL := R6200
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/netgear)
  NETGEAR_BOARD_ID := U12H192T00_NETGEAR
  NETGEAR_REGION := 1
endef

define Device/netgear_wgr614-v10-na
  DEVICE_MODEL := WGR614
  DEVICE_VARIANT := v10 (NA)
  $(DeviceCommon/netgear)
  NETGEAR_BOARD_ID := U12H139T01_NETGEAR
  NETGEAR_REGION := 2
endef

define Device/netgear_wgr614-v10
  DEVICE_MODEL := WGR614
  DEVICE_VARIANT := v10
  $(DeviceCommon/netgear)
  NETGEAR_BOARD_ID := U12H139T01_NETGEAR
  NETGEAR_REGION := 1
endef

define Device/netgear_wn2500rp-v1
  DEVICE_MODEL := WN2500RP
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/netgear)
  NETGEAR_BOARD_ID := U12H197T00_NETGEAR
  NETGEAR_REGION := 1
endef

define Device/netgear_wn3000rp
  DEVICE_MODEL := WN3000RP
  $(DeviceCommon/netgear)
  NETGEAR_BOARD_ID := U12H163T01_NETGEAR
  NETGEAR_REGION := 1
endef

define Device/netgear_wndr3400-v1
  DEVICE_MODEL := WNDR3400
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/netgear)
  NETGEAR_BOARD_ID := U12H155T00_NETGEAR
  NETGEAR_REGION := 2
endef

define Device/netgear_wndr3400-v2
  DEVICE_MODEL := WNDR3400
  DEVICE_VARIANT := v2
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/netgear)
  NETGEAR_BOARD_ID := U12H187T00_NETGEAR
  NETGEAR_REGION := 2
endef

define Device/netgear_wndr3400-v3
  DEVICE_MODEL := WNDR3400
  DEVICE_VARIANT := v3
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/netgear)
  NETGEAR_BOARD_ID := U12H208T00_NETGEAR
  NETGEAR_REGION := 1
endef

define Device/netgear_wndr3700-v3
  DEVICE_MODEL := WNDR3700
  DEVICE_VARIANT := v3
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/netgear)
  NETGEAR_BOARD_ID := U12H194T00_NETGEAR
  NETGEAR_REGION := 2
endef

define Device/netgear_wndr3400-vcna
  DEVICE_MODEL := WNDR3400
  DEVICE_VARIANT := vcna
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/netgear)
  NETGEAR_BOARD_ID := U12H155T01_NETGEAR
  NETGEAR_REGION := 2
  DEFAULT := n
endef

define Device/netgear_wndr4000
  DEVICE_MODEL := WNDR4000
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/netgear)
  NETGEAR_BOARD_ID := U12H181T00_NETGEAR
  NETGEAR_REGION := 2
endef

define Device/netgear_wnr1000-v3
  DEVICE_MODEL := WNR1000
  DEVICE_VARIANT := v3
  $(DeviceCommon/netgear)
  NETGEAR_BOARD_ID := U12H139T00_NETGEAR
  NETGEAR_REGION := 2
endef

define Device/netgear_wnr2000v2
  DEVICE_MODEL := WNR2000
  DEVICE_VARIANT := v2
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/netgear)
  NETGEAR_BOARD_ID := U12H114T00_NETGEAR
  NETGEAR_REGION := 2
endef

define Device/netgear_wnr3500l-v1-na
  DEVICE_MODEL := WNR3500L
  DEVICE_VARIANT := v1 (NA)
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/netgear)
  NETGEAR_BOARD_ID := U12H136T99_NETGEAR
  NETGEAR_REGION := 2
endef

define Device/netgear_wnr3500l-v1
  DEVICE_MODEL := WNR3500L
  DEVICE_VARIANT := v1 (ROW)
  DEVICE_PACKAGES := kmod-b43 $(USB2_PACKAGES)
  $(DeviceCommon/netgear)
  NETGEAR_BOARD_ID := U12H136T99_NETGEAR
  NETGEAR_REGION := 1
endef

define Device/netgear_wnr3500l-v2
  DEVICE_MODEL := WNR3500L
  DEVICE_VARIANT := v2
  DEVICE_PACKAGES := $(USB2_PACKAGES)
  $(DeviceCommon/netgear)
  NETGEAR_BOARD_ID := U12H172T00_NETGEAR
  NETGEAR_REGION := 1
  KERNEL_NAME = vmlinux-nodictionary.lzma
  IMAGE/chk := append-rootfs | trx-without-loader | netgear-chk
endef

define Device/netgear_wnr3500u
  DEVICE_MODEL := WNR3500U
  DEVICE_PACKAGES := $(USB2_PACKAGES)
  $(DeviceCommon/netgear)
  NETGEAR_BOARD_ID := U12H136T00_NETGEAR
  NETGEAR_REGION := 2
  DEFAULT := n
endef

define Device/netgear_wnr3500-v2
  DEVICE_MODEL := WNR3500
  DEVICE_VARIANT := v2
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/netgear)
  NETGEAR_BOARD_ID := U12H127T00_NETGEAR
  NETGEAR_REGION := 2
endef

define Device/netgear_wnr3500-v2-vc
  DEVICE_MODEL := WNR3500
  DEVICE_VARIANT := v2 (VC)
  DEVICE_PACKAGES := kmod-b43
  $(DeviceCommon/netgear)
  NETGEAR_BOARD_ID := U12H127T70_NETGEAR
  NETGEAR_REGION := 2
  DEFAULT := n
endef

define Device/standard-mips74k
  DEVICE_VENDOR := Generic
  DEVICE_MODEL := Image with LZMA loader and LZMA compressed kernel
endef

define Device/standard-mips74k-noloader-nodictionarylzma
  DEVICE_VENDOR := Generic
  DEVICE_MODEL := Image with LZMA compressed kernel matching CFE decompressor
  KERNEL_NAME = vmlinux-nodictionary.lzma
  IMAGE/trx := append-rootfs | trx-without-loader
endef
