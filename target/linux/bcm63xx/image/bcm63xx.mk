
#
# BCM33XX/BCM63XX Profiles
#

DEVICE_VARS += HCS_MAGIC_BYTES HCS_REV_MIN HCS_REV_MAJ
DEVICE_VARS += BLOCK_SIZE FLASH_MB IMAGE_OFFSET
DEVICE_VARS += CFE_BOARD_ID CFE_EXTRAS
DEVICE_VARS += NETGEAR_BOARD_ID NETGEAR_REGION
DEVICE_VARS += REDBOOT_PREFIX

define DeviceCommon/bcm33xx
  KERNEL_INITRAMFS := kernel-bin | append-dtb | lzma | loader-lzma bin | hcs-initramfs
  IMAGES :=
  HCS_MAGIC_BYTES :=
  HCS_REV_MIN :=
  HCS_REV_MAJ :=
endef

define DeviceCommon/bcm63xx
  FILESYSTEMS := squashfs jffs2-64k jffs2-128k
  KERNEL := kernel-bin | append-dtb | relocate-kernel | lzma
  KERNEL_INITRAMFS := kernel-bin | append-dtb | lzma | loader-lzma elf
  IMAGES := cfe.bin
  IMAGE/cfe.bin := cfe-bin --pad $$$$(shell expr $$$$(FLASH_MB) / 2)
  IMAGE/cfe-4M.bin := cfe-bin --pad 2
  IMAGE/cfe-8M.bin := cfe-bin --pad 4
  IMAGE/cfe-16M.bin := cfe-bin --pad 8
  IMAGE/cfe-bc221.bin := cfe-bin --layoutver 5
  IMAGE/cfe-old.bin := cfe-old-bin
  IMAGE/sysupgrade.bin := cfe-bin
  BLOCK_SIZE := 0x10000
  IMAGE_OFFSET :=
  FLASH_MB := 4
  CFE_BOARD_ID :=
  CFE_EXTRAS = --block-size $$(BLOCK_SIZE) --image-offset $$(if $$(IMAGE_OFFSET),$$(IMAGE_OFFSET),$$(BLOCK_SIZE))
endef

define DeviceCommon/bcm63xx-legacy
  $(DeviceCommon/bcm63xx)
  KERNEL := kernel-bin | append-dtb | relocate-kernel | lzma-cfe
endef

define DeviceCommon/bcm63xx_netgear
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := NETGEAR
  IMAGES := factory.chk sysupgrade.bin
  IMAGE/factory.chk := cfe-bin | netgear-chk
  NETGEAR_BOARD_ID :=
  NETGEAR_REGION :=
endef

define DeviceCommon/bcm63xx_redboot
  FILESYSTEMS := squashfs
  KERNEL := kernel-bin | append-dtb | relocate-kernel | gzip
  KERNEL_INITRAMFS := kernel-bin | append-dtb | lzma | loader-lzma elf
  IMAGES := redboot.bin
  IMAGE/redboot.bin := redboot-bin
  REDBOOT_PREFIX := $$(DEVICE_IMG_PREFIX)
endef

### Generic ###
define Device/brcm_bcm963281tan
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Generic
  DEVICE_MODEL := 963281TAN
  IMAGES := cfe-4M.bin cfe-8M.bin cfe-16M.bin
  CFE_BOARD_ID := 963281TAN
  CHIP_ID := 6328
endef

define Device/brcm_bcm96328avng
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Generic
  DEVICE_MODEL := 96328avng
  IMAGES := cfe-4M.bin cfe-8M.bin cfe-16M.bin
  CFE_BOARD_ID := 96328avng
  CHIP_ID := 6328
endef

define Device/brcm_bcm96338gw
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Generic
  DEVICE_MODEL := 96338GW
  CFE_BOARD_ID := 6338GW
  CHIP_ID := 6338
endef

define Device/brcm_bcm96338w
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Generic
  DEVICE_MODEL := 96338W
  CFE_BOARD_ID := 6338W
  CHIP_ID := 6338
  DEFAULT := n
endef

define Device/brcm_bcm96345gw2
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Generic
  DEVICE_MODEL := 96345GW2
  IMAGES += cfe-bc221.bin
  CFE_BOARD_ID := 96345GW2
  CHIP_ID := 6345
  DEFAULT := n
endef

define Device/brcm_bcm96348gw
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Generic
  DEVICE_MODEL := 96348GW
  IMAGES += cfe-bc221.bin
  CFE_BOARD_ID := 96348GW
  CHIP_ID := 6348
  DEFAULT := n
endef

define Device/brcm_bcm96348gw-10
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Generic
  DEVICE_MODEL := 96348GW-10
  CFE_BOARD_ID := 96348GW-10
  CHIP_ID := 6348
  DEFAULT := n
