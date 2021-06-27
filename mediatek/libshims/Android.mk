LOCAL_PATH := $(call my-dir)

# GPS Shim
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	gps/icu_shim.cpp

LOCAL_SHARED_LIBRARIES := \
	liblog \
	libicuuc \
	libssl \
	libcrypto

LOCAL_MODULE := libshim_gps
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# Camera Shim
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	camera/sony_camera.cpp \
	camera/camera_shim.cpp

LOCAL_MODULE := libshim_camera
LOCAL_SHARED_LIBRARIES := libui

LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# Program Binary Service Shim
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    program_binary/program_binary.cpp

LOCAL_SHARED_LIBRARIES := \
    libcutils

LOCAL_MODULE := libshim_program_binary

LOCAL_CFLAGS := -O3 -Wno-unused-variable -Wno-unused-parameter
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# XLOG Shim
include $(CLEAR_VARS)

LOCAL_SRC_FILES := misc/xlog_shim.cpp

LOCAL_SHARED_LIBRARIES := liblog

LOCAL_MODULE := libshim_xlog

LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# MAL Shim (vt)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	vt/vt_shim.cpp \
	vt/skia_shim.cpp \
	vt/MediaBuffer_shim.cpp \
	vt/MediaCodec_shim.cpp \
	vt/AudioTrack_shim.cpp

LOCAL_MODULE := libshim_vt
LOCAL_SHARED_LIBRARIES := libskia libstagefright_foundation libui libgui libmedia libstagefright
LOCAL_C_INCLUDES += $(LOCAL_PATH)/skia/include    
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# ASC Shim (vt)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := misc/asc_shim.cpp

LOCAL_SHARED_LIBRARIES := libsurfaceflinger libui libgui libcutils

LOCAL_MODULE := libshim_asc

LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# GUI Shim
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	gui/gui_shim.cpp \
    gui/dump_tunel_shim.cpp

LOCAL_SHARED_LIBRARIES := \
	libui \
	libgui \
	libdpframework \
    liblog

LOCAL_STATIC_LIBRARIES := \
    libaudiopolicycomponents

LOCAL_C_INCLUDES += system/core/include/ frameworks/av/include/ hardware/libhardware/include/    

LOCAL_MODULE := libshim_gui
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# Audio Shim
include $(CLEAR_VARS)

LOCAL_SRC_FILES := audio/audio_shim.cpp

LOCAL_MODULE := libshim_audio

LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := misc/ifc_shim.c
LOCAL_SHARED_LIBRARIES := liblog libcutils
LOCAL_MODULE := libshim_ifc
LOCAL_C_INCLUDES += system/core/libnetutils/include
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)
