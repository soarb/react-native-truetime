#import <UIKit/UIKit.h>
#import <TrueTime/TrueTime.h>

#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

@interface RNTrueTime : NSObject <RCTBridgeModule>

@end
  