endef

define Device/brcm_bcm96348gw-11
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Generic
  DEVICE_MODEL := 96348GW-11
  CFE_BOARD_ID := 96348GW-11
  CHIP_ID := 6348
  DEFAULT := n
endef

define Device/brcm_bcm96348r
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Generic
  DEVICE_MODEL := 96348R
  CFE_BOARD_ID := 96348R
  CHIP_ID := 6348
  DEFAULT := n
endef

define Device/brcm_bcm96358vw
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Generic
  DEVICE_MODEL := 96358VW
  CFE_BOARD_ID := 96358VW
  CHIP_ID := 6358
endef

define Device/brcm_bcm96358vw2
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Generic
  DEVICE_MODEL := 96358VW2
  CFE_BOARD_ID := 96358VW2
  CHIP_ID := 6358
endef

define Device/brcm_bcm96368mvngr
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Generic
  DEVICE_MODEL := 96368MVNgr
  CFE_BOARD_ID := 96368MVNgr
  CHIP_ID := 6368
endef

define Device/brcm_bcm96368mvwg
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Generic
  DEVICE_MODEL := 96368MVWG
  CFE_BOARD_ID := 96368MVWG
  CHIP_ID := 6368
endef

### Actiontec ###
define Device/actiontec_r1000h
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Actiontec
  DEVICE_MODEL := R1000H
  FILESYSTEMS := squashfs
  CFE_BOARD_ID := 96368MVWG
  CHIP_ID := 6368
  FLASH_MB := 32
  IMAGE_OFFSET := 0x20000
  DEVICE_PACKAGES := $(USB2_PACKAGES) $(BRCMWL_PACKAGES)
endef

### ADB ###
define Device/adb_a4001n
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := ADB
  DEVICE_MODEL := P.DG A4001N
  CFE_BOARD_ID := 96328dg2x2
  CHIP_ID := 6328
  FLASH_MB := 8
  DEVICE_PACKAGES := $(USB2_PACKAGES) $(B43_PACKAGES)
endef

define Device/adb_a4001n1
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := ADB
  DEVICE_MODEL := P.DG A4001N1
  IMAGES += sysupgrade.bin
  CFE_BOARD_ID := 963281T_TEF
  CHIP_ID := 6328
  FLASH_MB := 16
  DEVICE_PACKAGES := $(USB2_PACKAGES) $(B43_PACKAGES)
endef

define Device/adb_pdg-a4001n-a-000-1a1-ax
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := ADB
  DEVICE_MODEL := P.DG A4001N A-000-1A1-AX
  IMAGES += sysupgrade.bin
  CFE_BOARD_ID := 96328avng
  CHIP_ID := 6328
  FLASH_MB := 16
  DEVICE_PACKAGES := $(USB2_PACKAGES) $(B43_PACKAGES)
endef

define Device/adb_pdg-a4101n-a-000-1a1-ae
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := ADB
  DEVICE_MODEL := P.DG A4101N A-000-1A1-AE
  IMAGES += sysupgrade.bin
  CFE_BOARD_ID := 96328avngv
  CHIP_ID := 6328
  FLASH_MB := 16
  DEVICE_PACKAGES := $(USB2_PACKAGES) $(B43_PACKAGES)
endef

define Device/adb_av4202n
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := ADB
  DEVICE_MODEL := P.DG AV4202N
  IMAGE_OFFSET := 0x20000
  CFE_BOARD_ID := 96368_Swiss_S1
  CHIP_ID := 6368
  DEVICE_PACKAGES := $(USB2_PACKAGES) $(B43_PACKAGES)
endef

### Alcatel ###
define Device/alcatel_rg100a
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Alcatel
  DEVICE_MODEL := RG100A
  CFE_BOARD_ID := 96358VW2
  CHIP_ID := 6358
  BLOCK_SIZE := 0x20000
  DEVICE_PACKAGES := $(USB2_PACKAGES) $(B43_PACKAGES)
endef

### Asmax ###
define Device/asmax_ar-1004g
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Asmax
  DEVICE_MODEL := AR 1004g
  CFE_BOARD_ID := 96348GW-10
  CHIP_ID := 6348
  DEVICE_PACKAGES := $(B43_PACKAGES)
  DEFAULT := n
endef

### Belkin ###
define Device/belkin_f5d7633
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Belkin
  DEVICE_MODEL := F5D7633
  CFE_BOARD_ID := 96348GW-10
  CHIP_ID := 6348
  BLOCK_SIZE := 0x20000
  DEVICE_PACKAGES := $(B43_PACKAGES)
  DEFAULT := n
endef

