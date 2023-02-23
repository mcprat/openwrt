include ./common-tp-link.mk

define Device/tplink_tl-mr10u
  $(DeviceCommon/tplink-4mlzma)
  SOC := ar9331
  DEVICE_MODEL := TL-MR10U
  DEVICE_PACKAGES := kmod-usb-chipidea2
  TPLINK_HWID := 0x00100101
  SUPPORTED_DEVICES += tl-mr10u
endef

define Device/tplink_tl-mr3020-v1
  $(DeviceCommon/tplink-4mlzma)
  IMAGE_SIZE := 3840k
  SOC := ar9331
  DEVICE_MODEL := TL-MR3020
  DEVICE_VARIANT := v1
  DEVICE_PACKAGES := kmod-usb-chipidea2 kmod-usb-ledtrig-usbport
  TPLINK_HWID := 0x30200001
  SUPPORTED_DEVICES += tl-mr3020
endef

define Device/tplink_tl-mr3040-v2
  $(DeviceCommon/tplink-4mlzma)
  SOC := ar9331
  DEVICE_MODEL := TL-MR3040
  DEVICE_VARIANT := v2
  DEVICE_PACKAGES := kmod-usb-chipidea2 kmod-usb-ledtrig-usbport
  TPLINK_HWID := 0x30400002
  SUPPORTED_DEVICES += tl-mr3040-v2
endef

define Device/tplink_tl-mr3220-v1
  $(DeviceCommon/tplink-4m)
  SOC := ar7241
  DEVICE_MODEL := TL-MR3220
  DEVICE_VARIANT := v1
  TPLINK_HWID := 0x32200001
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ledtrig-usbport
  SUPPORTED_DEVICES += tl-mr3220
endef

define Device/tplink_tl-mr3420-v1
  $(DeviceCommon/tplink-4m)
  SOC := ar7241
  DEVICE_MODEL := TL-MR3420
  DEVICE_VARIANT := v1
  TPLINK_HWID := 0x34200001
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ledtrig-usbport
  SUPPORTED_DEVICES += tl-mr3420
endef

define Device/tplink_tl-mr3420-v2
  $(DeviceCommon/tplink-4mlzma)
  SOC := ar9341
  DEVICE_MODEL := TL-MR3420
  DEVICE_VARIANT := v2
  TPLINK_HWID := 0x34200002
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ledtrig-usbport
  SUPPORTED_DEVICES += tl-mr3420-v2
endef

define Device/tplink_tl-mr3420-v3
  $(DeviceCommon/tplink-4mlzma)
  SOC := qca9531
  DEVICE_MODEL := TL-MR3420
  DEVICE_VARIANT := v3
  TPLINK_HWID := 0x34200003
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-ledtrig-usbport
endef

define Device/tplink_tl-wa701nd-v1
  $(DeviceCommon/tplink-4m)
  SOC := ar7240
  DEVICE_MODEL := TL-WA701ND
  DEVICE_VARIANT := v1
  TPLINK_HWID := 0x07010001
  SUPPORTED_DEVICES += tl-wa901nd
endef

define Device/tplink_tl-wa730re-v1
  $(DeviceCommon/tplink-4m)
  SOC := ar7240
  DEVICE_MODEL := TL-WA730RE
  DEVICE_VARIANT := v1
  TPLINK_HWID := 0x07300001
  SUPPORTED_DEVICES += tl-wa901nd
endef

define Device/tplink_tl-wa801nd-v1
  $(DeviceCommon/tplink-4m)
  SOC := ar7240
  DEVICE_MODEL := TL-WA801ND
  DEVICE_VARIANT := v1
  TPLINK_HWID := 0x08010001
  SUPPORTED_DEVICES += tl-wa901nd
endef

define Device/tplink_tl-wa801nd-v3
  $(DeviceCommon/tplink-4mlzma)
  SOC := qca9533
  DEVICE_MODEL := TL-WA801ND
  DEVICE_VARIANT := v3
  TPLINK_HWID := 0x08010003
  SUPPORTED_DEVICES += tl-wa801nd-v3
