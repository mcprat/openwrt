#
# MT76x8 Profiles
#

include ./common-tp-link.mk

DEFAULT_SOC := mt7628an

define Build/elecom-header
	$(eval model_id=$(1))
	( \
		fw_size="$$(printf '%08x' $$(stat -c%s $@))"; \
		echo -ne "$$(echo "031d6129$${fw_size}06000000$(model_id)" | \
			sed 's/../\\x&/g')"; \
		dd if=/dev/zero bs=92 count=1; \
		data_crc="$$(dd if=$@ | gzip -c | tail -c 8 | \
			od -An -N4 -tx4 --endian little | tr -d ' \n')"; \
		echo -ne "$$(echo "$${data_crc}00000000" | sed 's/../\\x&/g')"; \
		dd if=$@; \
	) > $@.new
	mv $@.new $@
endef

define Build/ravpower-wd009-factory
	mkimage -A mips -T standalone -C none -a 0x80010000 -e 0x80010000 \
		-n "OpenWrt Bootloader" -d $(UBOOT_PATH) $@.new
	cat $@ >> $@.new
	@mv $@.new $@
endef


define Device/alfa-network_awusfree1
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := ALFA Network
  DEVICE_MODEL := AWUSFREE1
  DEVICE_PACKAGES := uboot-envtools
  SUPPORTED_DEVICES += awusfree1
endef

define Device/asus_rt-ac1200
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := ASUS
  DEVICE_MODEL := RT-AC1200
  DEVICE_ALT0_VENDOR := ASUS
  DEVICE_ALT0_MODEL := RT-N600
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci \
	kmod-usb-ledtrig-usbport
endef

define Device/asus_rt-ac1200-v2
  BLOCKSIZE := 64k
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := ASUS
  DEVICE_MODEL := RT-AC1200
  DEVICE_VARIANT := V2
  IMAGES += factory.bin
  IMAGE/factory.bin := append-kernel | pad-to $$$$(BLOCKSIZE) | \
	append-rootfs | pad-rootfs
  DEVICE_PACKAGES := kmod-mt7615e kmod-mt7663-firmware-ap
endef

define Device/asus_rt-n10p-v3
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := ASUS
  DEVICE_MODEL := RT-N10P
  DEVICE_VARIANT := V3
endef

define Device/asus_rt-n11p-b1
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := ASUS
  DEVICE_MODEL := RT-N11P
  DEVICE_VARIANT := B1
  DEVICE_ALT0_VENDOR := ASUS
  DEVICE_ALT0_MODEL := RT-N12+
  DEVICE_ALT0_VARIANT := B1
  DEVICE_ALT1_VENDOR := ASUS
  DEVICE_ALT1_MODEL := RT-N300
  DEVICE_ALT1_VARIANT := B1
endef

define Device/asus_rt-n12-vp-b1
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := ASUS
  DEVICE_MODEL := RT-N12 VP
  DEVICE_VARIANT := B1
endef

define Device/buffalo_wcr-1166ds
  IMAGE_SIZE := 7936k
  BUFFALO_TAG_PLATFORM := MTK
  BUFFALO_TAG_VERSION := 9.99
  BUFFALO_TAG_MINOR := 9.99
  IMAGES += factory.bin
  IMAGE/sysupgrade.bin := trx -M 0x746f435c | pad-rootfs | append-metadata
  IMAGE/factory.bin := trx -M 0x746f435c | pad-rootfs | append-metadata | \
	buffalo-enc WCR-1166DS $$(BUFFALO_TAG_VERSION) -l | \
	buffalo-tag-dhp WCR-1166DS JP JP | buffalo-enc-tag -l | buffalo-dhp-image
  DEVICE_VENDOR := Buffalo
  DEVICE_MODEL := WCR-1166DS
  DEVICE_PACKAGES := kmod-mt76x2
  SUPPORTED_DEVICES += wcr-1166ds
endef

define Device/comfast_cf-wr617ac
  IMAGE_SIZE := 7872k
  DTS := CF-WR617AC
  DEVICE_VENDOR := Comfast
  DEVICE_MODEL := CF-WR617AC
  DEVICE_PACKAGES := kmod-mt76x2 kmod-rt2800-pci
endef

define Device/Common/comfast_cf-wr758ac
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := COMFAST
  DEVICE_MODEL := CF-WR758AC
  DEVICE_ALT0_VENDOR := Joowin
  DEVICE_ALT0_MODEL := JW-WR758AC
