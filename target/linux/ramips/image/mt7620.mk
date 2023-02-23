#
# MT7620A Profiles
#

include ./common-tp-link.mk

DEVICE_VARS += DLINK_ROM_ID DLINK_FAMILY_MEMBER DLINK_FIRMWARE_SIZE DLINK_IMAGE_OFFSET

define Build/elecom-header
	cp $@ $(KDIR)/v_0.0.0.bin
	( \
		$(MKHASH) md5 $(KDIR)/v_0.0.0.bin && \
		echo 458 \
	) | $(MKHASH) md5 > $(KDIR)/v_0.0.0.md5
	$(STAGING_DIR_HOST)/bin/tar -c \
		$(if $(SOURCE_DATE_EPOCH),--mtime=@$(SOURCE_DATE_EPOCH)) \
		--owner=0 --group=0 -f $@ -C $(KDIR) v_0.0.0.bin v_0.0.0.md5
endef

define Device/aigale_ai-br100
  SOC := mt7620a
  IMAGE_SIZE := 7936k
  DEVICE_VENDOR := Aigale
  DEVICE_MODEL := Ai-BR100
  DEVICE_PACKAGES:= kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += ai-br100
endef

define Device/alfa-network_ac1200rm
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := ALFA Network
  DEVICE_MODEL := AC1200RM
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci uboot-envtools
  SUPPORTED_DEVICES += ac1200rm
endef

define Device/alfa-network_r36m-e4g
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := ALFA Network
  DEVICE_MODEL := R36M-E4G
  DEVICE_PACKAGES := kmod-i2c-ralink kmod-usb2 kmod-usb-ohci uboot-envtools \
	uqmi
  SUPPORTED_DEVICES += r36m-e4g
endef

define Device/alfa-network_tube-e4g
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := ALFA Network
  DEVICE_MODEL := Tube-E4G
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci uboot-envtools uqmi -iwinfo \
	-kmod-rt2800-soc -wpad-basic-mbedtls
  SUPPORTED_DEVICES += tube-e4g
endef

define DeviceCommon/amit_jboot
  DLINK_IMAGE_OFFSET := 0x10000
  KERNEL := $(KERNEL_DTB) | uImage lzma -M 0x4f4b4c49
  LOADER_FLASH_OFFS := 0x20000
  LOADER_TYPE := bin
  COMPILE := loader-$(1).bin
  COMPILE/loader-$(1).bin := loader-okli-compile | pad-to 64k | lzma | \
	pad-to 65480
  IMAGES += factory.bin
  IMAGE/sysupgrade.bin := append-kernel | append-rootfs | mkdlinkfw-loader | \
	pad-rootfs | append-metadata
  IMAGE/factory.bin := append-kernel | append-rootfs | mkdlinkfw-loader | \
	pad-rootfs | mkdlinkfw-factory
  DEVICE_PACKAGES := jboot-tools kmod-usb2 kmod-usb-ohci
endef

define Device/ampedwireless_b1200ex
  SOC := mt7620a
  DEVICE_VENDOR := Amped Wireless
  DEVICE_MODEL := B1200EX
  BLOCKSIZE := 4k
  IMAGE_SIZE := 7744k
  IMAGE/sysupgrade.bin := append-kernel | append-rootfs | \
	edimax-header -s CSYS -m RN10 -f 0x70000 -S 0x01100000 | pad-rootfs | \
	check-size | append-metadata
  DEVICE_PACKAGES := kmod-mt76x2 kmod-phy-realtek
endef

define Device/asus_rp-n53
  SOC := mt7620a
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := ASUS
  DEVICE_MODEL := RP-N53
  DEVICE_PACKAGES := kmod-rt2800-pci
  SUPPORTED_DEVICES += rp-n53
endef

define Device/asus_rt-ac51u
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := ASUS
  DEVICE_MODEL := RT-AC51U
  DEVICE_PACKAGES := kmod-mt76x0e kmod-usb2 kmod-usb-ohci \
	kmod-usb-ledtrig-usbport
  SUPPORTED_DEVICES += rt-ac51u
endef

define Device/asus_rt-ac54u
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := ASUS
  DEVICE_MODEL := RT-AC54U
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci \
	kmod-usb-ledtrig-usbport
endef

define Device/asus_rt-n12p
  SOC := mt7620n
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := ASUS
  DEVICE_MODEL := RT-N11P/RT-N12+/RT-N12Eb1
  SUPPORTED_DEVICES += rt-n12p
endef

define Device/asus_rt-n14u
  SOC := mt7620n
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := ASUS
  DEVICE_MODEL := RT-N14u
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += rt-n14u
endef

define Device/bdcom_wap2100-sk
  SOC := mt7620a
  IMAGE_SIZE := 15808k
  DEVICE_VENDOR := BDCOM
  DEVICE_MODEL := WAP2100-SK (ZTE ZXECS EBG3130)
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-mt76x2 kmod-mt76x0e \
	kmod-sdhci-mt7620 kmod-usb-ledtrig-usbport
endef

define Device/buffalo_whr-1166d
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := Buffalo
  DEVICE_MODEL := WHR-1166D
  DEVICE_PACKAGES := kmod-mt76x2
  SUPPORTED_DEVICES += whr-1166d
endef

define Device/buffalo_whr-300hp2
  SOC := mt7620a
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := Buffalo
  DEVICE_MODEL := WHR-300HP2
  SUPPORTED_DEVICES += whr-300hp2
endef

define Device/buffalo_whr-600d
  SOC := mt7620a
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := Buffalo
  DEVICE_MODEL := WHR-600D
  DEVICE_PACKAGES := kmod-rt2800-pci
  SUPPORTED_DEVICES += whr-600d
endef

define Device/buffalo_wmr-300
  SOC := mt7620n
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := Buffalo
  DEVICE_MODEL := WMR-300
  SUPPORTED_DEVICES += wmr-300
endef

define Device/comfast_cf-wr800n
  SOC := mt7620n
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := Comfast
  DEVICE_MODEL := CF-WR800N
  SUPPORTED_DEVICES += cf-wr800n
