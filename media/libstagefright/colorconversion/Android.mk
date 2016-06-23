LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

ifeq ($(MTK_HARDWARE),true)
ifeq ($(strip $(MTK_DP_FRAMEWORK)),yes)
LOCAL_CFLAGS += -DMTK_USEDPFRMWK
else
LOCAL_CFLAGS += -DMTK_MHAL
endif
endif

LOCAL_SRC_FILES:=                     \
        ColorConverter.cpp            \
        SoftwareRenderer.cpp

LOCAL_C_INCLUDES := \
        $(TOP)/frameworks/native/include/media/openmax \
        $(TOP)/hardware/msm7k

LOCAL_CFLAGS += -Werror
LOCAL_CLANG := true

ifeq ($(MTK_HARDWARE),true)
LOCAL_C_INCLUDES += \
        $(TOP)/frameworks/av/include/mediatek/dpframework \
        $(TOP)/frameworks/av/include/mediatek/mhal
endif

LOCAL_MODULE:= libstagefright_color_conversion

include $(BUILD_STATIC_LIBRARY)