endef

define Device/comfast_cf-wr758ac-v1
  $(Device/Common/comfast_cf-wr758ac)
  DEVICE_PACKAGES := kmod-mt76x2
  DEVICE_VARIANT := V1
  DEVICE_ALT0_VARIANT := V1
  SUPPORTED_DEVICES += joowin,jw-wr758ac-v1
endef

define Device/comfast_cf-wr758ac-v2
  $(Device/Common/comfast_cf-wr758ac)
  DEVICE_PACKAGES := kmod-mt7615e kmod-mt7663-firmware-ap
  DEVICE_VARIANT := V2
  DEVICE_ALT0_VARIANT := V2
  SUPPORTED_DEVICES += joowin,jw-wr758ac-v2
endef

define Device/cudy_wr1000
  IMAGE_SIZE := 7872k
  IMAGES += factory.bin
  IMAGE/factory.bin := $$(sysupgrade_bin) | check-size | jcg-header 92.122
  JCG_MAXSIZE := 7872k
  DEVICE_VENDOR := Cudy
  DEVICE_MODEL := WR1000
  DEVICE_PACKAGES := kmod-mt76x2
  SUPPORTED_DEVICES += wr1000
endef

define Device/d-team_pbr-d1
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := PandoraBox
  DEVICE_MODEL := PBR-D1
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += pbr-d1
endef

define Device/dlink_dap-1325-a1
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := D-Link
  DEVICE_MODEL := DAP-1325 A1
endef

define Device/duzun_dm06
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := DuZun
  DEVICE_MODEL := DM06
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport
  SUPPORTED_DEVICES += duzun-dm06
endef

define Device/elecom_wrc-1167fs
  IMAGE_SIZE := 7360k
  DEVICE_VENDOR := ELECOM
  DEVICE_MODEL := WRC-1167FS
  IMAGES += factory.bin
  IMAGE/factory.bin := $$(sysupgrade_bin) | pad-to 64k | check-size | \
	xor-image -p 29944A25 -x | elecom-header 00228000 | \
	elecom-product-header WRC-1167FS
  DEVICE_PACKAGES := kmod-mt76x2
endef

define Device/glinet_gl-mt300n-v2
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := GL.iNet
  DEVICE_MODEL := GL-MT300N
  DEVICE_VARIANT := V2
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += gl-mt300n-v2
endef

define Device/glinet_microuter-n300
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := GL.iNet
  DEVICE_MODEL := microuter-N300
  SUPPORTED_DEVICES += microuter-n300
endef

define Device/glinet_vixmini
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := GL.iNet
  DEVICE_MODEL := VIXMINI
  SUPPORTED_DEVICES += vixmini
endef

define Device/hak5_wifi-pineapple-mk7
  IMAGE_SIZE := 32448k
  DEVICE_VENDOR := Hak5
  DEVICE_MODEL := WiFi Pineapple Mark 7
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += wifi-pineapple-mk7
endef

define Device/hilink_hlk-7628n
  IMAGE_SIZE := 32448k
  DEVICE_VENDOR := HILINK
  DEVICE_MODEL := HLK-7628N
endef

define Device/hilink_hlk-7688a
  IMAGE_SIZE := 32448k
  DEVICE_VENDOR := Hi-Link
  DEVICE_MODEL := HLK-7688A
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport
endef

define Device/hiwifi_hc5611
  IMAGE_SIZE := 15808k
  DEVICE_VENDOR := HiWiFi
  DEVICE_MODEL := HC5611
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
endef

define Device/hiwifi_hc5661a
  IMAGE_SIZE := 15808k
  DEVICE_VENDOR := HiWiFi
  DEVICE_MODEL := HC5661A
  SUPPORTED_DEVICES += hc5661a
endef

define Device/hiwifi_hc5761a
  IMAGE_SIZE := 15808k
  DEVICE_VENDOR := HiWiFi
  DEVICE_MODEL := HC5761A
  DEVICE_PACKAGES := kmod-mt76x0e kmod-usb2 kmod-usb-ohci
endef

define Device/hiwifi_hc5861b
  IMAGE_SIZE := 15808k
  DEVICE_VENDOR := HiWiFi
  DEVICE_MODEL := HC5861B
  DEVICE_PACKAGES := kmod-mt76x2
endef

