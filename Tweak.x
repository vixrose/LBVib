#import <UIKit/UIKit.h>
#import <UIKit/UIDevice.h>
#import <AudioToolbox/AudioServices.h>

static BOOL isEnabled = YES;
float userPercent1;
float userPercent2;

float currentPercent;
float lastPercent;
float alertPercent1 = .2;
float alertPercent2 = .1;

%group LBVib

%hook UIDevice

  -(void)_setBatteryLevel:(float)arg1 {

    %orig;

    currentPercent = [self batteryLevel];

    if ((currentPercent == alertPercent1 || currentPercent == alertPercent2) && !(currentPercent >= lastPercent)) {
      AudioServicesPlaySystemSound(1521);
      AudioServicesPlaySystemSound(1521);
    }

    lastPercent = currentPercent;

  }

%end

%end

static void loadPrefs() {
  NSDictionary *settings = [NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.vixrose.lbvib.plist"];
  isEnabled = ([settings objectForKey:@"Enabled"] ? [[settings objectForKey:@"Enabled"] boolValue] : isEnabled);
  userPercent1 = [(NSString*)[settings objectForKey:@"userPercent1"] floatValue];
  userPercent2 = [(NSString*)[settings objectForKey:@"userPercent2"] floatValue];
}

%ctor {
  loadPrefs();
  alertPercent1 = (userPercent1 / 100);
  alertPercent2 = (userPercent2 / 100);
	if(isEnabled) {
		%init(LBVib);
	}
}