### Broadcom ###
define Device/brcm_bcm96318ref
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Broadcom
  DEVICE_MODEL := BCM96318REF reference board
  IMAGES :=
  CFE_BOARD_ID := 96318REF
  CHIP_ID := 6318
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES) kmod-bcm63xx-udc
endef

define Device/brcm_bcm96318ref-p300
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Broadcom
  DEVICE_MODEL := BCM96318REF_P300 reference board
  IMAGES :=
  CFE_BOARD_ID := 96318REF_P300
  CHIP_ID := 6318
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES) kmod-bcm63xx-udc
endef

define Device/brcm_bcm963268bu-p300
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Broadcom
  DEVICE_MODEL := BCM963268BU_P300 reference board
  IMAGES :=
  CFE_BOARD_ID := 963268BU_P300
  CHIP_ID := 63268
  DEVICE_PACKAGES := $(USB2_PACKAGES) kmod-bcm63xx-udc
endef

define Device/brcm_bcm963269bhr
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Broadcom
  DEVICE_MODEL := BCM963269BHR reference board
  IMAGES :=
  CFE_BOARD_ID := 963269BHR
  CHIP_ID := 63268
  SOC := bcm63269
  DEVICE_PACKAGES := $(USB2_PACKAGES) kmod-bcm63xx-udc
endef

### BT ###
define Device/bt_home-hub-2-a
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := British Telecom (BT)
  DEVICE_MODEL := Home Hub 2.0
  DEVICE_VARIANT := A
  CFE_BOARD_ID := HOMEHUB2A
  CHIP_ID := 6358
  BLOCK_SIZE := 0x20000
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

define Device/bt_voyager-2110
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := British Telecom (BT)
  DEVICE_MODEL := Voyager 2110
  CFE_BOARD_ID := V2110
  CHIP_ID := 6348
  CFE_EXTRAS += --layoutver 5
  DEVICE_PACKAGES := $(B43_PACKAGES)
  DEFAULT := n
endef

define Device/bt_voyager-2500v-bb
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := British Telecom (BT)
  DEVICE_MODEL := Voyager 2500V
  CFE_BOARD_ID := V2500V_BB
  CHIP_ID := 6348
  CFE_EXTRAS += --layoutver 5
  DEVICE_PACKAGES := $(B43_PACKAGES)
  DEFAULT := n
endef

### Comtrend ###
define Device/comtrend_ar-5315u
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Comtrend
  DEVICE_MODEL := AR-5315u
  IMAGES += sysupgrade.bin
  CFE_BOARD_ID := 96318A-1441N1
  CHIP_ID := 6318
  FLASH_MB := 16
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

define Device/comtrend_ar-5381u
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Comtrend
  DEVICE_MODEL := AR-5381u
  IMAGES += sysupgrade.bin
  CFE_BOARD_ID := 96328A-1241N
  CHIP_ID := 6328
  FLASH_MB := 16
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

define Device/comtrend_ar-5387un
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Comtrend
  DEVICE_MODEL := AR-5387un
  IMAGES += sysupgrade.bin
  CFE_BOARD_ID := 96328A-1441N1
  CHIP_ID := 6328
  FLASH_MB := 16
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

define Device/comtrend_ct-536plus
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Comtrend
  DEVICE_MODEL := CT-536+
  DEVICE_ALT0_VENDOR := Comtrend
  DEVICE_ALT0_MODEL := CT-5621
  CFE_BOARD_ID := 96348GW-11
  CHIP_ID := 6348
  DEVICE_PACKAGES := $(B43_PACKAGES)
  DEFAULT := n
endef

define Device/comtrend_ct-5365
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Comtrend
  DEVICE_MODEL := CT-5365
  CFE_BOARD_ID := 96348A-122
  CHIP_ID := 6348
  DEVICE_PACKAGES := $(B43_PACKAGES)
  DEFAULT := n
endef

define Device/comtrend_ct-6373
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Comtrend
  DEVICE_MODEL := CT-6373
  CFE_BOARD_ID := CT6373-1
  CHIP_ID := 6358
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

define Device/comtrend_vr-3025u
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Comtrend
  DEVICE_MODEL := VR-3025u
  IMAGES += sysupgrade.bin
  CFE_BOARD_ID := 96368M-1541N
  CHIP_ID := 6368
  BLOCK_SIZE := 0x20000
  FLASH_MB := 32
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

define Device/comtrend_vr-3025un
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Comtrend
  DEVICE_MODEL := VR-3025un
  CFE_BOARD_ID := 96368M-1341N
  CHIP_ID := 6368
  FLASH_MB := 8
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

