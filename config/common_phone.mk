# audio
include frameworks/base/data/sounds/NewAudio.mk

# common
$(call inherit-product, vendor/crom/config/common.mk)

# bluetooth
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf

# media
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/media/hdpi/bootanimation.zip:system/media/bootanimation.zip

# packages
PRODUCT_PACKAGES += \
  Mms \
  Stk

# ringtones
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Hydra.ogg \
    ro.config.notification_sound=Proxima.ogg \
    ro.config.alarm_alert=Cesium.ogg