define Device/iptime_a3
  IMAGE_SIZE := 7936k
  UIMAGE_NAME := a3
  DEVICE_VENDOR := ipTIME
  DEVICE_MODEL := A3
  DEVICE_PACKAGES := kmod-mt76x2
endef

define Device/iptime_a604m
  IMAGE_SIZE := 7936k
  UIMAGE_NAME := a604m
  DEVICE_VENDOR := ipTIME
  DEVICE_MODEL := A604M
  DEVICE_PACKAGES := kmod-mt76x2
endef

define Device/Common/jotale_js76x8
  DEVICE_VENDOR := Jotale
  DEVICE_MODEL := JS76x8
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
endef

define Device/jotale_js76x8-8m
  $(Device/Common/jotale_js76x8)
  IMAGE_SIZE := 7872k
  DEVICE_VARIANT := 8M
endef

define Device/jotale_js76x8-16m
  $(Device/Common/jotale_js76x8)
  IMAGE_SIZE := 16064k
  DEVICE_VARIANT := 16M
endef

define Device/jotale_js76x8-32m
  $(Device/Common/jotale_js76x8)
  IMAGE_SIZE := 32448k
  DEVICE_VARIANT := 32M
endef

define Device/keenetic_kn-1613
  BLOCKSIZE := 64k
  IMAGE_SIZE := 31488k
  DEVICE_VENDOR := Keenetic
  DEVICE_MODEL := KN-1613
  DEVICE_PACKAGES := kmod-mt7615e kmod-mt7663-firmware-ap
  IMAGES += factory.bin
  IMAGE/factory.bin := $$(sysupgrade_bin) | pad-to $$$$(BLOCKSIZE) | \
	check-size | zyimage -d 0x801613 -v "KN-1613"
endef

define Device/kroks_kndrt31r16
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := Kroks
  DEVICE_MODEL := Rt-Cse5 UW DRSIM
  DEVICE_ALT0_VENDOR := Kroks
  DEVICE_ALT0_MODEL := KNdRt31R16
  DEVICE_PACKAGES := kmod-usb2
  SUPPORTED_DEVICES += kndrt31r16
endef

define Device/kroks_kndrt31r19
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := Kroks
  DEVICE_MODEL := Rt-Pot mXw DS RSIM
  DEVICE_ALT0_VENDOR := Kroks
  DEVICE_ALT0_MODEL := KNdRt31R19
  DEVICE_PACKAGES := kmod-usb2 uqmi
  SUPPORTED_DEVICES += kndrt31r19
endef

define Device/linksys_e5400
  IMAGE_SIZE := 16000k
  DEVICE_VENDOR := Linksys
  DEVICE_MODEL := E5400
  DEVICE_ALT0_VENDOR := Linksys
  DEVICE_ALT0_MODEL := E2500
  DEVICE_ALT0_VARIANT := v4
  DEVICE_ALT1_VENDOR := Linksys
  DEVICE_ALT1_MODEL := E5300
  DEVICE_ALT2_VENDOR := Linksys
  DEVICE_ALT2_MODEL := E5350
  DEVICE_PACKAGES := kmod-mt76x2
endef

define Device/mediatek_linkit-smart-7688
  IMAGE_SIZE := 32448k
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := LinkIt Smart 7688
  DEVICE_PACKAGES:= kmod-usb2 kmod-usb-ohci uboot-envtools kmod-sdhci-mt7620
  SUPPORTED_DEVICES += linkits7688 linkits7688d
endef

define Device/mediatek_mt7628an-eval-board
  BLOCKSIZE := 64k
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := MT7628 EVB
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport
  SUPPORTED_DEVICES += mt7628
endef

define Device/mercury_mac1200r-v2
  IMAGE_SIZE := 7936k
  DEVICE_VENDOR := Mercury
  DEVICE_MODEL := MAC1200R
  DEVICE_VARIANT := v2.0
  DEVICE_PACKAGES := kmod-mt76x2
  SUPPORTED_DEVICES += mac1200rv2
endef

define Device/minew_g1-c
  IMAGE_SIZE := 15744k
  DEVICE_VENDOR := Minew
  DEVICE_MODEL := G1-C
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport kmod-usb-serial-cp210x
  SUPPORTED_DEVICES += minew-g1c
endef

define Device/motorola_mwr03
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := Motorola
  DEVICE_MODEL := MWR03
  DEVICE_PACKAGES := kmod-mt76x2
endef

