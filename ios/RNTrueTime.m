#import "RNTrueTime.h"

@import TrueTime;

static bool initialised = false;

@implementation RNTrueTime

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

+ (bool)initialised; {
    return initialised;
}

+ (void)setInitialised:(BOOL)value; {
    initialised = value;
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(initTrueTime:(RCTPromiseResolveBlock)resolve
                      rejecter:(RCTPromiseRejectBlock)reject)
{
    // grab reference to shared true time singleton
    TrueTimeClient *client = [TrueTimeClient sharedInstance];
    // first call wins
    if (initialised == false) {
        // prevent invoking startWithPool again
        intialiased = true;
        // safe to initialise
        [client startWithPool:@[@"time.apple.com"] port:123];
        // resolve
        resolve(@"initialised");
    }
    else {
        // resolve
        resolve(@"already initialised");
    }
}

RCT_EXPORT_METHOD(getTrueTime:(RCTPromiseResolveBlock)resolve
                     rejecter:(RCTPromiseRejectBlock)reject)
{
    // grab true time shared instance
    TrueTimeClient *client = [TrueTimeClient sharedInstance];
    // grab true time without fear of user messing with their system clock
    // block waiting for fetch, use the following:-
    [client fetchIfNeededWithSuccess:^(NTPReferenceTime *referenceTime) {
      // grab NSDate
      NSDate *now = [referenceTime now];
      // milliseconds since epoch
      long ms = (floor([now timeIntervalSince1970] * 1000));
      // resolve as a string
      NSString *msString = [NSString stringWithFormat:@"%ld", ms];
      // resolve the promise
      resolve(msString);
    } failure:^(NSError *error) {
      // reject with code, message (localized failure (String)) and the NSError itself
      reject([NSString stringWithFormat:@"%ld", (long)[error code]],
             [error localizedFailureReason],
             error);
    }];
}

@end
