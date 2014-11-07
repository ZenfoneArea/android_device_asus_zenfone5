## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := revolution

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/asus/zenfone5/device_zenfone5.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := zenfone5
PRODUCT_NAME := cm_zenfone5
PRODUCT_BRAND := asus
PRODUCT_MODEL := zenfone5
PRODUCT_MANUFACTURER := asus