define Device/netgear_r6020
  $(Device/Common/netgear_sercomm_nor)
  IMAGE_SIZE := 7104k
  DEVICE_MODEL := R6020
  DEVICE_PACKAGES := kmod-mt76x2
  SERCOMM_HWNAME := R6020
  SERCOMM_HWID := CFR
  SERCOMM_HWVER := A001
  SERCOMM_SWVER := 0x0040
  SERCOMM_PAD := 576k
endef

define Device/netgear_r6080
  $(Device/Common/netgear_sercomm_nor)
  IMAGE_SIZE := 7552k
  DEVICE_MODEL := R6080
  DEVICE_PACKAGES := kmod-mt76x2
  SERCOMM_HWNAME := R6080
  SERCOMM_HWID := CFR
  SERCOMM_HWVER := A001
  SERCOMM_SWVER := 0x0040
  SERCOMM_PAD := 576k
endef

define Device/netgear_r6120
  $(Device/Common/netgear_sercomm_nor)
  IMAGE_SIZE := 15744k
  DEVICE_MODEL := R6120
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci
  SERCOMM_HWNAME := R6120
  SERCOMM_HWID := CGQ
  SERCOMM_HWVER := A001
  SERCOMM_SWVER := 0x0040
  SERCOMM_PAD := 576k
endef

define Device/onion_omega2
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := Onion
  DEVICE_MODEL := Omega2
  DEVICE_PACKAGES:= kmod-usb2 kmod-usb-ohci uboot-envtools
  SUPPORTED_DEVICES += omega2
endef

define Device/onion_omega2p
  IMAGE_SIZE := 32448k
  DEVICE_VENDOR := Onion
  DEVICE_MODEL := Omega2+
  DEVICE_PACKAGES:= kmod-usb2 kmod-usb-ohci uboot-envtools kmod-sdhci-mt7620
  SUPPORTED_DEVICES += omega2p
endef

define Device/rakwireless_rak633
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := Rakwireless
  DEVICE_MODEL := RAK633
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
endef

define Device/ravpower_rp-wd009
  IMAGE_SIZE := 14272k
  DEVICE_VENDOR := RAVPower
  DEVICE_MODEL := RP-WD009
  UBOOT_PATH := $(STAGING_DIR_IMAGE)/ravpower_rp-wd009-u-boot.bin
  DEVICE_PACKAGES := kmod-mt76x0e kmod-usb2 kmod-usb-ohci \
	kmod-sdhci-mt7620 kmod-i2c-mt7628 ravpower-mcu
  IMAGES += factory.bin
  IMAGE/factory.bin := $$(sysupgrade_bin) | ravpower-wd009-factory
endef

define Device/skylab_skw92a
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := Skylab
  DEVICE_MODEL := SKW92A
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
endef

define Device/tama_w06
  IMAGE_SIZE := 15040k
  DEVICE_VENDOR := Tama
  DEVICE_MODEL := W06
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
endef

define Device/totolink_a3
  IMAGE_SIZE := 7936k
  UIMAGE_NAME := za3
  DEVICE_VENDOR := TOTOLINK
  DEVICE_MODEL := A3
  DEVICE_PACKAGES := kmod-mt76x2
endef

define Device/totolink_lr1200
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := TOTOLINK
  DEVICE_MODEL := LR1200
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 uqmi
endef

define Device/tplink_archer-c20-v4
  $(Device/Common/tplink-v2)
  IMAGE_SIZE := 7808k
  DEVICE_MODEL := Archer C20
  DEVICE_VARIANT := v4
  TPLINK_FLASHLAYOUT := 8Mmtk
  TPLINK_HWID := 0xc200004
  TPLINK_HWREVADD := 0x4
  DEVICE_PACKAGES := kmod-mt76x0e
  IMAGES := sysupgrade.bin tftp-recovery.bin
  IMAGE/tftp-recovery.bin := pad-extra 128k | $$(IMAGE/factory.bin)
  SUPPORTED_DEVICES += tplink,c20-v4
endef

define Device/tplink_archer-c20-v5
  $(Device/Common/tplink-v2)
  IMAGE_SIZE := 7616k
  DEVICE_MODEL := Archer C20
  DEVICE_VARIANT := v5
  TPLINK_FLASHLAYOUT := 8MSUmtk
  TPLINK_HWID := 0xc200005
  TPLINK_HWREVADD := 0x5
  DEVICE_PACKAGES := kmod-mt76x0e
  IMAGES := sysupgrade.bin
endef

