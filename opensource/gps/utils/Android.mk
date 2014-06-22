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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

## Libs
LOCAL_SHARED_LIBRARIES := \
    libutils \
    libcutils

LOCAL_SRC_FILES += \
    loc_log.cpp \
    loc_cfg.cpp \
    msg_q.c \
    linked_list.c

LOCAL_CFLAGS += \
     -fno-short-enums \
     -D_ANDROID_

LOCAL_LDFLAGS += -Wl,--export-dynamic

## Includes
LOCAL_C_INCLUDES:=

LOCAL_COPY_HEADERS_TO:= gps.utils/
LOCAL_COPY_HEADERS:= \
   loc_log.h \
   loc_cfg.h \
   log_util.h \
   linked_list.h \
   msg_q.h

LOCAL_MODULE := libgps.utils

LOCAL_MODULE_TAGS := optional

LOCAL_PRELINK_MODULE := false

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
include $(BUILD_SHARED_LIBRARY)
