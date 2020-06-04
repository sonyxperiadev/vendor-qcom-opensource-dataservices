TARGET_DISABLE_RMNT := false
ifeq ($(TARGET_USES_QMAA),true)
ifneq ($(TARGET_USES_QMAA_OVERRIDE_DATA),true)
TARGET_DISABLE_RMNT := true
endif
endif
ifneq ($(TARGET_DISABLE_RMNT),true)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := librmnetctl.c
LOCAL_CFLAGS := -Wall -Werror

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../inc
LOCAL_C_INCLUDES += $(LOCAL_PATH)

# To export librmnetctl.h to proprietary parts
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/inc

ifeq ($(call is-vendor-board-platform,QCOM),true)
ifeq ($(TARGET_COMPILE_WITH_MSM_KERNEL),true)
    LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
    LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
endif
endif

LOCAL_CLANG := true
LOCAL_MODULE := librmnetctl
LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false

LOCAL_VENDOR_MODULE := true

include $(BUILD_SHARED_LIBRARY)
endif