endef

define Device/dlink_dch-m225
  $(DeviceCommon/seama)
  SOC := mt7620a
  BLOCKSIZE := 4k
  SEAMA_SIGNATURE := wapn22_dlink.2013gui_dap1320b
  IMAGE_SIZE := 6848k
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DCH-M225
  DEVICE_PACKAGES := kmod-sound-core kmod-sound-mt7620 kmod-i2c-ralink
  SUPPORTED_DEVICES += dch-m225
endef

define Device/dlink_dir-510l
  $(DeviceCommon/amit_jboot)
  SOC := mt7620a
  IMAGE_SIZE := 14208k
  LOADER_FLASH_OFFS := 0x220000
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DIR-510L
  DEVICE_PACKAGES += kmod-mt76x0e
  DLINK_ROM_ID := DLK6E3805001
  DLINK_FAMILY_MEMBER := 0x6E38
  DLINK_FIRMWARE_SIZE := 0xDE0000
  DLINK_IMAGE_OFFSET := 0x210000
endef

define Device/dlink_dir-810l
  SOC := mt7620a
  DEVICE_PACKAGES := kmod-mt76x0e
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DIR-810L
  IMAGE_SIZE := 6720k
  SUPPORTED_DEVICES += dir-810l
endef

define Device/dlink_dwr-116-a1
  $(DeviceCommon/amit_jboot)
  SOC := mt7620n
  IMAGE_SIZE := 8064k
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DWR-116
  DEVICE_VARIANT := A1/A2
  DLINK_ROM_ID := DLK6E3803001
  DLINK_FAMILY_MEMBER := 0x6E38
  DLINK_FIRMWARE_SIZE := 0x7E0000
endef

define Device/dlink_dwr-118-a1
  $(DeviceCommon/amit_jboot)
  SOC := mt7620a
  IMAGE_SIZE := 16256k
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DWR-118
  DEVICE_VARIANT := A1
  DEVICE_PACKAGES += kmod-mt76x0e
  DLINK_ROM_ID := DLK6E3811001
  DLINK_FAMILY_MEMBER := 0x6E38
  DLINK_FIRMWARE_SIZE := 0xFE0000
endef

define Device/dlink_dwr-118-a2
  $(DeviceCommon/amit_jboot)
  SOC := mt7620a
  IMAGE_SIZE := 16256k
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DWR-118
  DEVICE_VARIANT := A2
  DEVICE_PACKAGES += kmod-mt76x2
  DLINK_ROM_ID := DLK6E3814001
  DLINK_FAMILY_MEMBER := 0x6E38
  DLINK_FIRMWARE_SIZE := 0xFE0000
endef

define Device/dlink_dwr-921-c1
  $(DeviceCommon/amit_jboot)
  SOC := mt7620n
  IMAGE_SIZE := 16256k
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DWR-921
  DEVICE_VARIANT := C1
  DLINK_ROM_ID := DLK6E2414001
  DLINK_FAMILY_MEMBER := 0x6E24
  DLINK_FIRMWARE_SIZE := 0xFE0000
  DEVICE_PACKAGES += kmod-usb-net-qmi-wwan kmod-usb-serial-option uqmi
endef

define Device/dlink_dwr-921-c3
  $(Device/dlink_dwr-921-c1)
  DEVICE_DTS := mt7620n_dlink_dwr-921-c1
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DWR-921
  DEVICE_VARIANT := C3
  DLINK_ROM_ID := DLK6E2414009
  SUPPORTED_DEVICES := dlink,dwr-921-c1
endef

define Device/dlink_dwr-922-e2
  $(DeviceCommon/amit_jboot)
  SOC := mt7620n
  IMAGE_SIZE := 16256k
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DWR-922
  DEVICE_VARIANT := E2
  DLINK_ROM_ID := DLK6E2414005
  DLINK_FAMILY_MEMBER := 0x6E24
  DLINK_FIRMWARE_SIZE := 0xFE0000
  DEVICE_PACKAGES += kmod-usb-net-qmi-wwan kmod-usb-serial-option uqmi
endef

define Device/dlink_dwr-960
  $(DeviceCommon/amit_jboot)
  SOC := mt7620a
  IMAGE_SIZE := 16256k
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DWR-960
  DLINK_ROM_ID := DLK6E2429001
  DLINK_FAMILY_MEMBER := 0x6E24
  DLINK_FIRMWARE_SIZE := 0xFE0000
  DEVICE_PACKAGES += kmod-usb-net-qmi-wwan kmod-usb-serial-option uqmi \
	kmod-mt76x0e
endef

define Device/dlink_dwr-961-a1
  $(DeviceCommon/amit_jboot)
  SOC := mt7620a
  IMAGE_SIZE := 16256k
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DWR-961
  DEVICE_VARIANT := A1
  DLINK_ROM_ID := DLK6E3813001
  DLINK_FAMILY_MEMBER := 0x6E38
  DLINK_FIRMWARE_SIZE := 0xFE0000
  DEVICE_PACKAGES += kmod-mt76x2 kmod-usb-net-qmi-wwan kmod-usb-serial-option \
	uqmi
endef

define Device/domywifi_dm202
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := DomyWifi
  DEVICE_MODEL := DM202
  DEVICE_PACKAGES := kmod-mt76x0e kmod-sdhci-mt7620 kmod-usb2 kmod-usb-ohci
endef

define Device/domywifi_dm203
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := DomyWifi
  DEVICE_MODEL := DM203
  DEVICE_PACKAGES := kmod-mt76x0e kmod-sdhci-mt7620 kmod-usb2 kmod-usb-ohci
endef

define Device/domywifi_dw22d
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := DomyWifi
  DEVICE_MODEL := DW22D
  DEVICE_PACKAGES := kmod-mt76x0e kmod-sdhci-mt7620 kmod-usb2 kmod-usb-ohci
endef

define Device/dovado_tiny-ac
  SOC := mt7620a
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := Dovado
  DEVICE_MODEL := Tiny AC
  DEVICE_PACKAGES := kmod-mt76x0e kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += tiny-ac
