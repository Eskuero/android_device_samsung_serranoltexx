#
# Copyright (C) 2014 The Android Open Source Project
# Copyright (C) 2014 The CyanogenMod Project <http://www.cyanogenmod.org>
# Modified by Óliver García Albertos (oliverarafo@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Inherit from those products. Most specific first.
$(call inherit-product, build/target/product/full_base_telephony.mk)
$(call inherit-product, build/target/product/languages_full.mk)

# Use the Dalvik VM specific for devices with 1024 MB of RAM (But we have 1.5GB)
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/serranoltexx/serranoltexx-vendor.mk)

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.qcom:root/fstab.qcom \
    $(LOCAL_PATH)/rootdir/init.qcom.rc:root/init.qcom.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.usb.rc:root/init.qcom.usb.rc \
    $(LOCAL_PATH)/rootdir/init.target.rc:root/init.target.rc \
    $(LOCAL_PATH)/rootdir/init.carrier.rc:root/init.carrier.rc \
    $(LOCAL_PATH)/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc \
    $(LOCAL_PATH)/rootdir/lpm.rc:root/lpm.rc
PRODUCT_PACKAGES += \
    init.qcom.early_boot.sh \
    init.qcom.syspart_fixup.sh \
    init.qcom.class_core.sh \
    init.qcom.class_main.sh \
    init.qcom.sh \
    init.qcom.usb.sh \
    init.qcom.lpm_boot.sh

# Recovery ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
    $(LOCAL_PATH)/recovery/etc/twrp.fstab:recovery/root/etc/twrp.fstab \
    $(LOCAL_PATH)/recovery/sbin/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

# Inputs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    $(LOCAL_PATH)/configs/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    $(LOCAL_PATH)/configs/usr/keylayout/cyttsp-i2c.kl:system/usr/keylayout/cyttsp-i2c.kl \
    $(LOCAL_PATH)/configs/usr/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
    $(LOCAL_PATH)/configs/usr/keylayout/keypad_8960_liquid.kl:system/usr/keylayout/keypad_8960_liquid.kl \
    $(LOCAL_PATH)/configs/usr/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    $(LOCAL_PATH)/configs/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/usr/keylayout/philips_remote_ir.kl:system/usr/keylayout/philips_remote_ir.kl \
    $(LOCAL_PATH)/configs/usr/keylayout/samsung_remote_ir.kl:system/usr/keylayout/samsung_remote_ir.kl \
    $(LOCAL_PATH)/configs/usr/keylayout/sec_keys.kl:system/usr/keylayout/sec_keys.kl \
    $(LOCAL_PATH)/configs/usr/keylayout/sec_powerkey.kl:system/usr/keylayout/sec_powerkey.kl \
    $(LOCAL_PATH)/configs/usr/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    $(LOCAL_PATH)/configs/usr/keylayout/sii9234_rcp.kl:system/usr/keylayout/sii9234_rcp.kl \
    $(LOCAL_PATH)/configs/usr/keylayout/ue_rf4ce_remote.kl:system/usr/keylayout/ue_rf4ce_remote.kl

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm8960 \
    gralloc.msm8960 \
    hwcomposer.msm8960 \
    memtrack.msm8960 \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    persist.hwc.mdpcomp.enable=true \
    debug.mdpcomp.logs=0 \
    ro.opengles.version=196608 \
    debug.composition.type=c2d \
    persist.sys.strictmode.disable=1

# Screen
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/etc/media_profiles.xml:system/etc/media_profiles.xml
PRODUCT_PACKAGES += \
    qcmediaplayer \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libOmxCore \
    libc2dcolorconvert \
    libOmxVdecHevc \
    libstagefrighthw \
    libOmxVdec \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libdashplayer
PRODUCT_BOOT_JARS += \
    qcmediaplayer
PRODUCT_PROPERTY_OVERRIDES += \
    lpa.decode=true \
    lpa.use-stagefright=true

# Camera
PRODUCT_PACKAGES += \
    camera.msm8960

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/etc/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(LOCAL_PATH)/configs/etc/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/configs/etc/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny \
    $(LOCAL_PATH)/configs/etc/firmware/wlan/prima/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/configs/etc/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/configs/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    $(LOCAL_PATH)/configs/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh
PRODUCT_PACKAGES += \
    wcnss_service \
    libQWiFiSoftApCfg \
    libqsap_sdk \
    crda \
    regdbdump \
    regulatory.bin \
    linville.key.pub.pem
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh

# RIL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/init.qcom.mdm_links.sh:system/etc/init.qcom.mdm_links.sh \
    $(LOCAL_PATH)/configs/etc/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=SamsungQualcommRIL \
    ro.telephony.ril.v3=samsungEMSReq \
    telephony.lteOnGsmDevice=1 \
    ro.telephony.default_network=9 \
    ro.telephony.call_ring.multiple=0 \
    persist.rild.nitz_plmn="" \
    persist.rild.nitz_long_ons_0="" \
    persist.rild.nitz_long_ons_1="" \
    persist.rild.nitz_long_ons_2="" \
    persist.rild.nitz_long_ons_3="" \
    persist.rild.nitz_short_ons_0="" \
    persist.rild.nitz_short_ons_1="" \
    persist.rild.nitz_short_ons_2="" \
    persist.rild.nitz_short_ons_3="" \
    ril.subscription.types=NV,RUIM \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    persist.radio.add_power_save=1 \
    persist.radio.apm_sim_not_pwdn=1 \
    ro.ril.transmitpower=true

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/gps.conf:system/etc/gps.conf
PRODUCT_PACKAGES += \
    gps.msm8960
PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qmienabled=true \
    persist.gps.qc_nlp_in_use=0

# NFC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf
PRODUCT_PACKAGES += \
    nfc_nci.msm8960 \
    NfcNci \
    Tag

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/etc/snd_soc_msm/snd_soc_msm_2x:system/etc/snd_soc_msm/snd_soc_msm_2x \
    $(LOCAL_PATH)/configs/etc/init.qcom.audio.sh:system/etc/init.qcom.audio.sh
PRODUCT_PACKAGES += \
    audio_policy.msm8960 \
    audio.primary.msm8960 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler
PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.fluence.mode=endfire \
    persist.audio.vr.enable=false \
    persist.audio.handset.mic=digital \
    persist.audio.lowlatency.rec=false \
    audio.gapless.playback.disable=true

# Radio FM
PRODUCT_PACKAGES += \
    qcom.fmradio \
    libqcomfm_jni \
    FM2 \
    FMRecord

# Sensors
PRODUCT_PACKAGES += \
    lights.msm8960 \
    consumerir.msm8960 \
    qrngd

# Power
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh
PRODUCT_PACKAGES += \
    power.msm8960

# USB
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Thermal profile
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/thermald-8930ab.conf:system/etc/thermald-8930ab.conf

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml


# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

# Misc packages
PRODUCT_PACKAGES += \
    OmniTorch \
    com.android.future.usb.accessory

# Non-device-specific/to-be-clasified props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.chipname=MSM8930AB \
    ro.warmboot.capability=1 \
    ro.qualcomm.cabl=0 \
    af.resampler.quality=255 \
    ro.use_data_netmgrd=true \
    persist.fuse_sdcard=true \
    ro.vold.umsdirtyratio=50 \
    ro.cwm.enable_key_repeat=true \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    persist.timed.enable=true \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

# Screen size
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540

# Define kind of DPI
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise
