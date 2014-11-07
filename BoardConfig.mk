include $(GENERIC_X86_CONFIG_MK)
LOCAL_PATH := device/asus/zenfone5
REF_PRODUCT_NAME := redhookbay
TARGET_BOARD_PLATFORM := clovertrail
TARGET_ARCH := x86
TARGET_ARCH_VARIANT := x86-atom
TARGET_CPU_ABI := x86
TARGET_CPU_VARIANT := x86
TARGET_CPU_ABI2 := armeabi-v7a
TARGET_BOOTLOADER_BOARD_NAME := revolution
TARGET_CPU_SMP := true
TARGET_PRELINK_MODULE := false
INTEL_INGREDIENTS_VERSIONS := true

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Atom optimizations to improve memory benchmarks.
-include $(LOCAL_PATH)/OptAtom.mk

TARGET_RIL_DISABLE_STATUS_POLLING := true
TARGET_PHONE_HAS_OEM_LIBRARY := true

COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/asus/zenfone5/releasetools/ota_from_target_files

# Security
BUILD_WITH_WATCHDOG_DAEMON_SUPPORT := true
HAVE_SELINUX := true
BOARD_SEPOLICY_DIRS += device/asus/zenfone5/sepolicy
BOARD_SEPOLICY_UNION +=\
	file_contexts \
	seapp_contexts \
	file.te \
	genfs_contexts \
	fs_use \
	device.te \
	healthd.te \
	app.te \
	untrusted_app.te \
	surfaceflinger.te \
	vold.te \
	ecryptfs.te \
	zygote.te \
	netd.te \
	isolated_app.te

# OTA
USE_SET_METADATA := false

# Make settings
TARGET_NO_RECOVERY := false
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

BOARD_KERNEL_CMDLINE := init=/init pci=noearly console=logk0 earlyprintk=nologger loglevel=0 kmemleak=off androidboot.bootmedia=sdcard androidboot.hardware=redhookbay watchdog.watchdog_thresh=60 androidboot.spid=0000:0000:0003:0002:0000:0021 androidboot.serialno=Medfield988F3F96                 ip=50.0.0.2:50.0.0.1::255.255.255.0::usb0:on vmalloc=172M androidboot.wakesrc=06 androidboot.mode=main
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# fix this up by examining /proc/mtd on a running device
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 805306368
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2533342208
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_DATA_DEVICE                       := /dev/block/mmcblk0p10
BOARD_DATA_FILESYSTEM                   := ext4
BOARD_CACHE_DEVICE                      := /dev/block/mmcblk0p6
BOARD_CACHE_FILESYSTEM                  := ext4
BOARD_SYSTEM_DEVICE                     := /dev/block/mmcblk0p9
BOARD_SYSTEM_FILESYSTEM                 := ext4

TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
DEVICE_BASE_BOOT_IMAGE := $(LOCAL_PATH)/boot.img

# skip doc from building
BOARD_SKIP_ANDROID_DOC_BUILD := true
BUILD_WITH_FULL_STAGEFRIGHT := true

# Use this flag if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_MAX_PARTITIONS := 21

# Ramdisk
TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_TARGET_RC := true

# Wifi
BOARD_HAVE_WIFI := true
BOARD_WLAN_DEVICE := bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA   := "/system/etc/firmware/fw_bcmdhd_43362.bin"
WIFI_DRIVER_FW_PATH_AP    := "/system/etc/firmware/fw_bcmdhd_43362_apsta.bin"
WIFI_DRIVER_MODULE_ARG := "iface_name=wlan0 firmware_path=/system/etc/wifi/fw_bcmdhd_43362.bin"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF :=  $(LOCAL_PATH)/bt_vendor.conf

# GPS
BOARD_HAVE_GPS := true

# select libcamera2 as the camera HAL
USE_CAMERA_HAL2 := true

# Hack to use AVC to encode camera videos.
TARGET_NO_METADATA_ON_AVC_ENC := true

#HW_Renderer
USE_OPENGL_RENDERER	:= true
BOARD_EGL_CFG := $(LOCAL_PATH)/egl.cfg
BOARD_USES_HWCOMPOSER := true
BOARD_ALLOW_EGL_HIBERNATION := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

USE_INTEL_MDP := true
BOARD_USE_LIBVA_INTEL_DRIVER := true
BOARD_USE_LIBVA := true
BOARD_USE_LIBMIX := true
BOARD_USES_WRS_OMXIL_CORE := true

# Force the screenshot path to CPU consumer
COMMON_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH

# Enable WEBGL in WebKit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# Turn on GR_STATIC_RECT_VB flag in skia to boost performance
TARGET_USE_GR_STATIC_RECT_VB := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_SKIA_LCDTEXT := true

# Enable dalvik startup with a low memory footprint
TARGET_ARCH_LOWMEM := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
DEVICE_RESOLUTION := 720x1280
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/init/recovery.fstab
TARGET_PREBUILT_RECOVERY_KERNEL := $(LOCAL_PATH)/kernel
TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/init/recovery.init.redhookbay.rc
RECOVERY_SDCARD_ON_DATA := true