endef

define Device/tplink_tl-wa801nd-v4
  $(DeviceCommon/tplink-4mlzma)
  SOC := qca9533
  DEVICE_MODEL := TL-WA801ND
  DEVICE_VARIANT := v4
  TPLINK_HWID := 0x08010004
  SUPPORTED_DEVICES += tl-wa801nd-v3
endef

define Device/tplink_tl-wa830re-v1
  $(DeviceCommon/tplink-4m)
  SOC := ar7240
  DEVICE_MODEL := TL-WA830RE
  DEVICE_VARIANT := v1
  TPLINK_HWID := 0x08300010
  SUPPORTED_DEVICES += tl-wa901nd
endef

define Device/tplink_tl-wa850re-v1
  $(DeviceCommon/tplink-4mlzma)
  SOC := ar9341
  DEVICE_MODEL := TL-WA850RE
  DEVICE_VARIANT := v1
  TPLINK_HWID := 0x08500001
  DEVICE_PACKAGES := rssileds
  SUPPORTED_DEVICES += tl-wa850re
endef

define Device/tplink_tl-wa850re-v2
  $(DeviceCommon/tplink-safeloader)
  SOC := qca9533
  IMAGE_SIZE := 3648k
  DEVICE_MODEL := TL-WA850RE
  DEVICE_VARIANT := v2
  TPLINK_BOARD_ID := TLWA850REV2
  TPLINK_HWID := 0x08500002
  DEVICE_PACKAGES := rssileds
  SUPPORTED_DEVICES += tl-wa850re-v2
  DEFAULT := n
endef

define Device/tplink_tl-wa860re-v1
  $(DeviceCommon/tplink-4mlzma)
  SOC := ar9341
  DEVICE_MODEL := TL-WA860RE
  DEVICE_VARIANT := v1
  TPLINK_HWID := 0x08600001
  SUPPORTED_DEVICES += tl-wa860re
endef

define Device/tplink_tl-wa901nd-v1
  $(DeviceCommon/tplink-4m)
  SOC := ar7240
  DEVICE_MODEL := TL-WA901ND
  DEVICE_VARIANT := v1
  TPLINK_HWID := 0x09010001
  SUPPORTED_DEVICES += tl-wa901nd
endef

define Device/tplink_tl-wa901nd-v2
  $(DeviceCommon/tplink-4m)
  SOC := ar9132
  DEVICE_MODEL := TL-WA901ND
  DEVICE_VARIANT := v2
  TPLINK_HWID := 0x09010002
  SUPPORTED_DEVICES += tl-wa901nd-v2
endef

define Device/tplink_tl-wa901nd-v3
  $(DeviceCommon/tplink-4mlzma)
  SOC := ar9341
  DEVICE_MODEL := TL-WA901ND
  DEVICE_VARIANT := v3
  TPLINK_HWID := 0x09010003
  SUPPORTED_DEVICES += tl-wa901nd-v3
endef

define Device/tplink_tl-wa901nd-v4
  $(DeviceCommon/tplink-4mlzma)
  SOC := tp9343
  DEVICE_MODEL := TL-WA901ND
  DEVICE_VARIANT := v4
  TPLINK_HWID := 0x09010004
  SUPPORTED_DEVICES += tl-wa901nd-v4
  IMAGE/factory.bin := tplink-v1-image factory -C EU
endef

define Device/tplink_tl-wa901nd-v5
  $(DeviceCommon/tplink-4mlzma)
  SOC := tp9343
  DEVICE_MODEL := TL-WA901ND
  DEVICE_VARIANT := v5
  TPLINK_HWID := 0x09010005
  SUPPORTED_DEVICES += tl-wa901nd-v5
  IMAGE/factory.bin := tplink-v1-image factory -C EU
endef