endef

define Device/edimax_br-6478ac-v2
  SOC := mt7620a
  DEVICE_VENDOR := Edimax
  DEVICE_MODEL := BR-6478AC
  DEVICE_VARIANT := V2
  BLOCKSIZE := 64k
  IMAGE_SIZE := 7744k
  IMAGE/sysupgrade.bin := append-kernel | append-rootfs | \
	edimax-header -s CSYS -m RN68 -f 0x70000 -S 0x01100000 | pad-rootfs | \
	check-size | append-metadata
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci \
	kmod-usb-ledtrig-usbport
endef

define Device/edimax_ew-7476rpc
  SOC := mt7620a
  DEVICE_VENDOR := Edimax
  DEVICE_MODEL := EW-7476RPC
  BLOCKSIZE := 4k
  IMAGE_SIZE := 7744k
  IMAGE/sysupgrade.bin := append-kernel | append-rootfs | \
	edimax-header -s CSYS -m RN79 -f 0x70000 -S 0x01100000 | pad-rootfs | \
	check-size | append-metadata
  DEVICE_PACKAGES := kmod-mt76x2 kmod-phy-realtek
endef

define Device/edimax_ew-7478ac
  SOC := mt7620a
  DEVICE_VENDOR := Edimax
  DEVICE_MODEL := EW-7478AC
  BLOCKSIZE := 4k
  IMAGE_SIZE := 7744k
  IMAGE/sysupgrade.bin := append-kernel | append-rootfs | \
	edimax-header -s CSYS -m RN70 -f 0x70000 -S 0x01100000 | pad-rootfs | \
	check-size | append-metadata
  DEVICE_PACKAGES := kmod-mt76x2 kmod-phy-realtek
endef

define Device/edimax_ew-7478apc
  SOC := mt7620a
  DEVICE_VENDOR := Edimax
  DEVICE_MODEL := EW-7478APC
  BLOCKSIZE := 4k
  IMAGE_SIZE := 7744k
  IMAGE/sysupgrade.bin := append-kernel | append-rootfs | \
	edimax-header -s CSYS -m RN75 -f 0x70000 -S 0x01100000 | pad-rootfs | \
	check-size | append-metadata
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci \
	kmod-usb-ledtrig-usbport
endef

define Device/elecom_wrh-300cr
  SOC := mt7620n
  IMAGE_SIZE := 14272k
  IMAGES += factory.bin
  IMAGE/factory.bin := $$(sysupgrade_bin) | check-size | elecom-header
  DEVICE_VENDOR := Elecom
  DEVICE_MODEL := WRH-300CR
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += wrh-300cr
endef

define Device/engenius_epg600
  $(DeviceCommon/uimage-lzma-loader)
  SOC := mt7620a
  BLOCKSIZE := 4k
  IMAGE_SIZE := 15616k
  IMAGES += factory.dlf
  IMAGE/factory.dlf := $$(sysupgrade_bin) | check-size | \
	senao-header -r 0x101 -p 0x6a -t 2
  DEVICE_VENDOR := EnGenius
  DEVICE_MODEL := EPG600
  DEVICE_PACKAGES += kmod-rt2800-pci kmod-usb-storage \
	kmod-usb-ohci kmod-usb2 uboot-envtools
endef

define Device/engenius_esr600
  SOC := mt7620a
  BLOCKSIZE := 64k
  IMAGE_SIZE := 15616k
  IMAGES += factory.dlf
  IMAGE/factory.dlf := $$(sysupgrade_bin) | check-size | \
	senao-header -r 0x101 -p 0x57 -t 2
  DEVICE_VENDOR := EnGenius
  DEVICE_MODEL := ESR600
  DEVICE_PACKAGES += kmod-rt2800-pci kmod-usb-storage kmod-usb-ohci \
	kmod-usb-ehci
endef

define Device/fon_fon2601
  SOC := mt7620a
  IMAGE_SIZE := 15936k
  DEVICE_VENDOR := Fon
  DEVICE_MODEL := FON2601
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci
  KERNEL_INITRAMFS := $$(KERNEL) | uimage-padhdr
  IMAGE/sysupgrade.bin := append-kernel | append-rootfs | uimage-padhdr | \
	pad-rootfs | check-size | append-metadata
endef

define Device/glinet_gl-mt300a
  SOC := mt7620a
  IMAGE_SIZE := 15872k
  DEVICE_VENDOR := GL.iNet
  DEVICE_MODEL := GL-MT300A
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += gl-mt300a
endef

define Device/glinet_gl-mt300n
  SOC := mt7620a
  IMAGE_SIZE := 15872k
  DEVICE_VENDOR := GL.iNet
  DEVICE_MODEL := GL-MT300N
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += gl-mt300n
endef

define Device/glinet_gl-mt750
  SOC := mt7620a
  IMAGE_SIZE := 15872k
  DEVICE_VENDOR := GL.iNet
  DEVICE_MODEL := GL-MT750
  DEVICE_PACKAGES := kmod-mt76x0e kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += gl-mt750
endef

define Device/head-weblink_hdrm200
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := Head Weblink
  DEVICE_MODEL := HDRM2000
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci kmod-sdhci-mt7620 \
	uqmi kmod-usb-serial-option
endef

define Device/hiwifi_hc5661
  SOC := mt7620a
  IMAGE_SIZE := 15808k
  DEVICE_VENDOR := HiWiFi
  DEVICE_MODEL := HC5661
  DEVICE_PACKAGES := kmod-sdhci-mt7620
  SUPPORTED_DEVICES += hc5661
endef

define Device/hiwifi_hc5761
  SOC := mt7620a
  IMAGE_SIZE := 15808k
  DEVICE_VENDOR := HiWiFi
  DEVICE_MODEL := HC5761
  DEVICE_PACKAGES := kmod-mt76x0e kmod-usb2 kmod-usb-ohci kmod-sdhci-mt7620 \
	kmod-usb-ledtrig-usbport
  SUPPORTED_DEVICES += hc5761
endef

