export THEOS=/private/var/theos
ARCHS = arm64 arm64e
TARGET = iphone:clang:10.3:10.3

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LBVib

LBVib_FILES = Tweak.x
LBVib_CFLAGS = -fobjc-arc
LBVib_FRAMEWORKS = UIKit AudioToolbox

include $(THEOS_MAKE_PATH)/tweak.mk