define Device/comtrend_vr-3026e
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Comtrend
  DEVICE_MODEL := VR-3026e
  CFE_BOARD_ID := 96368MT-1341N1
  CHIP_ID := 6368
  FLASH_MB := 8
  DEVICE_PACKAGES := $(B43_PACKAGES)
endef

define Device/comtrend_wap-5813n
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Comtrend
  DEVICE_MODEL := WAP-5813n
  CFE_BOARD_ID := 96369R-1231N
  CHIP_ID := 6368
  FLASH_MB := 8
  SOC := bcm6369
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

### D-Link ###
define Device/d-link_dsl-2640b-b
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DSL-2640B
  DEVICE_VARIANT := B2
  CFE_BOARD_ID := D-4P-W
  CHIP_ID := 6348
  DEVICE_PACKAGES := $(B43_PACKAGES)
  DEFAULT := n
endef

define Device/d-link_dsl-2640u
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DSL-2640U
  DEVICE_VARIANT := C1
  DEVICE_ALT0_VENDOR := D-Link
  DEVICE_ALT0_MODEL := DSL-2640U/BRU/C
  CFE_BOARD_ID := 96338W2_E7T
  CHIP_ID := 6338
  DEVICE_PACKAGES := $(B43_PACKAGES)
  DEFAULT := n
endef

define Device/d-link_dsl-2650u
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DSL-2650U
  CFE_BOARD_ID := 96358VW2
  CHIP_ID := 6358
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

define Device/d-link_dsl-274xb-c2
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DSL-2740B
  DEVICE_VARIANT := C2
  DEVICE_ALT0_VENDOR := D-Link
  DEVICE_ALT0_MODEL := DSL-2741B
  DEVICE_ALT0_VARIANT := C2
  CFE_BOARD_ID := 96358GW
  CHIP_ID := 6358
  DEVICE_PACKAGES := $(B43_PACKAGES)
  DEFAULT := n
endef

define Device/d-link_dsl-274xb-c3
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DSL-2740B
  DEVICE_VARIANT := C3
  DEVICE_ALT0_VENDOR := D-Link
  DEVICE_ALT0_MODEL := DSL-2741B
  DEVICE_ALT0_VARIANT := C3
  DEVICE_DTS := bcm6358-d-link-dsl-274xb-c2
  CFE_BOARD_ID := AW4139
  CHIP_ID := 6358
  DEVICE_PACKAGES := $(B43_PACKAGES)
  DEFAULT := n
endef

define Device/d-link_dsl-274xb-f1
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DSL-2740B
  DEVICE_VARIANT := F1
  DEVICE_ALT0_VENDOR := D-Link
  DEVICE_ALT0_MODEL := DSL-2741B
  DEVICE_ALT0_VARIANT := F1
  CFE_BOARD_ID := AW4339U
  CHIP_ID := 6328
  IMAGES := cfe-EU.bin cfe-AU.bin
  IMAGE/cfe-AU.bin := cfe-bin --signature2 "4.06.01.AUF1" --pad 4
  IMAGE/cfe-EU.bin := cfe-bin --signature2 "4.06.01.EUF1" --pad 4
  DEVICE_PACKAGES := $(ATH9K_PACKAGES)
endef

define Device/d-link_dsl-2750u-c1
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DSL-2750U
  DEVICE_VARIANT := C1
  IMAGES += sysupgrade.bin
  CFE_BOARD_ID := 963281TAVNG
  CHIP_ID := 6328
  FLASH_MB := 8
  DEVICE_PACKAGES := $(USB2_PACKAGES) $(B43_PACKAGES)
endef

define Device/d-link_dsl-275xb-d1
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DSL-2750B
  DEVICE_VARIANT := D1
  DEVICE_ALT0_VENDOR := D-Link
  DEVICE_ALT0_MODEL := DSL-2751
  DEVICE_ALT0_VARIANT := D1
  CFE_BOARD_ID := AW5200B
  CHIP_ID := 6318
  FLASH_MB := 8
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

define Device/d-link_dva-g3810bn-tl
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DVA-G3810BN/TL
  CFE_BOARD_ID := 96358VW
  CHIP_ID := 6358
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

### Davolink ###
define Device/davolink_dv-201amr
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Davolink
  DEVICE_MODEL := DV-201AMR
  IMAGES := cfe-old.bin
  CFE_BOARD_ID := DV201AMR
  CHIP_ID := 6348
  DEVICE_PACKAGES := $(B43_PACKAGES)
  DEFAULT := n
endef

### Dynalink ###
define Device/dynalink_rta770bw
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Dynalink
  DEVICE_MODEL := RTA770BW
  DEVICE_ALT0_VENDOR := Siemens
  DEVICE_ALT0_MODEL := SE515
  IMAGES =
  CFE_BOARD_ID := RTA770BW
  CHIP_ID := 6345
  CFE_EXTRAS += --layoutver 5
  DEVICE_PACKAGES := $(B43_PACKAGES)
  DEFAULT := n