define Device/hiwifi_hc5861
  SOC := mt7620a
  IMAGE_SIZE := 15808k
  DEVICE_VENDOR := HiWiFi
  DEVICE_MODEL := HC5861
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci kmod-sdhci-mt7620 \
	kmod-usb-ledtrig-usbport
  SUPPORTED_DEVICES += hc5861
endef

define Device/hnet_c108
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := HNET
  DEVICE_MODEL := C108
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-sdhci-mt7620
  SUPPORTED_DEVICES += c108
endef

define Device/humax_e2
  SOC := mt7620a
  IMAGE_SIZE := 7744k
  DEVICE_VENDOR := HUMAX
  DEVICE_MODEL := E2
  DEVICE_ALT0_VENDOR := HUMAX
  DEVICE_ALT0_MODEL := QUANTUM E2
  IMAGE/sysupgrade.bin := append-kernel | append-rootfs | \
	edimax-header -s CSYS -m RN75 -f 0x70000 -S 0x01100000 | pad-rootfs | \
	check-size | append-metadata
  DEVICE_PACKAGES := kmod-mt76x0e
endef

define DeviceCommon/sunvalley_filehub
  SOC := mt7620n
  IMAGE_SIZE := 6144k
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-i2c-ralink
  LOADER_TYPE := bin
  LOADER_FLASH_OFFS := 0x200000
  COMPILE := loader-$(1).bin
  COMPILE/loader-$(1).bin := loader-okli-compile | pad-to 64k | lzma | \
	uImage lzma
  KERNEL := $(KERNEL_DTB) | uImage lzma -M 0x4f4b4c49
  KERNEL_INITRAMFS := $(KERNEL_DTB) | uImage lzma
  IMAGES += kernel.bin rootfs.bin
  IMAGE/kernel.bin := append-loader-okli $(1) | check-size 64k
  IMAGE/rootfs.bin := $$(sysupgrade_bin) | check-size
endef

define Device/hootoo_ht-tm05
  $(DeviceCommon/sunvalley_filehub)
  DEVICE_VENDOR := HooToo
  DEVICE_MODEL := HT-TM05
endef

define Device/iodata_wn-ac1167gr
  SOC := mt7620a
  DEVICE_VENDOR := I-O DATA
  DEVICE_MODEL := WN-AC1167GR
  IMAGE_SIZE := 6864k
  IMAGES += factory.bin
  IMAGE/factory.bin := $$(sysupgrade_bin) | check-size | \
	elx-header 01040016 8844A2D168B45A2D
  DEVICE_PACKAGES := kmod-mt76x2
endef

define Device/iodata_wn-ac733gr3
  SOC := mt7620a
  DEVICE_VENDOR := I-O DATA
  DEVICE_MODEL := WN-AC733GR3
  IMAGE_SIZE := 6992k
  IMAGES += factory.bin
  IMAGE/factory.bin := $$(sysupgrade_bin) | check-size | \
	elx-header 01040006 8844A2D168B45A2D
  DEVICE_PACKAGES := kmod-mt76x0e kmod-switch-rtl8367b
endef

define Device/iptime_a1004ns
  SOC := mt7620a
  IMAGE_SIZE := 16192k
  UIMAGE_NAME := a1004ns
  DEVICE_VENDOR := ipTIME
  DEVICE_MODEL := A1004ns
  DEVICE_PACKAGES := kmod-mt76x0e kmod-usb2 kmod-usb-ohci \
	kmod-usb-ledtrig-usbport
endef

define Device/iptime_a104ns
  SOC := mt7620a
  IMAGE_SIZE := 8000k
  UIMAGE_NAME := a104ns
  DEVICE_VENDOR := ipTIME
  DEVICE_MODEL := A104ns
  DEVICE_PACKAGES := kmod-mt76x0e kmod-usb2 kmod-usb-ohci \
	kmod-usb-ledtrig-usbport
endef

define Device/kimax_u25awf-h1
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := Kimax
  DEVICE_MODEL := U25AWF
  DEVICE_VARIANT := H1
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-storage kmod-scsi-core \
	kmod-fs-ext4 kmod-fs-vfat block-mount
  SUPPORTED_DEVICES += u25awf-h1
endef

define Device/kimax_u35wf
  SOC := mt7620n
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := Kimax
  DEVICE_MODEL := U35WF
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-storage kmod-scsi-core \
	kmod-fs-ext4 kmod-fs-vfat block-mount
endef

define Device/kingston_mlw221
  SOC := mt7620n
  IMAGE_SIZE := 15744k
  DEVICE_VENDOR := Kingston
  DEVICE_MODEL := MLW221
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += mlw221
endef

define Device/kingston_mlwg2
  SOC := mt7620n
  IMAGE_SIZE := 15744k
  DEVICE_VENDOR := Kingston
  DEVICE_MODEL := MLWG2
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += mlwg2
endef

define Device/lava_lr-25g001
  $(DeviceCommon/amit_jboot)
  SOC := mt7620a
  IMAGE_SIZE := 16256k
  DEVICE_VENDOR := LAVA
  DEVICE_MODEL := LR-25G001
  DLINK_ROM_ID := LVA6E3804001
  DLINK_FAMILY_MEMBER := 0x6E38
  DLINK_FIRMWARE_SIZE := 0xFE0000
  DEVICE_PACKAGES += kmod-mt76x0e
endef

define Device/lb-link_bl-w1200
  SOC := mt7620a
  DEVICE_VENDOR := LB-Link
  DEVICE_MODEL := BL-W1200
  IMAGE_SIZE := 7872k
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-mt76x2
endef

define Device/lenovo_newifi-y1
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := Lenovo
  DEVICE_MODEL := Y1
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += y1
endef

define Device/lenovo_newifi-y1s
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := Lenovo
  DEVICE_MODEL := Y1S
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += y1s
endef

define Device/linksys_e1700
  SOC := mt7620a
  IMAGE_SIZE := 7872k
  IMAGES += factory.bin
  IMAGE/factory.bin := $$(sysupgrade_bin) | check-size | umedia-header 0x013326
  DEVICE_VENDOR := Linksys
  DEVICE_MODEL := E1700
  SUPPORTED_DEVICES += e1700
