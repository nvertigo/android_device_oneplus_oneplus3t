LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := remove_CMUpdater
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_OVERRIDES_PACKAGES := CMUpdater
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED

include $(BUILD_PREBUILT)


include $(CLEAR_VARS)

LOCAL_MODULE := remove_power.default
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_OVERRIDES_PACKAGES := power.default
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED

include $(BUILD_PREBUILT)
