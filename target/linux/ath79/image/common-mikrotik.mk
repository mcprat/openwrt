define Device/Common/mikrotik
	DEVICE_VENDOR := MikroTik
	LOADER_TYPE := elf
	KERNEL_NAME := vmlinuz
	KERNEL := kernel-bin | append-dtb-elf
	KERNEL_INITRAMFS_NAME := vmlinux-initramfs
	KERNEL_INITRAMFS := kernel-bin | append-dtb | lzma | loader-kernel
endef

define Device/Common/mikrotik_nor
  $(Device/Common/mikrotik)
  IMAGE/sysupgrade.bin := append-kernel | kernel2minor -s 1024 -e | \
	pad-to $$$$(BLOCKSIZE) | append-rootfs | pad-rootfs | \
	check-size | append-metadata
endef

define Device/Common/mikrotik_nand
  $(Device/Common/mikrotik)
  IMAGE/sysupgrade.bin = append-kernel | kernel2minor -s 2048 -e -c | \
	sysupgrade-tar kernel=$$$$@ | append-metadata
  DEVICE_PACKAGES := nand-utils
  DEFAULT := n
endef