endef

define Device/microduino_microwrt
  SOC := mt7620a
  IMAGE_SIZE := 16128k
  DEVICE_VENDOR := Microduino
  DEVICE_MODEL := MicroWRT
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += microwrt
endef

define Device/netcore_nw5212
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  BLOCKSIZE := 4k
  DEVICE_VENDOR := Netcore
  DEVICE_MODEL := NW5212
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
endef

define Device/netgear_ex2700
  SOC := mt7620a
  NETGEAR_HW_ID := 29764623+4+0+32+2x2+0
  NETGEAR_BOARD_ID := EX2700
  BLOCKSIZE := 4k
  IMAGE_SIZE := 3776k
  IMAGES += factory.bin
  KERNEL := $(KERNEL_DTB) | uImage lzma | pad-offset 64k 64 | \
	append-uImage-fakehdr filesystem
  IMAGE/factory.bin := $$(sysupgrade_bin) | check-size | netgear-dni
  DEVICE_VENDOR := NETGEAR
  DEVICE_MODEL := EX2700
  SUPPORTED_DEVICES += ex2700
  DEFAULT := n
endef

define Device/netgear_ex3700
  SOC := mt7620a
  NETGEAR_BOARD_ID := U12H319T00_NETGEAR
  BLOCKSIZE := 4k
  IMAGE_SIZE := 7744k
  IMAGES += factory.chk
  IMAGE/factory.chk := $$(sysupgrade_bin) | check-size | netgear-chk
  DEVICE_PACKAGES := kmod-mt76x2
  DEVICE_VENDOR := NETGEAR
  DEVICE_MODEL := EX3700/EX3800
  SUPPORTED_DEVICES += ex3700
endef

define Device/netgear_ex6120
  SOC := mt7620a
  NETGEAR_BOARD_ID := U12H319T30_NETGEAR
  BLOCKSIZE := 4k
  IMAGE_SIZE := 7744k
  IMAGES += factory.chk
  IMAGE/factory.chk := $$(sysupgrade_bin) | check-size | netgear-chk
  DEVICE_PACKAGES := kmod-mt76x2
  DEVICE_VENDOR := NETGEAR
  DEVICE_MODEL := EX6120
endef

define Device/netgear_ex6130
  SOC := mt7620a
  NETGEAR_BOARD_ID := U12H319T50_NETGEAR
  BLOCKSIZE := 4k
  IMAGE_SIZE := 7744k
  IMAGES += factory.chk
  IMAGE/factory.chk := $$(sysupgrade_bin) | check-size | netgear-chk
  DEVICE_PACKAGES := kmod-mt76x2
  DEVICE_VENDOR := NETGEAR
  DEVICE_MODEL := EX6130
endef

define Device/netgear_jwnr2010-v5
  $(DeviceCommon/netgear_sercomm_nor)
  SOC := mt7620n
  BLOCKSIZE := 4k
  IMAGE_SIZE := 3840k
  DEVICE_MODEL := JWNR2010
  DEVICE_VARIANT := v5
  SERCOMM_HWNAME := N300
  SERCOMM_HWID := ASW
  SERCOMM_HWVER := A001
  SERCOMM_SWVER := 0x0040
  SERCOMM_PAD := 128k
  DEFAULT := n
endef

define Device/netgear_pr2000
  $(DeviceCommon/netgear_sercomm_nor)
  SOC := mt7620n
  BLOCKSIZE := 4k
  IMAGE_SIZE := 15488k
  DEVICE_MODEL := PR2000
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
  SERCOMM_HWNAME := PR2000
  SERCOMM_HWID := AQ7
  SERCOMM_HWVER := A001
  SERCOMM_SWVER := 0x0000
  SERCOMM_PAD := 640k
endef

define Device/netgear_wn3000rp-v3
  SOC := mt7620a
  IMAGE_SIZE := 7872k
  NETGEAR_HW_ID := 29764836+8+0+32+2x2+0
  NETGEAR_BOARD_ID := WN3000RPv3
  BLOCKSIZE := 4k
  IMAGES += factory.bin
  KERNEL := $(KERNEL_DTB) | uImage lzma | pad-offset 64k 64 | \
	append-uImage-fakehdr filesystem
  IMAGE/factory.bin := $$(sysupgrade_bin) | check-size | netgear-dni
  DEVICE_VENDOR := NETGEAR
  DEVICE_MODEL := WN3000RP
  DEVICE_VARIANT := v3
  SUPPORTED_DEVICES += wn3000rpv3
endef

define Device/netgear_wn3100rp-v2
  SOC := mt7620a
  IMAGE_SIZE := 7872k
  NETGEAR_HW_ID := 29764883+8+0+32+2x2+0
  NETGEAR_BOARD_ID := WN3100RPv2
  BLOCKSIZE := 4k
  IMAGES += factory.bin
  KERNEL := $(KERNEL_DTB) | uImage lzma | pad-offset 64k 64 | \
	append-uImage-fakehdr filesystem
  IMAGE/factory.bin := $$(sysupgrade_bin) | check-size | netgear-dni
  DEVICE_VENDOR := NETGEAR
  DEVICE_MODEL := WN3100RP
  DEVICE_VARIANT := v2
endef

define Device/netis_wf2770
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  UIMAGE_NAME := WF2770_0.0.00
  DEVICE_VENDOR := NETIS
  DEVICE_MODEL := WF2770
  DEVICE_PACKAGES := kmod-mt76x0e
  KERNEL_INITRAMFS := $(KERNEL_DTB) | netis-tail WF2770 | uImage lzma
endef

define Device/nexx_wt3020-4m
  SOC := mt7620n
  BLOCKSIZE := 4k
  IMAGE_SIZE := 3776k
  IMAGES += factory.bin
  IMAGE/factory.bin := $$(sysupgrade_bin) | check-size | \
	poray-header -B WT3020 -F 4M
  DEVICE_VENDOR := Nexx
  DEVICE_MODEL := WT3020
  DEVICE_VARIANT := 4M
  SUPPORTED_DEVICES += wt3020 wt3020-4M
  DEFAULT := n