endef

define Device/dynalink_rta770w
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Dynalink
  DEVICE_MODEL := RTA770W
  IMAGES =
  CFE_BOARD_ID := RTA770W
  CHIP_ID := 6345
  CFE_EXTRAS += --layoutver 5
  DEVICE_PACKAGES := $(B43_PACKAGES)
  DEFAULT := n
endef

define Device/dynalink_rta1025w
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Dynalink
  DEVICE_MODEL := RTA1025W
  CFE_BOARD_ID := RTA1025W_16
  CHIP_ID := 6348
  CFE_EXTRAS += --layoutver 5
  DEVICE_PACKAGES := $(B43_PACKAGES)
  DEFAULT := n
endef

define Device/dynalink_rta1320
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Dynalink
  DEVICE_MODEL := RTA1320
  CFE_BOARD_ID := RTA1320_16M
  CHIP_ID := 6338
  CFE_EXTRAS += --layoutver 5
  DEFAULT := n
endef

### Huawei ###
define Device/huawei_echolife-hg520v
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Huawei
  DEVICE_MODEL := EchoLife HG520v
  CFE_BOARD_ID := HW6358GW_B
  CHIP_ID := 6358
  CFE_EXTRAS += --rsa-signature "EchoLife_HG520v"
  SOC := bcm6359
  DEVICE_PACKAGES := $(B43_PACKAGES)
  DEFAULT := n
endef

define Device/huawei_echolife-hg553
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Huawei
  DEVICE_MODEL := EchoLife HG553
  CFE_BOARD_ID := HW553
  CHIP_ID := 6358
  CFE_EXTRAS += --rsa-signature "EchoLife_HG553" --tag-version 7
  BLOCK_SIZE := 0x20000
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

define Device/huawei_echolife-hg556a-a
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Huawei
  DEVICE_MODEL := EchoLife HG556a
  DEVICE_VARIANT := A
  DEVICE_DESCRIPTION = Build firmware images for Huawei HG556a version A (Atheros)
  CFE_BOARD_ID := HW556
  CHIP_ID := 6358
  CFE_EXTRAS += --rsa-signature "EchoLife_HG556a" --tag-version 8
  IMAGE_OFFSET := 0x20000
  DEVICE_PACKAGES := $(ATH9K_PACKAGES) $(USB2_PACKAGES)
endef

define Device/huawei_echolife-hg556a-b
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Huawei
  DEVICE_MODEL := EchoLife HG556a
  DEVICE_VARIANT := B
  DEVICE_DESCRIPTION = Build firmware images for Huawei HG556a version B (Atheros)
  CFE_BOARD_ID := HW556
  CHIP_ID := 6358
  CFE_EXTRAS += --rsa-signature "EchoLife_HG556a" --tag-version 8
  BLOCK_SIZE := 0x20000
  DEVICE_PACKAGES := $(ATH9K_PACKAGES) $(USB2_PACKAGES)
endef

define Device/huawei_echolife-hg556a-c
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Huawei
  DEVICE_MODEL := EchoLife HG556a
  DEVICE_VARIANT := C
  DEVICE_DESCRIPTION = Build firmware images for Huawei HG556a version C (Ralink)
  CFE_BOARD_ID := HW556
  CHIP_ID := 6358
  CFE_EXTRAS += --rsa-signature "EchoLife_HG556a" --tag-version 8
  BLOCK_SIZE := 0x20000
  DEVICE_PACKAGES := $(RT28_PACKAGES) $(USB2_PACKAGES)
endef

define Device/huawei_echolife-hg622
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Huawei
  DEVICE_MODEL := EchoLife HG622
  IMAGES += sysupgrade.bin
  CFE_BOARD_ID := 96368MVWG_hg622
  CHIP_ID := 6368
  CFE_EXTRAS += --tag-version 7
  BLOCK_SIZE := 0x20000
  FLASH_MB := 16
  DEVICE_PACKAGES := $(RT28_PACKAGES) $(USB2_PACKAGES)
endef

define Device/huawei_echolife-hg655b
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Huawei
  DEVICE_MODEL := EchoLife HG655b
  CFE_BOARD_ID := HW65x
  CHIP_ID := 6368
  CFE_EXTRAS += --tag-version 7
  IMAGE_OFFSET := 0x20000
  FLASH_MB := 8
  DEVICE_PACKAGES := $(RT28_PACKAGES) $(USB2_PACKAGES)
endef

