SUPERUSER_EMBEDDED := true

# brand
PRODUCT_BRAND ?= C-RoM Mix

# overrides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# packages
PRODUCT_PACKAGES += \
    Apollo \
    Calendar \
    Camera \
    CMFileManager \
    DashClock \
    Galaxy4 \
    HoloSpiralWallpaper \
    LiveWallpapers \
    LiveWallpapersPicker \
    NoiseField \
    PermissionsManager \
    PhaseBeam \
    BlueBalls \
    PhotoTable \
    Superuser \
    su \
    Trebuchet \
    CRoMWallpapers \
    Welcome

# CM Packages
PRODUCT_PACKAGES += \
    audio_effects.conf \
    DSPManager \
    libcyanogen-dsp

# prebuilts
PRODUCT_PACKAGES += \
    GooManager \
    LatinIME \
    LockClock 

# tools
PRODUCT_PACKAGES += \
    CellBroadcastReceiver

PRODUCT_PACKAGES += \
    armzipalign \
    e2fsck \
    mke2fs \
    tune2fs \
    nano
	
# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# languages
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# themes
include vendor/crom/config/theme_chooser.mk

#korean
$(call inherit-product-if-exists, external/naver-fonts/fonts.mk)

# overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/crom/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/crom/overlay/common

# bin
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/bin/sysinit:system/bin/sysinit

# etc
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/etc/init.crom.rc:root/init.crom.rc \
    vendor/crom/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf

# initd
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/etc/init.d/00crom:system/etc/init.d/00crom \
    vendor/crom/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit \
    vendor/crom/prebuilt/common/etc/init.d/98tweaks:system/etc/init.d/98tweaks \
    vendor/crom/prebuilt/common/etc/liberty.bsh:system/etc/liberty.bsh \
    vendor/crom/prebuilt/common/etc/init_trigger.disabled:system/etc/init_trigger.disabled \

# build.prop tweaks
PRODUCT_PROPERTY_OVERRIDES += \
  ro.kernel.android.checkjni=0 \
  ro.media.enc.jpeg.quality=100 \
  debug.sf.hw=1 \
  pm.sleep_mode=1 \
  video.accelerate.hw=1 \
  persist.sys.root_access=3

# Compcache/Zram support
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/crom/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache

# prebuilt
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/xbin/sysro:system/xbin/sysro \
    vendor/crom/prebuilt/common/xbin/sysrw:system/xbin/sysrw \
    vendor/crom/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/crom/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

#backup tool
crom_BUILD = true
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/crom/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/crom/prebuilt/common/bin/50-crom.sh:system/addon.d/50-crom.sh \
    vendor/crom/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/etc/mkshrc:system/etc/mkshrc \
    vendor/crom/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

# sip/voip
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# version
RELEASE = false
CROM_VERSION_MAJOR = 22
CROM_VERSION_MINOR = 0
CROM_VERSION := "C-RoM_Mix_v"$(CROM_VERSION_MAJOR).$(CROM_VERSION_MINOR)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.crom.version=$(CROM_VERSION)