define Device/tplink_archer-c50-v3
  $(Device/Common/tplink-v2)
  IMAGE_SIZE := 7808k
  DEVICE_MODEL := Archer C50
  DEVICE_VARIANT := v3
  TPLINK_FLASHLAYOUT := 8Mmtk
  TPLINK_HWID := 0x001D9BA4
  TPLINK_HWREV := 0x79
  TPLINK_HWREVADD := 0x1
  DEVICE_PACKAGES := kmod-mt76x2
  IMAGES := sysupgrade.bin tftp-recovery.bin
  IMAGE/tftp-recovery.bin := pad-extra 128k | $$(IMAGE/factory.bin)
  SUPPORTED_DEVICES += tplink,c50-v3
endef

define Device/tplink_archer-c50-v4
  $(Device/Common/tplink-v2)
  IMAGE_SIZE := 7616k
  DEVICE_MODEL := Archer C50
  DEVICE_VARIANT := v4
  TPLINK_FLASHLAYOUT := 8MSUmtk
  TPLINK_HWID := 0x001D589B
  TPLINK_HWREV := 0x93
  TPLINK_HWREVADD := 0x2
  DEVICE_PACKAGES := kmod-mt76x2
  IMAGES := sysupgrade.bin
  SUPPORTED_DEVICES += tplink,c50-v4
endef

define Device/tplink_re200-v2
  $(Device/Common/tplink-safeloader)
  IMAGE_SIZE := 7808k
  DEVICE_MODEL := RE200
  DEVICE_VARIANT := v2
  DEVICE_PACKAGES := kmod-mt76x0e
  TPLINK_BOARD_ID := RE200-V2
endef

define Device/tplink_re200-v3
  $(Device/Common/tplink-safeloader)
  IMAGE_SIZE := 7808k
  DEVICE_MODEL := RE200
  DEVICE_VARIANT := v3
  DEVICE_PACKAGES := kmod-mt76x0e
  TPLINK_BOARD_ID := RE200-V3
endef

define Device/tplink_re200-v4
  $(Device/Common/tplink-safeloader)
  IMAGE_SIZE := 7808k
  DEVICE_MODEL := RE200
  DEVICE_VARIANT := v4
  DEVICE_PACKAGES := kmod-mt76x0e
  TPLINK_BOARD_ID := RE200-V4
endef

define Device/tplink_re220-v2
  $(Device/Common/tplink-safeloader)
  IMAGE_SIZE := 7808k
  DEVICE_MODEL := RE220
  DEVICE_VARIANT := v2
  DEVICE_PACKAGES := kmod-mt76x0e
  TPLINK_BOARD_ID := RE220-V2
endef

define Device/tplink_re305-v1
  $(Device/Common/tplink-safeloader)
  IMAGE_SIZE := 6016k
  DEVICE_MODEL := RE305
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-mt76x2
  TPLINK_BOARD_ID := RE305-V1
endef

define Device/tplink_re305-v3
  $(Device/Common/tplink-safeloader)
  IMAGE_SIZE := 7808k
  DEVICE_MODEL := RE305
  DEVICE_VARIANT := v3
  DEVICE_PACKAGES := kmod-mt76x2
  TPLINK_BOARD_ID := RE305-V3
endef

define Device/tplink_tl-mr3020-v3
  $(Device/Common/tplink-v2)
  IMAGE_SIZE := 7808k
  DEVICE_MODEL := TL-MR3020
  DEVICE_VARIANT := v3
  TPLINK_FLASHLAYOUT := 8Mmtk
  TPLINK_HWID := 0x30200003
  TPLINK_HWREV := 0x3
  TPLINK_HWREVADD := 0x3
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport
  IMAGES := sysupgrade.bin tftp-recovery.bin
  IMAGE/tftp-recovery.bin := pad-extra 128k | $$(IMAGE/factory.bin)
endef

define Device/tplink_tl-mr3420-v5
  $(Device/Common/tplink-v2)
  IMAGE_SIZE := 7808k
  DEVICE_MODEL := TL-MR3420
  DEVICE_VARIANT := v5
  TPLINK_FLASHLAYOUT := 8Mmtk
  TPLINK_HWID := 0x34200005
  TPLINK_HWREV := 0x5
  TPLINK_HWREVADD := 0x5
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport
  IMAGES := sysupgrade.bin tftp-recovery.bin
  IMAGE/tftp-recovery.bin := pad-extra 128k | $$(IMAGE/factory.bin)
endef

