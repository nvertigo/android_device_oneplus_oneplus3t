# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from oneplus3t device
$(call inherit-product, device/oneplus/oneplus3t/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_oneplus3t
PRODUCT_DEVICE := oneplus3t
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="OnePlus/OnePlus3/OnePlus3T:7.1.1/NMF26F/09151130:user/release-keys" \
    PRIVATE_BUILD_DESC="OnePlus3-user 7.1.1 NMF26F 83 dev-keys" \
    PRIVATE_TARGET_DEVICE="OnePlus3T" \
    PRIVATE_BUILD_PRODUCT="OnePlus3"

TARGET_UNOFFICIAL_BUILD_ID := eas

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

TARGET_VENDOR := oneplus
