include $(THEOS)/makefiles/common.mk

ARCHS = arm64 arm64e

BUNDLE_NAME = LBVib

LBVib_FILES = LBVRootListController.m
LBVib_INSTALL_PATH = /Library/PreferenceBundles
LBVib_FRAMEWORKS = UIKit
LBVib_PRIVATE_FRAMEWORKS = Preferences
LBVib_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/LBVib.plist$(ECHO_END)