define Device/tplink_tl-mr6400-v4
  $(Device/Common/tplink-v2)
  IMAGE_SIZE := 7808k
  DEVICE_MODEL := TL-MR6400
  DEVICE_VARIANT := v4
  TPLINK_FLASHLAYOUT := 8Mmtk
  TPLINK_HWID := 0x64000004
  TPLINK_HWREV := 0x4
  TPLINK_HWREVADD := 0x4
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport \
	kmod-usb-serial-option kmod-usb-net-qmi-wwan uqmi
  IMAGES := sysupgrade.bin tftp-recovery.bin
  IMAGE/tftp-recovery.bin := pad-extra 128k | $$(IMAGE/factory.bin)
endef

define Device/tplink_tl-mr6400-v5
  $(Device/Common/tplink-v2)
  IMAGE_SIZE := 7808k
  DEVICE_MODEL := TL-MR6400
  DEVICE_VARIANT := v5
  TPLINK_FLASHLAYOUT := 8Mmtk
  TPLINK_HWID := 0x64000005
  TPLINK_HWREV := 0x5
  TPLINK_HWREVADD := 0x5
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport \
	kmod-usb-serial-option kmod-usb-net-qmi-wwan uqmi
  IMAGES := sysupgrade.bin tftp-recovery.bin
  IMAGE/tftp-recovery.bin := pad-extra 128k | $$(IMAGE/factory.bin)
endef

define Device/tplink_tl-wa801nd-v5
  $(Device/Common/tplink-v2)
  IMAGE_SIZE := 7808k
  DEVICE_MODEL := TL-WA801ND
  DEVICE_VARIANT := v5
  TPLINK_FLASHLAYOUT := 8Mmtk
  TPLINK_HWID := 0x08010005
  TPLINK_HWREVADD := 0x5
  IMAGES := sysupgrade.bin tftp-recovery.bin
  IMAGE/tftp-recovery.bin := pad-extra 128k | $$(IMAGE/factory.bin)
endef

define Device/tplink_tl-wr802n-v4
  $(Device/Common/tplink-v2)
  IMAGE_SIZE := 7808k
  DEVICE_MODEL := TL-WR802N
  DEVICE_VARIANT := v4
  TPLINK_FLASHLAYOUT := 8Mmtk
  TPLINK_HWID := 0x08020004
  TPLINK_HWREVADD := 0x4
  IMAGES := sysupgrade.bin tftp-recovery.bin
  IMAGE/tftp-recovery.bin := pad-extra 128k | $$(IMAGE/factory.bin)
endef

define Device/tplink_tl-wr840n-v4
  $(Device/Common/tplink-v2)
  IMAGE_SIZE := 7808k
  DEVICE_MODEL := TL-WR840N
  DEVICE_VARIANT := v4
  TPLINK_FLASHLAYOUT := 8Mmtk
  TPLINK_HWID := 0x08400004
  TPLINK_HWREVADD := 0x4
  IMAGES := sysupgrade.bin tftp-recovery.bin
  IMAGE/tftp-recovery.bin := pad-extra 128k | $$(IMAGE/factory.bin)
  SUPPORTED_DEVICES += tl-wr840n-v4
endef

define Device/tplink_tl-wr840n-v5
  $(Device/Common/tplink-v2)
  IMAGE_SIZE := 3904k
  DEVICE_MODEL := TL-WR840N
  DEVICE_VARIANT := v5
  TPLINK_FLASHLAYOUT := 4Mmtk
  TPLINK_HWID := 0x08400005
  TPLINK_HWREVADD := 0x5
  IMAGES := sysupgrade.bin
  SUPPORTED_DEVICES += tl-wr840n-v5
  DEFAULT := n
endef

define Device/tplink_tl-wr841n-v13
  $(Device/Common/tplink-v2)
  IMAGE_SIZE := 7808k
  DEVICE_MODEL := TL-WR841N
  DEVICE_VARIANT := v13
  TPLINK_FLASHLAYOUT := 8Mmtk
  TPLINK_HWID := 0x08410013
  TPLINK_HWREV := 0x268
  TPLINK_HWREVADD := 0x13
  IMAGES := sysupgrade.bin tftp-recovery.bin
  IMAGE/tftp-recovery.bin := pad-extra 128k | $$(IMAGE/factory.bin)
  SUPPORTED_DEVICES += tl-wr841n-v13
endef