endef

define Device/nexx_wt3020-8m
  SOC := mt7620n
  IMAGE_SIZE := 7872k
  IMAGES += factory.bin
  IMAGE/factory.bin := $$(sysupgrade_bin) | check-size | \
	poray-header -B WT3020 -F 8M
  DEVICE_VENDOR := Nexx
  DEVICE_MODEL := WT3020
  DEVICE_VARIANT := 8M
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += wt3020 wt3020-8M
endef

define Device/ohyeah_oy-0001
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := Oh Yeah
  DEVICE_MODEL := OY-0001
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += oy-0001
endef

define Device/phicomm_k2-v22.4
  SOC := mt7620a
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := Phicomm
  DEVICE_MODEL := K2
  DEVICE_VARIANT:= v22.4 or older
  DEVICE_PACKAGES := kmod-mt76x2
  SUPPORTED_DEVICES += psg1218 psg1218a phicomm,psg1218a
endef

define Device/phicomm_k2-v22.5
  SOC := mt7620a
  IMAGE_SIZE := 7552k
  DEVICE_VENDOR := Phicomm
  DEVICE_MODEL := K2
  DEVICE_VARIANT:= v22.5 or newer
  DEVICE_PACKAGES := kmod-mt76x2
endef

define Device/phicomm_k2g
  SOC := mt7620a
  IMAGE_SIZE := 7552k
  DEVICE_VENDOR := Phicomm
  DEVICE_MODEL := K2G
  DEVICE_PACKAGES := kmod-mt76x2
endef

define Device/phicomm_psg1208
  SOC := mt7620a
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := Phicomm
  DEVICE_MODEL := PSG1208
  DEVICE_PACKAGES := kmod-mt76x2
  SUPPORTED_DEVICES += psg1208
endef

define Device/phicomm_psg1218b
  SOC := mt7620a
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := Phicomm
  DEVICE_MODEL := PSG1218
  DEVICE_VARIANT := Bx
  DEVICE_PACKAGES := kmod-mt76x2
  SUPPORTED_DEVICES += psg1218 psg1218b
endef

define Device/planex_cs-qr10
  SOC := mt7620a
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := Planex
  DEVICE_MODEL := CS-QR10
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-sound-core \
	kmod-sound-mt7620 kmod-i2c-ralink kmod-sdhci-mt7620
  SUPPORTED_DEVICES += cs-qr10
endef

define Device/planex_db-wrt01
  SOC := mt7620a
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := Planex
  DEVICE_MODEL := DB-WRT01
  SUPPORTED_DEVICES += db-wrt01
endef

define Device/planex_mzk-750dhp
  SOC := mt7620a
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := Planex
  DEVICE_MODEL := MZK-750DHP
  DEVICE_PACKAGES := kmod-mt76x0e
  SUPPORTED_DEVICES += mzk-750dhp
endef

define Device/planex_mzk-ex300np
  SOC := mt7620a
  IMAGE_SIZE := 7360k
  DEVICE_VENDOR := Planex
  DEVICE_MODEL := MZK-EX300NP
  SUPPORTED_DEVICES += mzk-ex300np
endef

define Device/planex_mzk-ex750np
  SOC := mt7620a
  IMAGE_SIZE := 7360k
  DEVICE_VENDOR := Planex
  DEVICE_MODEL := MZK-EX750NP
  DEVICE_PACKAGES := kmod-mt76x2
  SUPPORTED_DEVICES += mzk-ex750np
endef

define Device/ralink_mt7620a-evb
  SOC := mt7620a
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := MT7620a EVB
endef

define Device/ralink_mt7620a-mt7530-evb
  SOC := mt7620a
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := MT7620a + MT7530 EVB
  SUPPORTED_DEVICES += mt7620a_mt7530
endef

define Device/ralink_mt7620a-mt7610e-evb
  SOC := mt7620a
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := MT7620a + MT7610e EVB
  DEVICE_PACKAGES := kmod-mt76x0e
  SUPPORTED_DEVICES += mt7620a_mt7610e
endef

define Device/ralink_mt7620a-v22sg-evb
  SOC := mt7620a
  IMAGE_SIZE := 130560k
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := MT7620a V22SG
  SUPPORTED_DEVICES += mt7620a_v22sg
endef

define Device/ravpower_rp-wd03
  $(DeviceCommon/sunvalley_filehub)
  DEVICE_VENDOR := RAVPower
  DEVICE_MODEL := RP-WD03
  SUPPORTED_DEVICES += ravpower,wd03
  DEVICE_COMPAT_VERSION := 2.0
  DEVICE_COMPAT_MESSAGE := Partition design has changed compared to older versions (up to 19.07) due to kernel size restrictions. \
	Upgrade via sysupgrade mechanism is not possible, so new installation via TFTP is required.
endef

define Device/sanlinking_d240
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := Sanlinking Technologies
  DEVICE_MODEL := D240
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci kmod-sdhci-mt7620
  SUPPORTED_DEVICES += d240
endef

define Device/sercomm_na930
  SOC := mt7620a
  IMAGE_SIZE := 20480k
  DEVICE_VENDOR := Sercomm
  DEVICE_MODEL := NA930
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += na930
endef

define Device/sitecom_wlr-4100-v1-002
  SOC := mt7620a
  BLOCKSIZE := 4k
  IMAGE_SIZE := 7744k
  IMAGES += factory.dlf
  IMAGE/factory.dlf := $$(sysupgrade_bin) | check-size | \
	senao-header -r 0x0222 -p 0x104A -t 2
  DEVICE_VENDOR := Sitecom
  DEVICE_MODEL := WLR-4100
  DEVICE_VARIANT := v1 002
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci uboot-envtools
endef

