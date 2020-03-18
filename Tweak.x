#import <UIKit/UIKit.h>
#import <UIKit/UIDevice.h>
#import <AudioToolbox/AudioServices.h>

float currentPercent;
float lastPercent;
float alertPercent1 = .2;
float alertPercent2 = .1;

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