define Device/tplink_tl-wr841n-v14
  $(Device/Common/tplink-v2)
  IMAGE_SIZE := 3968k
  DEVICE_MODEL := TL-WR841N
  DEVICE_VARIANT := v14
  TPLINK_FLASHLAYOUT := 4MLmtk
  TPLINK_HWID := 0x08410014
  TPLINK_HWREVADD := 0x14
  IMAGES := sysupgrade.bin tftp-recovery.bin
  IMAGE/tftp-recovery.bin := pad-extra 64k | $$(IMAGE/factory.bin)
  DEFAULT := n
endef

define Device/tplink_tl-wr842n-v5
  $(Device/Common/tplink-v2)
  IMAGE_SIZE := 7808k
  DEVICE_MODEL := TL-WR842N
  DEVICE_VARIANT := v5
  TPLINK_FLASHLAYOUT := 8Mmtk
  TPLINK_HWID := 0x08420005
  TPLINK_HWREV := 0x5
  TPLINK_HWREVADD := 0x5
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport
  IMAGES := sysupgrade.bin tftp-recovery.bin
  IMAGE/tftp-recovery.bin := pad-extra 128k | $$(IMAGE/factory.bin)
endef

define Device/tplink_tl-wr850n-v2
  $(Device/Common/tplink-v2)
  IMAGE_SIZE := 7808k
  DEVICE_MODEL := TL-WR850N
  DEVICE_VARIANT := v2
  TPLINK_FLASHLAYOUT := 8Mmtk
  TPLINK_HWID := 0x08500002
  TPLINK_HWREVADD := 0x2
  IMAGES := sysupgrade.bin tftp-recovery.bin
  IMAGE/tftp-recovery.bin := pad-extra 128k | $$(IMAGE/factory.bin)
endef

define Device/tplink_tl-wr902ac-v3
  $(Device/Common/tplink-v2)
  IMAGE_SIZE := 7808k
  DEVICE_MODEL := TL-WR902AC
  DEVICE_VARIANT := v3
  TPLINK_FLASHLAYOUT := 8Mmtk
  TPLINK_HWID := 0x000dc88f
  TPLINK_HWREV := 0x89
  TPLINK_HWREVADD := 0x1
  DEVICE_PACKAGES := kmod-mt76x0e kmod-usb2 kmod-usb-ohci \
	kmod-usb-ledtrig-usbport
  IMAGES := sysupgrade.bin tftp-recovery.bin
  IMAGE/tftp-recovery.bin := pad-extra 128k | $$(IMAGE/factory.bin)
endef

define Device/unielec_u7628-01-16m
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := UniElec
  DEVICE_MODEL := U7628-01
  DEVICE_VARIANT := 16M
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport
  SUPPORTED_DEVICES += u7628-01-128M-16M unielec,u7628-01-128m-16m
endef

define Device/vocore_vocore2
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := VoCore
  DEVICE_MODEL := VoCore2
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport \
	kmod-sdhci-mt7620
  SUPPORTED_DEVICES += vocore2
endef

define Device/vocore_vocore2-lite
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := VoCore
  DEVICE_MODEL := VoCore2-Lite
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport \
	kmod-sdhci-mt7620
  SUPPORTED_DEVICES += vocore2lite
endef

define Device/wavlink_wl-wn531a3
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := Wavlink
  DEVICE_MODEL := WL-WN531A3
  DEVICE_ALT0_VENDOR := Wavlink
  DEVICE_ALT0_MODEL := QUANTUM D4
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += wl-wn531a3
endef

define Device/wavlink_wl-wn570ha1
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := Wavlink
  DEVICE_MODEL := WL-WN570HA1
  DEVICE_PACKAGES := kmod-mt76x0e
endef

define Device/wavlink_wl-wn575a3
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := Wavlink
  DEVICE_MODEL := WL-WN575A3
  DEVICE_PACKAGES := kmod-mt76x2
  SUPPORTED_DEVICES += wl-wn575a3
endef

define Device/wavlink_wl-wn576a2
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := Wavlink
  DEVICE_MODEL := WL-WN576A2
  DEVICE_ALT0_VENDOR := Silvercrest
  DEVICE_ALT0_MODEL := SWV 733 B1
  DEVICE_PACKAGES := kmod-mt76x0e
endef

define Device/wavlink_wl-wn577a2
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := Wavlink
  DEVICE_MODEL := WL-WN577A2
  DEVICE_ALT0_VENDOR := Maginon
  DEVICE_ALT0_MODEL := WLR-755
  DEVICE_PACKAGES := kmod-mt76x0e
