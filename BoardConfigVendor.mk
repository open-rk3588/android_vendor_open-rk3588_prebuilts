# BoardConfigVendor.mk
# Copyright (C) 2026 Valentin Liu <valentinliu@icloud.com>

VENDOR_PATH := vendor/open-rk3588/prebuilts

ifeq ($(TARGET_USE_PREBUILT_MESA), true)
BOARD_VENDOR_SEPOLICY_DIRS += \
        $(VENDOR_PATH)/sepolicy/mesa/
endif