define Device/snr_cpe-w4n-mt
  $(DeviceCommon/uimage-lzma-loader)
  SOC := mt7620n
  IMAGE_SIZE := 7360k
  DEVICE_VENDOR := SNR
  DEVICE_MODEL := CPE-W4N
  DEVICE_VARIANT := MT
  UIMAGE_NAME := SNR-CPE-W4N-MT
endef

define Device/tplink_archer-c20i
  $(DeviceCommon/tplink-v2)
  SOC := mt7620a
  IMAGE_SIZE := 7808k
  TPLINK_FLASHLAYOUT := 8Mmtk
  TPLINK_HWID := 0xc2000001
  TPLINK_HWREV := 58
  DEVICE_MODEL := Archer C20i
  DEVICE_PACKAGES := kmod-mt76x0e kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += c20i
endef

define Device/tplink_archer-c20-v1
  $(DeviceCommon/tplink-v2)
  SOC := mt7620a
  IMAGE_SIZE := 7808k
  SUPPORTED_DEVICES += tplink,c20-v1
  TPLINK_FLASHLAYOUT := 8Mmtk
  TPLINK_HWID := 0xc2000001
  TPLINK_HWREV := 0x44
  TPLINK_HWREVADD := 0x1
  IMAGES := sysupgrade.bin
  DEVICE_MODEL := Archer C20
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-mt76x0e kmod-usb2 kmod-usb-ohci \
	kmod-usb-ledtrig-usbport
endef

define Device/tplink_archer-c2-v1
  $(DeviceCommon/tplink-v2)
  SOC := mt7620a
  IMAGE_SIZE := 7808k
  SUPPORTED_DEVICES += tplink,c2-v1
  TPLINK_FLASHLAYOUT := 8Mmtk
  TPLINK_HWID := 0xc7500001
  TPLINK_HWREV := 50
  IMAGES := sysupgrade.bin
  DEVICE_MODEL := Archer C2
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-mt76x0e kmod-usb2 kmod-usb-ohci \
	kmod-usb-ledtrig-usbport kmod-switch-rtl8366-smi kmod-switch-rtl8367b
endef

define Device/tplink_archer-c50-v1
  $(DeviceCommon/tplink-v2)
  SOC := mt7620a
  IMAGE_SIZE := 7808k
  TPLINK_FLASHLAYOUT := 8Mmtk
  TPLINK_HWID := 0xc7500001
  TPLINK_HWREV := 69
  IMAGES := sysupgrade.bin factory-us.bin factory-eu.bin
  IMAGE/factory-us.bin := tplink-v2-image -e -w 0
  IMAGE/factory-eu.bin := tplink-v2-image -e -w 2
  DEVICE_MODEL := Archer C50
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += c50
endef

define Device/tplink_archer-mr200
  $(DeviceCommon/tplink-v2)
  SOC := mt7620a
  IMAGE_SIZE := 7872k
  TPLINK_FLASHLAYOUT := 8MLmtk
  TPLINK_HWID := 0xd7500001
  TPLINK_HWREV := 0x4a
  IMAGES := sysupgrade.bin
  DEVICE_PACKAGES := kmod-mt76x0e kmod-usb2 kmod-usb-net-rndis \
	kmod-usb-serial-option adb-enablemodem
  DEVICE_MODEL := Archer MR200
  SUPPORTED_DEVICES += mr200
endef

define Device/tplink_re200-v1
  $(DeviceCommon/tplink-v1)
  SOC := mt7620a
  DEVICE_MODEL := RE200
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-mt76x0e
  IMAGE_SIZE := 7936k
  TPLINK_HWID := 0x02000001
  TPLINK_FLASHLAYOUT := 8Mmtk
endef

define Device/tplink_re210-v1
  $(DeviceCommon/tplink-v1)
  SOC := mt7620a
  DEVICE_MODEL := RE210
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-mt76x0e
  IMAGE_SIZE := 7936k
  TPLINK_HWID := 0x02100001
  TPLINK_FLASHLAYOUT := 8Mmtk
endef

define Device/trendnet_tew-810dr
  SOC := mt7620a
  DEVICE_PACKAGES := kmod-mt76x0e
  DEVICE_VENDOR := TRENDnet
  DEVICE_MODEL := TEW-810DR
  IMAGE_SIZE := 6720k
endef

define Device/vonets_var11n-300
  SOC := mt7620n
  IMAGE_SIZE := 3776k
  BLOCKSIZE := 4k
  DEVICE_VENDOR := Vonets
  DEVICE_MODEL := VAR11N-300
  DEFAULT := n
endef

define Device/wavlink_wl-wn530hg4
  SOC := mt7620a
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := Wavlink
  DEVICE_MODEL := WL-WN530HG4
  DEVICE_PACKAGES := kmod-mt76x2
endef

define Device/wavlink_wl-wn535k1
  SOC := mt7620a
  IMAGE_SIZE := 7360k
  DEVICE_VENDOR := Wavlink
  DEVICE_MODEL := WL-WN535K1
  DEVICE_ALT0_VENDOR := Talius
  DEVICE_ALT0_MODEL := TAL-WMESH1
  KERNEL_INITRAMFS_SUFFIX := -WN535K1$$(KERNEL_SUFFIX)
  DEVICE_PACKAGES := kmod-mt76x2 kmod-phy-realtek
endef

define Device/wavlink_wl-wn579x3
  SOC := mt7620a
  IMAGE_SIZE := 7744k
  DEVICE_VENDOR := Wavlink
  DEVICE_MODEL := WL-WN579X3
  DEVICE_PACKAGES := kmod-mt76x2 kmod-phy-realtek
endef

define Device/wevo_air-duo
  SOC := mt7620a
  IMAGE_SIZE := 15040k
  UIMAGE_NAME := AIR DUO(0.0.0)
  KERNEL_INITRAMFS_SUFFIX := .upload
  DEVICE_VENDOR := WeVO
  DEVICE_MODEL := AIR DUO
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci kmod-usb-storage-uas
endef

define Device/wrtnode_wrtnode
  SOC := mt7620n
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := WRTNode
  DEVICE_MODEL := WRTNode
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += wrtnode
endef