endef

define Device/wavlink_wl-wn578a2
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := Wavlink
  DEVICE_MODEL := WL-WN578A2
  DEVICE_ALT0_VENDOR := SilverCrest
  DEVICE_ALT0_MODEL := SWV 733 A2
  DEVICE_PACKAGES := kmod-mt76x0e
endef

define Device/widora_neo-16m
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := Widora
  DEVICE_MODEL := Widora-NEO
  DEVICE_VARIANT := 16M
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += widora-neo
endef

define Device/widora_neo-32m
  IMAGE_SIZE := 32448k
  DEVICE_VENDOR := Widora
  DEVICE_MODEL := Widora-NEO
  DEVICE_VARIANT := 32M
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
endef

define Device/wiznet_wizfi630s
  IMAGE_SIZE := 32448k
  DEVICE_VENDOR := WIZnet
  DEVICE_MODEL := WizFi630S
  SUPPORTED_DEVICES += wizfi630s
endef

define Device/wrtnode_wrtnode2p
  IMAGE_SIZE := 32448k
  DEVICE_VENDOR := WRTnode
  DEVICE_MODEL := WRTnode 2P
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci kmod-usb-ledtrig-usbport
  SUPPORTED_DEVICES += wrtnode2p
endef

define Device/wrtnode_wrtnode2r
  IMAGE_SIZE := 32448k
  DEVICE_VENDOR := WRTnode
  DEVICE_MODEL := WRTnode 2R
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ohci
  SUPPORTED_DEVICES += wrtnode2r
endef

define Device/xiaomi_mi-router-4a-100m
  IMAGE_SIZE := 14976k
  DEVICE_VENDOR := Xiaomi
  DEVICE_MODEL := Mi Router 4A
  DEVICE_VARIANT := 100M Edition
  DEVICE_PACKAGES := kmod-mt76x2
  SUPPORTED_DEVICES += xiaomi,mir4a-100m
endef

define Device/xiaomi_mi-router-4a-100m-intl
  IMAGE_SIZE := 14976k
  DEVICE_VENDOR := Xiaomi
  DEVICE_MODEL := Mi Router 4A
  DEVICE_VARIANT := 100M International Edition
  DEVICE_PACKAGES := kmod-mt76x2
  SUPPORTED_DEVICES += xiaomi,mir4a-100m-intl
endef

define Device/xiaomi_mi-router-4c
  IMAGE_SIZE := 14976k
  DEVICE_VENDOR := Xiaomi
  DEVICE_MODEL := Mi Router 4C
  DEVICE_PACKAGES := uboot-envtools
endef

define Device/xiaomi_miwifi-3c
  IMAGE_SIZE := 15104k
  DEVICE_VENDOR := Xiaomi
  DEVICE_MODEL := MiWiFi 3C
  DEVICE_PACKAGES := uboot-envtools
endef

define Device/xiaomi_miwifi-nano
  IMAGE_SIZE := 16064k
  DEVICE_VENDOR := Xiaomi
  DEVICE_MODEL := MiWiFi Nano
  DEVICE_PACKAGES := uboot-envtools
  SUPPORTED_DEVICES += miwifi-nano
endef

define Device/xiaomi_mi-ra75
  IMAGE_SIZE := 14976k
  DEVICE_VENDOR := Xiaomi
  DEVICE_MODEL := MiWiFi Range Extender AC1200 
  DEVICE_VARIANT := RA75
  DEVICE_PACKAGES := kmod-mt76x2
  SUPPORTED_DEVICES += xiaomi,mira75
endef

define Device/zbtlink_zbt-we1226
  IMAGE_SIZE := 7872k
  DEVICE_VENDOR := Zbtlink
  DEVICE_MODEL := ZBT-WE1226
endef

define Device/zyxel_keenetic-extra-ii
  IMAGE_SIZE := 29824k
  BLOCKSIZE := 64k
  DEVICE_VENDOR := ZyXEL
  DEVICE_MODEL := Keenetic Extra II
  DEVICE_PACKAGES := kmod-mt76x2 kmod-usb2 kmod-usb-ohci \
	kmod-usb-ledtrig-usbport
  IMAGES += factory.bin
  IMAGE/factory.bin := $$(sysupgrade_bin) | pad-to $$$$(BLOCKSIZE) | \
	check-size | zyimage -d 6162 -v "ZyXEL Keenetic Extra II"
endef
