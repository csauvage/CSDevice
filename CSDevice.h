//
//  CSDeviceType.h
//  CCE
//
//  Created by Clément Sauvage on 16/03/2014.
//  Copyright (c) 2014 Kalokod. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSDevice : NSObject

+ (NSString *) platformStr;

+ (BOOL) isiPod;
+ (BOOL) isiPhone;
+ (BOOL) isiPhoneWithRetinaDisplay;
+ (BOOL) isWideScreeniPhone;
+ (BOOL) isUltraWideScreeniPhone;

+ (BOOL) isiPad;
+ (BOOL) isiPadWithRetinaDisplay;
+ (BOOL) isiPadWithCellular;
+ (BOOL) isRetinaDisplay;

+ (BOOL) is64bitArchitecture;
+ (BOOL) isSimulator;

+ (NSUInteger) getScreenWidth;
+ (NSUInteger) getScreenHeight;

@end