### Innacomm ###
define Device/innacomm_w3400v6
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Innacomm
  DEVICE_MODEL := W3400V6
  CFE_BOARD_ID := 96328ang
  CHIP_ID := 6328
  FLASH_MB := 8
  DEVICE_PACKAGES := $(B43_PACKAGES)
endef

### Inteno ###
define Device/inteno_vg50
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Inteno
  DEVICE_MODEL := VG50 Multi-WAN CPE
  IMAGES :=
  CFE_BOARD_ID := VW6339GU
  CHIP_ID := 63268
  DEVICE_PACKAGES := $(USB2_PACKAGES)
endef

### Inventel ###
define Device/inventel_livebox-1
  $(DeviceCommon/bcm63xx_redboot)
  DEVICE_VENDOR := Inventel
  DEVICE_MODEL := Livebox 1
  SOC := bcm6348
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB1_PACKAGES)
  DEFAULT := n
endef

### Netgear ###
define Device/netgear_cvg834g
  $(DeviceCommon/bcm33xx)
  DEVICE_VENDOR := NETGEAR
  DEVICE_MODEL := CVG834G
  CHIP_ID := 3368
  HCS_MAGIC_BYTES := 0xa020
  HCS_REV_MIN := 0001
  HCS_REV_MAJ := 0022
endef

define Device/netgear_dg834gt-pn
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := NETGEAR
  DEVICE_MODEL := DG834GT
  DEVICE_ALT0_VENDOR := NETGEAR
  DEVICE_ALT0_MODEL := DG834PN
  CFE_BOARD_ID := 96348GW-10
  CHIP_ID := 6348
  DEVICE_PACKAGES := $(ATH5K_PACKAGES)
  DEFAULT := n
endef

define Device/netgear_dg834g-v4
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := NETGEAR
  DEVICE_MODEL := DG834G
  DEVICE_VARIANT := v4
  IMAGES :=
  CFE_BOARD_ID := 96348W3
  CHIP_ID := 6348
  DEVICE_PACKAGES := $(B43_PACKAGES)
  DEFAULT := n
endef

define Device/netgear_dgnd3700-v1
  $(DeviceCommon/bcm63xx_netgear)
  DEVICE_MODEL := DGND3700
  DEVICE_VARIANT := v1
  CFE_BOARD_ID := 96368MVWG
  CHIP_ID := 6368
  BLOCK_SIZE := 0x20000
  NETGEAR_BOARD_ID := U12L144T01_NETGEAR_NEWLED
  NETGEAR_REGION := 1
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

define Device/netgear_dgnd3800b
  $(DeviceCommon/bcm63xx_netgear)
  DEVICE_MODEL := DGND3800B
  DEVICE_DTS := bcm6368-netgear-dgnd3700-v1
  CFE_BOARD_ID := 96368MVWG
  CHIP_ID := 6368
  BLOCK_SIZE := 0x20000
  NETGEAR_BOARD_ID := U12L144T11_NETGEAR_NEWLED
  NETGEAR_REGION := 1
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

define Device/netgear_evg2000
  $(DeviceCommon/bcm63xx_netgear)
  DEVICE_MODEL := EVG2000
  CFE_BOARD_ID := 96369PVG
  CHIP_ID := 6368
  BLOCK_SIZE := 0x20000
  NETGEAR_BOARD_ID := U12H154T90_NETGEAR
  NETGEAR_REGION := 1
  SOC := bcm6369
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

### NuCom ###
define Device/nucom_r5010un-v2
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := NuCom
  DEVICE_MODEL := R5010UN
  DEVICE_VARIANT := v2
  IMAGES += sysupgrade.bin
  CFE_BOARD_ID := 96328ang
  CHIP_ID := 6328
  FLASH_MB := 16
  DEVICE_PACKAGES := $(B43_PACKAGES)
endef

### Observa ###
define Device/observa_vh4032n
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Observa
  DEVICE_MODEL := VH4032N
  IMAGES += sysupgrade.bin
  CFE_BOARD_ID := 96368VVW
  CHIP_ID := 6368
  BLOCK_SIZE := 0x20000
  FLASH_MB := 32
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

### Pirelli ###
define Device/pirelli_a226g
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Pirelli
  DEVICE_MODEL := A226G
  CFE_BOARD_ID := DWV-S0
  CHIP_ID := 6358
  CFE_EXTRAS += --signature2 IMAGE --tag-version 8
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

define Device/pirelli_a226m
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Pirelli
  DEVICE_MODEL := A226M
  CFE_BOARD_ID := DWV-S0
  CHIP_ID := 6358
  CFE_EXTRAS += --signature2 IMAGE --tag-version 8
  DEVICE_PACKAGES := $(USB2_PACKAGES)
endef

