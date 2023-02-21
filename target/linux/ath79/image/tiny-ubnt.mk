include ./common-ubnt.mk

define Device/ubnt_airrouter
  $(Device/Common/ubnt-xm)
  SOC := ar7241
  DEVICE_MODEL := AirRouter
  SUPPORTED_DEVICES += airrouter
endef

define Device/ubnt_nanobridge-m
  $(Device/Common/ubnt-xm)
  SOC := ar7241
  DEVICE_MODEL := NanoBridge M
  DEVICE_PACKAGES += rssileds
  SUPPORTED_DEVICES += bullet-m
endef

define Device/ubnt_bullet-m-ar7240
  $(Device/Common/ubnt-xm)
  SOC := ar7240
  DEVICE_MODEL := Bullet M
  DEVICE_VARIANT := XM (AR7240)
  DEVICE_PACKAGES += rssileds
  SUPPORTED_DEVICES += bullet-m
endef

define Device/ubnt_bullet-m-ar7241
  $(Device/Common/ubnt-xm)
  SOC := ar7241
  DEVICE_MODEL := Bullet M
  DEVICE_VARIANT := XM (AR7241)
  DEVICE_PACKAGES += rssileds
  SUPPORTED_DEVICES += bullet-m ubnt,bullet-m
endef

define Device/ubnt_picostation-m
  $(Device/Common/ubnt-xm)
  SOC := ar7241
  DEVICE_MODEL := Picostation M
  DEVICE_PACKAGES += rssileds
  SUPPORTED_DEVICES += bullet-m
endef

define Device/ubnt_nanostation-m
  $(Device/Common/ubnt-xm)
  SOC := ar7241
  DEVICE_MODEL := Nanostation M
  DEVICE_PACKAGES += rssileds
  SUPPORTED_DEVICES += nanostation-m
endef

define Device/ubnt_nanostation-loco-m
  $(Device/Common/ubnt-xm)
  SOC := ar7241
  DEVICE_MODEL := Nanostation Loco M
  DEVICE_PACKAGES += rssileds
  SUPPORTED_DEVICES += bullet-m
endef

define Device/ubnt_powerbridge-m
  $(Device/Common/ubnt-xm)
  SOC := ar7241
  DEVICE_MODEL := PowerBridge M
  DEVICE_PACKAGES += rssileds
  SUPPORTED_DEVICES += bullet-m
endef

define Device/ubnt_rocket-m
  $(Device/Common/ubnt-xm)
  SOC := ar7241
  DEVICE_MODEL := Rocket M
  DEVICE_PACKAGES += rssileds
  SUPPORTED_DEVICES += rocket-m
endef