define DeviceCommon/tplink_tl-wpa8630p-v2
  $(DeviceCommon/tplink-safeloader)
  SOC := qca9563
  DEVICE_MODEL := TL-WPA8630P
  IMAGE_SIZE := 6016k
  DEVICE_PACKAGES := kmod-ath10k-ct ath10k-firmware-qca9888-ct
  DEVICE_COMPAT_VERSION := 2.0
  DEVICE_COMPAT_MESSAGE := The flash erase blocksize has changed to 4k from the 64k in previous versions, \
    so the JFFS2 settings partition MUST be reformatted to avoid data corruption. \
    Backup your settings before upgrading, then during sysupgrade, \
    de-select "Keep settings" and select "Force" to continue (equivilant to "sysupgrade -n -F").
  DEFAULT := n
endef

define Device/tplink_tl-wpa8630p-v2-int
  $(DeviceCommon/tplink_tl-wpa8630p-v2)
  DEVICE_VARIANT := v2 (Int.)
  TPLINK_BOARD_ID := TL-WPA8630P-V2-INT
endef

define Device/tplink_tl-wpa8630p-v2.0-eu
  $(DeviceCommon/tplink_tl-wpa8630p-v2)
  DEVICE_VARIANT := v2.0 (EU)
  TPLINK_BOARD_ID := TL-WPA8630P-V2.0-EU
  SUPPORTED_DEVICES += tplink,tl-wpa8630p-v2-eu
endef

define Device/tplink_tl-wpa8630p-v2.1-eu
  $(DeviceCommon/tplink_tl-wpa8630p-v2)
  DEVICE_VARIANT := v2.1 (EU)
  TPLINK_BOARD_ID := TL-WPA8630P-V2.1-EU
endef

define Device/tplink_tl-wr703n
  $(DeviceCommon/tplink-4mlzma)
  SOC := ar9331
  DEVICE_MODEL := TL-WR703N
  DEVICE_PACKAGES := kmod-usb-chipidea2
  TPLINK_HWID := 0x07030101
  SUPPORTED_DEVICES += tl-wr703n
endef

define Device/tplink_tl-wr740n-v1
  $(DeviceCommon/tplink-4m)
  SOC := ar7240
  DEVICE_MODEL := TL-WR740N
  DEVICE_VARIANT := v1/v2
  TPLINK_HWID := 0x07400001
  SUPPORTED_DEVICES += tl-wr741nd
endef

define Device/tplink_tl-wr740n-v3
  $(DeviceCommon/tplink-4m)
  SOC := ar7240
  DEVICE_MODEL := TL-WR740N
  DEVICE_VARIANT := v3
  TPLINK_HWID := 0x07400003
  SUPPORTED_DEVICES += tl-wr741nd
endef

define Device/tplink_tl-wr740n-v4
  $(DeviceCommon/tplink-4mlzma)
  SOC := ar9331
  DEVICE_MODEL := TL-WR740N
  DEVICE_VARIANT := v4
  TPLINK_HWID := 0x07400004
  SUPPORTED_DEVICES += tl-wr741nd-v4
endef

define Device/tplink_tl-wr740n-v5
  $(DeviceCommon/tplink-4mlzma)
  SOC := ar9331
  DEVICE_MODEL := TL-WR740N
  DEVICE_VARIANT := v5
  TPLINK_HWID := 0x07400005
  SUPPORTED_DEVICES += tl-wr741nd-v4
endef

define Device/tplink_tl-wr741-v1
  $(DeviceCommon/tplink-4m)
  SOC := ar7240
  DEVICE_MODEL := TL-WR741N/ND
  DEVICE_VARIANT := v1/v2
  TPLINK_HWID := 0x07410001
  SUPPORTED_DEVICES += tl-wr741nd
endef

define Device/tplink_tl-wr741nd-v4
  $(DeviceCommon/tplink-4mlzma)
  SOC := ar9331
  DEVICE_MODEL := TL-WR741N/ND
  DEVICE_VARIANT := v4
  TPLINK_HWID := 0x07410004
  SUPPORTED_DEVICES += tl-wr741nd-v4
endef

define Device/tplink_tl-wr743nd-v1
  $(DeviceCommon/tplink-4m)
  SOC := ar7240
  DEVICE_MODEL := TL-WR743ND
  DEVICE_VARIANT := v1
  TPLINK_HWID := 0x07430001
  SUPPORTED_DEVICES += tl-wr741nd
endef

define Device/tplink_tl-wr802n-v1
  $(DeviceCommon/tplink-4mlzma)
  SOC := qca9533
  DEVICE_MODEL := TL-WR802N
  DEVICE_VARIANT := v1
  TPLINK_HWID := 0x08020001
  SUPPORTED_DEVICES += tl-wr802n-v1
endef

define Device/tplink_tl-wr802n-v2
  $(DeviceCommon/tplink-4mlzma)
  SOC := qca9533
  DEVICE_MODEL := TL-WR802N
  DEVICE_VARIANT := v2
  TPLINK_HWID := 0x08020002
  TPLINK_HWREV := 2
  SUPPORTED_DEVICES += tl-wr802n-v2
  IMAGES += factory-us.bin factory-eu.bin
  IMAGE/factory-us.bin := tplink-v1-image factory -C US
  IMAGE/factory-eu.bin := tplink-v1-image factory -C EU
endef

define Device/tplink_tl-wr841-v5
  $(DeviceCommon/tplink-4m)
  SOC := ar7240
  DEVICE_MODEL := TL-WR841N/ND
  DEVICE_VARIANT := v5/v6
  TPLINK_HWID := 0x08410005
  SUPPORTED_DEVICES += tl-wr741nd
endef

define Device/tplink_tl-wr841-v7
  $(DeviceCommon/tplink-4m)
  SOC := ar7241
  DEVICE_MODEL := TL-WR841N/ND
  DEVICE_VARIANT := v7
  TPLINK_HWID := 0x08410007
  SUPPORTED_DEVICES += tl-wr841n-v7
endef

define Device/tplink_tl-wr841-v8
  $(DeviceCommon/tplink-4mlzma)
  SOC := ar9341
  DEVICE_MODEL := TL-WR841N/ND
  DEVICE_VARIANT := v8
  TPLINK_HWID := 0x08410008
  SUPPORTED_DEVICES += tl-wr841n-v8
endef

define Device/tplink_tl-wr841-v9
  $(DeviceCommon/tplink-4mlzma)
  SOC := qca9533
  DEVICE_MODEL := TL-WR841N/ND
  DEVICE_VARIANT := v9
  TPLINK_HWID := 0x08410009
  SUPPORTED_DEVICES += tl-wr841n-v9
endef

define Device/tplink_tl-wr841-v10
  $(DeviceCommon/tplink-4mlzma)
  SOC := qca9533
  DEVICE_MODEL := TL-WR841N/ND
  DEVICE_VARIANT := v10
  TPLINK_HWID := 0x08410010
  SUPPORTED_DEVICES += tl-wr841n-v9
endef

define Device/tplink_tl-wr841-v11
  $(DeviceCommon/tplink-4mlzma)
  SOC := qca9533
  DEVICE_MODEL := TL-WR841N/ND
  DEVICE_VARIANT := v11
  TPLINK_HWID := 0x08410011
  SUPPORTED_DEVICES += tl-wr841n-v11
  IMAGES += factory-us.bin factory-eu.bin
  IMAGE/factory-us.bin := tplink-v1-image factory -C US
  IMAGE/factory-eu.bin := tplink-v1-image factory -C EU
endef

define Device/tplink_tl-wr841-v12
  $(DeviceCommon/tplink-4mlzma)
  SOC := qca9533
  DEVICE_MODEL := TL-WR841N/ND
  DEVICE_VARIANT := v12
  TPLINK_HWID := 0x08410012
  SUPPORTED_DEVICES += tl-wr841n-v11
  IMAGES += factory-us.bin factory-eu.bin
  IMAGE/factory-us.bin := tplink-v1-image factory -C US
  IMAGE/factory-eu.bin := tplink-v1-image factory -C EU
