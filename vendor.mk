# vendor.mk
# Copyright (C) 2026 Valentin Liu <valentinliu@icloud.com>

PRODUCT_RESTRICT_VENDOR_FILES := false

ifeq ($(TARGET_USE_PREBUILT_MESA), true)
PRODUCT_SOONG_NAMESPACES += vendor/open-rk3588/prebuilts/mesa

PRODUCT_PACKAGES += \
	libglapi \
	libgbm_mesa \
        libGLESv1_CM_mesa \
        libGLESv2_mesa \
        libEGL_mesa \
        libgallium_dri \
        vulkan.panfrost

PRODUCT_VENDOR_PROPERTIES += \
        ro.hardware.egl=mesa \
        ro.hardware.vulkan=panfrost \
        debug.hwui.renderer=opengl \
        ro.gfx.angle.supported=false \
        debug.sf.disable_hwc_vds=1 \
        ro.vendor.hwcomposer.mode=client

# OpenGL ES version
# ro.opengles.version=65535 # OpenGL ES 1.0
# ro.opengles.version=65536 # OpenGL ES 1.1
# ro.opengles.version=131072 # OpenGL ES 2.0
# ro.opengles.version=196608 # OpenGL ES 3.0
# ro.opengles.version=196609 # OpenGL ES 3.1
# ro.opengles.version=196610 # OpenGL ES 3.2
PRODUCT_VENDOR_PROPERTIES += \
	ro.opengles.version=196609

# PRODUCT_VENDOR_PROPERTIES += \
#         mesa.libgl.always.software=true \
#         mesa.android.no.kms.swrast=true

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.opengles.deqp.level-2021-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.vulkan.version-1_4.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
	frameworks/native/data/etc/android.software.vulkan.deqp.level-2021-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level-2021-03-01.xml

endif
