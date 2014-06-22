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

ifeq ($(TARGET_PROVIDES_CAMERA_HAL),true)
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

ifeq ($(TARGET_NEED_DISABLE_AUTOFOCUS),true)
    LOCAL_CFLAGS += -DDISABLE_AUTOFOCUS
endif

ifeq ($(TARGET_NEED_CAMERA_ZSL),true)
    LOCAL_CFLAGS += -DENABLE_ZSL
endif

ifeq ($(TARGET_NEED_SAMSUNG_MAGIC_ZSL_1508),true)
    LOCAL_CFLAGS += -DMAGIC_ZSL_1508
endif

ifeq ($(TARGET_NEED_PREVIEW_SIZE_FIXUP),true)
    LOCAL_CFLAGS += -DPREVIEW_SIZE_FIXUP
endif

ifeq ($(TARGET_NEED_SAMSUNG_CAMERA_MODE),true)
    LOCAL_CFLAGS += -DSAMSUNG_CAMERA_MODE
endif

ifeq ($(TARGET_ADD_ISO_MODE_1600),true)
    LOCAL_CFLAGS += -DISO_MODE_1600
endif

ifeq ($(TARGET_ADD_ISO_MODE_HJR),true)
    LOCAL_CFLAGS += -DISO_MODE_HJR
endif

LOCAL_SRC_FILES := \
    CameraWrapper.cpp

LOCAL_SHARED_LIBRARIES := \
    libhardware liblog libcamera_client libutils

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE := camera.msm8960
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
endif