endef

define Device/tplink_tl-wr940n-v3
  $(DeviceCommon/tplink-4mlzma)
  SOC := tp9343
  DEVICE_MODEL := TL-WR940N
  DEVICE_VARIANT := v3
  TPLINK_HWID := 0x09410006
  SUPPORTED_DEVICES += tl-wr941nd-v6
endef

define Device/tplink_tl-wr940n-v4
  $(DeviceCommon/tplink-4mlzma)
  SOC := tp9343
  DEVICE_MODEL := TL-WR940N
  DEVICE_VARIANT := v4
  TPLINK_HWID := 0x09400004
  SUPPORTED_DEVICES += tl-wr940n-v4
  IMAGES += factory-us.bin factory-eu.bin factory-br.bin
  IMAGE/factory-us.bin := tplink-v1-image factory -C US
  IMAGE/factory-eu.bin := tplink-v1-image factory -C EU
  IMAGE/factory-br.bin := tplink-v1-image factory -C BR
endef

define Device/tplink_tl-wr940n-v6
  $(DeviceCommon/tplink-4mlzma)
  SOC := tp9343
  DEVICE_MODEL := TL-WR940N
  DEVICE_VARIANT := v6
  TPLINK_HWID := 0x09400006
  SUPPORTED_DEVICES += tl-wr940n-v6
  IMAGES += factory-us.bin factory-eu.bin factory-br.bin
  IMAGE/factory-us.bin := tplink-v1-image factory -C US
  IMAGE/factory-eu.bin := tplink-v1-image factory -C EU
  IMAGE/factory-br.bin := tplink-v1-image factory -C BR
endef

define Device/tplink_tl-wr941-v2
  $(DeviceCommon/tplink-4m)
  SOC := ar9132
  DEVICE_MODEL := TL-WR941ND
  DEVICE_VARIANT := v2/v3
  DEVICE_ALT0_VENDOR := TP-Link
  DEVICE_ALT0_MODEL := TL-WR941N
  DEVICE_ALT0_VARIANT := v2/v3
  TPLINK_HWID := 0x09410002
  TPLINK_HWREV := 2
  SUPPORTED_DEVICES += tl-wr941nd
endef

define Device/tplink_tl-wr941-v4
  $(DeviceCommon/tplink-4m)
  SOC := ar7240
  DEVICE_MODEL := TL-WR941ND
  DEVICE_VARIANT := v4
  DEVICE_ALT0_VENDOR := TP-Link
  DEVICE_ALT0_MODEL := TL-WR941N
  DEVICE_ALT0_VARIANT := v4
  TPLINK_HWID := 0x09410004
  SUPPORTED_DEVICES += tl-wr741nd
endef

define Device/tplink_tl-wr941nd-v5
  $(DeviceCommon/tplink-4mlzma)
  SOC := ar9341
  DEVICE_MODEL := TL-WR941ND
  DEVICE_VARIANT := v5
  TPLINK_HWID := 0x09410005
  SUPPORTED_DEVICES += tl-wr941nd-v5
endef

define Device/tplink_tl-wr941nd-v6
  $(DeviceCommon/tplink-4mlzma)
  SOC := tp9343
  DEVICE_MODEL := TL-WR941ND
  DEVICE_VARIANT := v6
  TPLINK_HWID := 0x09410006
  SUPPORTED_DEVICES += tl-wr941nd-v6
endef

define Device/tplink_tl-wr941n-v7-cn
  $(DeviceCommon/tplink-4mlzma)
  SOC := qca9558
  DEVICE_MODEL := TL-WR941N
  DEVICE_VARIANT := v7 (CN)
  TPLINK_HWID := 0x09410007
endef
