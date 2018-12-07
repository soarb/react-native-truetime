//
//  RNTrueTime.h
//  RNTrueTime
//
//  Created by Benji Soar on 07/12/2018.
//  Copyright © 2018 Benji Soar. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

@interface RNTrueTime : NSObject <RCTBridgeModule>

@end