define Device/xiaomi_miwifi-mini
  SOC := mt7620a
  IMAGE_SIZE := 15872k
  DEVICE_VENDOR := Xiaomi
  DEVICE_MODEL := MiWiFi Mini
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += miwifi-mini
endef

define Device/youku_x2
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := Youku
  DEVICE_MODEL := X2
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci \
	kmod-sdhci-mt7620 kmod-usb-ledtrig-usbport
  UIMAGE_MAGIC := 0x12291000
  UIMAGE_NAME := 400000000000000000001000
endef

define Device/youku_yk-l1
  SOC := mt7620a
  IMAGE_SIZE := 32448k
  DEVICE_VENDOR := Youku
  DEVICE_MODEL := YK-L1
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-sdhci-mt7620 \
	kmod-usb-ledtrig-usbport
  SUPPORTED_DEVICES += youku-yk1 youku,yk1
  UIMAGE_MAGIC := 0x12291000
  UIMAGE_NAME := 400000000000000000000000
endef

define Device/youku_yk-l1c
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := Youku
  DEVICE_MODEL := YK-L1c
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-sdhci-mt7620 \
	kmod-usb-ledtrig-usbport
  UIMAGE_MAGIC := 0x12291000
  UIMAGE_NAME := 400000000000000000000000
endef

define Device/yukai_bocco
  SOC := mt7620a
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := YUKAI Engineering
  DEVICE_MODEL := BOCCO
  DEVICE_PACKAGES := kmod-sound-core kmod-sound-mt7620 kmod-i2c-ralink
  SUPPORTED_DEVICES += bocco
endef

define Device/zbtlink_zbt-ape522ii
  SOC := mt7620a
  IMAGE_SIZE := 15872k
  DEVICE_VENDOR := Zbtlink
  DEVICE_MODEL := ZBT-APE522II
  DEVICE_PACKAGES := kmod-mt76x2
  SUPPORTED_DEVICES += zbt-ape522ii
endef

define Device/zbtlink_zbt-cpe102
  SOC := mt7620n
  IMAGE_SIZE := 7552k
  DEVICE_VENDOR := Zbtlink
  DEVICE_MODEL := ZBT-CPE102
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += zbt-cpe102
endef

define Device/zbtlink_zbt-wa05
  SOC := mt7620n
  IMAGE_SIZE := 7552k
  DEVICE_VENDOR := Zbtlink
  DEVICE_MODEL := ZBT-WA05
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += zbt-wa05
endef

define Device/zbtlink_zbt-we1026-5g-16m
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := Zbtlink
  DEVICE_MODEL := ZBT-WE1026-5G
  DEVICE_VARIANT := 16M
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci kmod-sdhci-mt7620
  SUPPORTED_DEVICES += we1026-5g-16m zbtlink,we1026-5g-16m
endef

define Device/zbtlink_zbt-we1026-h-32m
  SOC := mt7620a
  IMAGE_SIZE := 32448k
  DEVICE_VENDOR := Zbtlink
  DEVICE_MODEL := ZBT-WE1026-H
  DEVICE_VARIANT := 32M
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-sdhci-mt7620
endef

define Device/zbtlink_zbt-we2026
  SOC := mt7620n
  IMAGE_SIZE := 7552k
  DEVICE_VENDOR := Zbtlink
  DEVICE_MODEL := ZBT-WE2026
  SUPPORTED_DEVICES += zbt-we2026
endef

define Device/zbtlink_zbt-we826-16m
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := Zbtlink
  DEVICE_MODEL := ZBT-WE826
  DEVICE_VARIANT := 16M
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci kmod-sdhci-mt7620
  SUPPORTED_DEVICES += zbt-we826 zbt-we826-16M
endef

define Device/zbtlink_zbt-we826-32m
  SOC := mt7620a
  IMAGE_SIZE := 32448k
  DEVICE_VENDOR := Zbtlink
  DEVICE_MODEL := ZBT-WE826
  DEVICE_VARIANT := 32M
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci kmod-sdhci-mt7620
  SUPPORTED_DEVICES += zbt-we826-32M
endef

define Device/zbtlink_zbt-we826-e
  SOC := mt7620a
  IMAGE_SIZE := 32448k
  DEVICE_VENDOR := Zbtlink
  DEVICE_MODEL := ZBT-WE826-E
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-sdhci-mt7620 uqmi \
	kmod-usb-serial-option
endef

define Device/zbtlink_zbt-wr8305rt
  SOC := mt7620n
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := Zbtlink
  DEVICE_MODEL := ZBT-WR8305RT
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += zbt-wr8305rt
endef

define Device/zte_q7
  SOC := mt7620a
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := ZTE
  DEVICE_MODEL := Q7
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += zte-q7
endef

define Device/zyxel_keenetic-omni
  SOC := mt7620n
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := ZyXEL
  DEVICE_MODEL := Keenetic Omni
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport
  IMAGES += factory.bin
  IMAGE/factory.bin := $$(sysupgrade_bin) | pad-to 64k | check-size | \
	zyimage -d 4882 -v "ZyXEL Keenetic Omni"
  SUPPORTED_DEVICES += kn_rc
endef

define Device/zyxel_keenetic-omni-ii
  SOC := mt7620n
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := ZyXEL
  DEVICE_MODEL := Keenetic Omni II
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport
  IMAGES += factory.bin
  IMAGE/factory.bin := $$(sysupgrade_bin) | pad-to 64k | check-size | \
	zyimage -d 2102034 -v "ZyXEL Keenetic Omni II"
  SUPPORTED_DEVICES += kn_rf
endef

define Device/zyxel_keenetic-viva
  SOC := mt7620a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := ZyXEL
  DEVICE_MODEL := Keenetic Viva
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport \
	kmod-switch-rtl8366-smi kmod-switch-rtl8367b
  IMAGES += factory.bin
  IMAGE/factory.bin := $$(sysupgrade_bin) | pad-to 64k | check-size | \
	zyimage -d 8997 -v "ZyXEL Keenetic Viva"
  SUPPORTED_DEVICES += kng_rc
endef
