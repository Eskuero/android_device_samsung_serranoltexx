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

TARGET_SPECIFIC_HEADER_PATH := device/samsung/serranoltexx/include
TARGET_OTA_ASSERT_DEVICE := serranolte,serranoltebmc,serranoltektt,serranoltexx

# Board
TARGET_BOOTLOADER_BOARD_NAME := MSM8960
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8960
BOARD_VENDOR := samsung
BOARD_USES_QCOM_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait
TARGET_CPU_SMP := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1572864000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5821676544
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

# Ramdisk
TARGET_NO_INITLOGO := true
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_serranolte

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/serranoltexx
TARGET_KERNEL_CONFIG := cyanogen_serrano_defconfig
TARGET_KERNEL_VARIANT_CONFIG := msm8930_serrano_eur_lte_defconfig
TARGET_KERNEL_SELINUX_CONFIG := selinux_defconfig
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom androidboot.selinux=permissive user_debug=31 zcache
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/samsung/serranoltexx/configs/lib/egl/egl.cfg
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP
TARGET_QCOM_DISPLAY_VARIANT := caf

# Media
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
TARGET_QCOM_MEDIA_VARIANT := caf

# Camera
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true
COMMON_GLOBAL_CFLAGS += -DSAMSUNG_CAMERA_HARDWARE -DNEEDS_VECTORIMPL_SYMBOLS
TARGET_NEED_CAMERA_ZSL := true
TARGET_NEED_FFC_PICTURE_FIXUP := true
TARGET_NEED_FFC_VIDEO_FIXUP := true
TARGET_NEED_DISABLE_FACE_DETECTION := true
TARGET_NEED_DISABLE_FACE_DETECTION_BOTH_CAMERAS := true
TARGET_VIDEO_PREVIEW_ALWAYS_MAX := true

# Wifi driver
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP := "ap"
TARGET_USES_WCNSS_CTRL := true
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/serranoltexx/bluetooth

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true
BOARD_HAVE_SAMSUNG_AUDIO := true
QCOM_CSDCLIENT_ENABLED := false
COMMON_GLOBAL_CFLAGS += -DLPA_DEFAULT_BUFFER_SIZE=32
TARGET_QCOM_AUDIO_VARIANT := caf
BOARD_USES_LEGACY_ALSA_AUDIO := true
BOARD_USES_SEPERATED_VOICE_SPEAKER := true
BOARD_USES_SEPERATED_VOIP := true

# FM Radio
QCOM_FM_ENABLED := true
BOARD_USES_SEPERATED_FM := true

# GPS
BOARD_HAVE_NEW_QC_GPS := true

# Vold
BOARD_VOLD_MAX_PARTITIONS := 24
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Lights
TARGET_PROVIDES_LIBLIGHT := true
BOARD_HAVE_GENERIC_BLN := true

# NFC
BOARD_HAVE_NFC := true
BOARD_NFC_HAL_SUFFIX := msm8960

# Power
BOARD_HAL_STATIC_LIBRARIES := libhealthd.qcom
TARGET_PROVIDES_POWERHAL := true

# Time service
BOARD_USES_QC_TIME_SERVICES := true

# Java
BOARD_HARDWARE_CLASS += hardware/samsung/cmhw

# Charging mode
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
BOARD_BATTERY_DEVICE_NAME := "battery"
BOARD_CHARGER_ENABLE_SUSPEND := true

# Recovery
TW_HAS_DOWNLOAD_MODE := true
TW_NO_REBOOT_BOOTLOADER := true

DEVICE_RESOLUTION := 540x960
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NO_SCREEN_BLANK := true
TW_BRIGHTNESS_PATH := "/sys/devices/platform/mipi_samsung_oled.1281/lcd/panel/backlight"
TW_MAX_BRIGHTNESS := 255

TW_INCLUDE_JB_CRYPTO := true
TW_NO_USB_STORAGE := true
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"

TARGET_RECOVERY_FSTAB := device/samsung/serranoltexx/rootdir/fstab.qcom