define Device/pirelli_a226m-fwb
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Pirelli
  DEVICE_MODEL := A226M-FWB
  CFE_BOARD_ID := DWV-S0
  CHIP_ID := 6358
  CFE_EXTRAS += --signature2 IMAGE --tag-version 8
  BLOCK_SIZE := 0x20000
  DEVICE_PACKAGES := $(USB2_PACKAGES)
endef

define Device/pirelli_agpf-s0
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Pirelli
  DEVICE_MODEL := Alice Gate VoIP 2 Plus Wi-Fi AGPF-S0
  CFE_BOARD_ID := AGPF-S0
  CHIP_ID := 6358
  CFE_EXTRAS += --signature2 IMAGE --tag-version 8
  BLOCK_SIZE := 0x20000
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

### Sagem ###
define Device/sagem_fast-2404
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Sagemcom
  DEVICE_MODEL := F@st 2404
  CFE_BOARD_ID := F@ST2404
  CHIP_ID := 6348
  DEVICE_PACKAGES := $(B43_PACKAGES)
  DEFAULT := n
endef

define Device/sagem_fast-2504n
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Sagemcom
  DEVICE_MODEL := F@st 2504N
  CFE_BOARD_ID := F@ST2504n
  CHIP_ID := 6362
  DEVICE_PACKAGES := $(B43_PACKAGES)
endef

define Device/sagem_fast-2604
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Sagemcom
  DEVICE_MODEL := F@st 2604
  CFE_BOARD_ID := F@ST2604
  CHIP_ID := 6348
  DEVICE_PACKAGES := $(B43_PACKAGES)
  DEFAULT := n
endef

define Device/sagem_fast-2704n
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Sagemcom
  DEVICE_MODEL := F@st 2704N
  CFE_BOARD_ID := F@ST2704N
  CHIP_ID := 6318
  FLASH_MB := 8
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

define Device/sagem_fast-2704-v2
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Sagemcom
  DEVICE_MODEL := F@st 2704
  DEVICE_VARIANT := V2
  CFE_BOARD_ID := F@ST2704V2
  CHIP_ID := 6328
  FLASH_MB := 8
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

### Sercomm ###
define Device/sercomm_ad1018-nor
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Sercomm
  DEVICE_MODEL := AD1018
  DEVICE_VARIANT := SPI flash mod
  CFE_BOARD_ID := 96328avngr
  CHIP_ID := 6328
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

### SFR ###
define Device/sfr_neufbox-4-sercomm-r0
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := SFR
  DEVICE_MODEL := Neufbox 4
  DEVICE_VARIANT := Sercomm
  CFE_BOARD_ID := 96358VW
  CHIP_ID := 6358
  CFE_EXTRAS += --rsa-signature "$(VERSION_DIST)-$(firstword $(subst -,$(space),$(REVISION)))"
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

define Device/sfr_neufbox-4-foxconn-r1
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := SFR
  DEVICE_MODEL := Neufbox 4
  DEVICE_VARIANT := Foxconn
  CFE_BOARD_ID := 96358VW
  CHIP_ID := 6358
  CFE_EXTRAS += --rsa-signature "$(VERSION_DIST)-$(firstword $(subst -,$(space),$(REVISION)))"
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB2_PACKAGES)
endef

define Device/sfr_neufbox-6-sercomm-r0
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := SFR
  DEVICE_MODEL := Neufbox 6
  CFE_BOARD_ID := NB6-SER-r0
  CHIP_ID := 6362
  CFE_EXTRAS += --rsa-signature "$(VERSION_DIST)-$(firstword $(subst -,$(space),$(REVISION)))"
  SOC := bcm6361
  DEVICE_PACKAGES := $(USB2_PACKAGES)
endef

define Device/sky_sr102
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := SKY
  DEVICE_MODEL := SR102
  CFE_BOARD_ID := BSKYB_63168
  CHIP_ID := 63268
  CFE_EXTRAS += --rsa-signature "$(VERSION_DIST)-$(firstword $(subst -,$(space),$(REVISION)))"
  SOC := bcm63168
  DEVICE_PACKAGES := $(USB2_PACKAGES)
endef

### T-Com ###
define Device/t-com_speedport-w-303v
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := T-Com
  DEVICE_MODEL := Speedport W 303V
  IMAGES := factory.bin sysupgrade.bin
  IMAGE/factory.bin := cfe-spw303v-bin --pad 4 | spw303v-bin | xor-image
  IMAGE/sysupgrade.bin := cfe-spw303v-bin | spw303v-bin
  CFE_BOARD_ID := 96358-502V
  CHIP_ID := 6358
  DEVICE_PACKAGES := $(B43_PACKAGES)
endef

define Device/t-com_speedport-w-500v
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := T-Com
  DEVICE_MODEL := Speedport W 500V
  CFE_BOARD_ID := 96348GW
  CHIP_ID := 6348
  DEVICE_PACKAGES := $(B43_PACKAGES)
  DEFAULT := n
endef

### Technicolor ###
define Device/technicolor_tg582n
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Technicolor
  DEVICE_MODEL := TG582n
  IMAGES += sysupgrade.bin
  CFE_BOARD_ID := DANT-1
  CHIP_ID := 6328
  FLASH_MB := 16
  DEVICE_PACKAGES := $(USB2_PACKAGES) $(B43_PACKAGES)
endef

define Device/technicolor_tg582n-telecom-italia
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := Technicolor
  DEVICE_MODEL := TG582n
  DEVICE_VARIANT := Telecom Italia
  IMAGES += sysupgrade.bin
  CFE_BOARD_ID := DANT-V
  CHIP_ID := 6328
  FLASH_MB := 16
  DEVICE_PACKAGES := $(USB2_PACKAGES) $(B43_PACKAGES)
endef

### Tecom ###
define Device/tecom_gw6000
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Tecom
  DEVICE_MODEL := GW6000
  CFE_BOARD_ID := 96348GW
  CHIP_ID := 6348
  DEVICE_PACKAGES := $(BRCMWL_PACKAGES) $(USB1_PACKAGES)
  DEFAULT := n
endef

define Device/tecom_gw6200
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Tecom
  DEVICE_MODEL := GW6200
  CFE_BOARD_ID := 96348GW
  CHIP_ID := 6348
  CFE_EXTRAS += --rsa-signature "$(shell printf '\x99')"
  DEVICE_PACKAGES := $(BRCMWL_PACKAGES) $(USB1_PACKAGES)
  DEFAULT := n
endef

### Telsey ###
define Device/telsey_cpva502plus
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Telsey
  DEVICE_MODEL := CPVA502+
  CFE_BOARD_ID := CPVA502+
  CHIP_ID := 6348
  CFE_EXTRAS += --signature "Telsey Tlc" --signature2 "99.99.999"
  DEVICE_PACKAGES := $(B43_PACKAGES)
  DEFAULT := n
endef

define Device/telsey_cpva642
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Telsey
  DEVICE_MODEL := CPVA642-type (CPA-ZNTE60T)
  CFE_BOARD_ID := CPVA642
  CHIP_ID := 6358
  CFE_EXTRAS += --signature "Telsey Tlc" --signature2 "99.99.999" --second-image-flag "0"
  FLASH_MB := 8
  DEVICE_PACKAGES := $(RT63_PACKAGES) $(USB2_PACKAGES)
endef

define Device/telsey_magic
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := Alice
  DEVICE_MODEL := W-Gate
  DEVICE_ALT0_VENDOR := Telsey
  DEVICE_ALT0_MODEL := MAGIC
  IMAGES :=
  CFE_BOARD_ID := MAGIC
  CHIP_ID := 6348
  DEVICE_PACKAGES := $(RT63_PACKAGES)
  DEFAULT := n
endef

### TP-Link ###
define Device/tp-link_td-w8900gb
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := TP-Link
  DEVICE_MODEL := TD-W8900GB
  CFE_BOARD_ID := 96348GW-11
  CHIP_ID := 6348
  CFE_EXTRAS += --rsa-signature "$(shell printf 'PRID\x89\x10\x00\x02')"
  IMAGE_OFFSET := 0x20000
  DEVICE_PACKAGES := $(B43_PACKAGES)
  DEFAULT := n
endef

### USRobotics ###
define Device/usrobotics_usr9108
  $(DeviceCommon/bcm63xx-legacy)
  DEVICE_VENDOR := USRobotics
  DEVICE_MODEL := USR9108
  CFE_BOARD_ID := 96348GW-A
  CHIP_ID := 6348
  DEVICE_PACKAGES := $(B43_PACKAGES) $(USB1_PACKAGES)
  DEFAULT := n
endef

### ZyXEL ###
define Device/zyxel_p870hw-51a-v2
  $(DeviceCommon/bcm63xx)
  DEVICE_VENDOR := ZyXEL
  DEVICE_MODEL := P870HW-51a
  DEVICE_VARIANT := v2
  IMAGES := factory.bin
  IMAGE/factory.bin := cfe-bin | zyxel-bin
  CFE_BOARD_ID := 96368VVW
  CHIP_ID := 6368
  CFE_EXTRAS += --rsa-signature "ZyXEL" --signature "ZyXEL_0001"
  DEVICE_PACKAGES := $(B43_PACKAGES)
  DEFAULT := n
endef
