//
//  CSDeviceHardware.m
//  CCE
//
//  Created by Clément Sauvage on 16/03/2014.
//  Copyright (c) 2014 Kalokod. All rights reserved.
//

#import "CSDevice.h"
#include <sys/types.h>
#include <sys/sysctl.h>

typedef enum {
  
    CSDeviceHardwareiPhone1G,
    
    CSDeviceHardwareiPhone3G,
    
    CSDeviceHardwareiPhone3GS,
    
    CSDeviceHardwareiPhone4,
    CSDeviceHardwareiPhoneVerizon4,
    
    CSDeviceHardwareiPhone4S,
    
    CSDeviceHardwareiPhone5GSM,
    CSDeviceHardwareiPhone5CMDA,
    
    CSDeviceHardwareiPhone5CGSM,
    CSDeviceHardwareiPhone5CCMDA,
    
    CSDeviceHardwareiPhone5SGSM,
    CSDeviceHardwareiPhone5SCMDA,
    
    CSDeviceHardwareiPhone6,
    CSDeviceHardwareiPhone6Plus,
    
    CSDeviceHardwareiPodTouch1G,
    CSDeviceHardwareiPodTouch2G,
    CSDeviceHardwareiPodTouch3G,
    CSDeviceHardwareiPodTouch4G,
    CSDeviceHardwareiPodTouch5G,
    
    
    CSDeviceHardwareiPad,
    CSDeviceHardwareiPadGSM,
    
    CSDeviceHardwareiPad2WiFi,
    CSDeviceHardwareiPad2GSM,
    CSDeviceHardwareiPad2CDMA,
    
    CSDeviceHardwareiPadMiniWiFi,
    CSDeviceHardwareiPadMiniGSM,
    CSDeviceHardwareiPadMiniCDMA,
    
    CSDeviceHardwareiPad3WiFi,
    CSDeviceHardwareiPad3CDMA,
    CSDeviceHardwareiPad3GSM,
    
    CSDeviceHardwareiPad4WiFi,
    CSDeviceHardwareiPad4GSM,
    CSDeviceHardwareiPad4CDMA,
    
    CSDeviceHardwareiPadAirWiFi,
    CSDeviceHardwareiPadAirCellular,
    
    CSDeviceHardwareiPadmini2GWiFi,
    CSDeviceHardwareiPadmini2GCellular,
    
    CSDeviceHardwareSimulatori386,
    CSDeviceHardwareSimulatorx86,
    
    CSDeviceHardwareUnknownHardware
    
} CSDeviceHardware;


@implementation CSDevice

+ (CSDeviceHardware) platform{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    
    free(machine);
    
    if ([platform isEqualToString:@"iPhone1,1"])    return CSDeviceHardwareiPhone1G;
    if ([platform isEqualToString:@"iPhone1,2"])    return CSDeviceHardwareiPhone3G;
    if ([platform isEqualToString:@"iPhone2,1"])    return CSDeviceHardwareiPhone3GS;
    if ([platform isEqualToString:@"iPhone3,1"])    return CSDeviceHardwareiPhone4;
    if ([platform isEqualToString:@"iPhone3,3"])    return CSDeviceHardwareiPhoneVerizon4;
    if ([platform isEqualToString:@"iPhone4,1"])    return CSDeviceHardwareiPhone4S;
    if ([platform isEqualToString:@"iPhone5,1"])    return CSDeviceHardwareiPhone5GSM;
    if ([platform isEqualToString:@"iPhone5,2"])    return CSDeviceHardwareiPhone5CMDA;
    if ([platform isEqualToString:@"iPhone5,3"])    return CSDeviceHardwareiPhone5CGSM;
    if ([platform isEqualToString:@"iPhone5,4"])    return CSDeviceHardwareiPhone5CCMDA;
    if ([platform isEqualToString:@"iPhone6,1"])    return CSDeviceHardwareiPhone5GSM;
    if ([platform isEqualToString:@"iPhone6,2"])    return CSDeviceHardwareiPhone5SCMDA;
    if ([platform isEqualToString:@"iPhone7,2"])    return CSDeviceHardwareiPhone6;
    if ([platform isEqualToString:@"iPhone7,1"])    return CSDeviceHardwareiPhone6Plus;
    
    if ([platform isEqualToString:@"iPod1,1"])      return CSDeviceHardwareiPodTouch1G;
    if ([platform isEqualToString:@"iPod2,1"])      return CSDeviceHardwareiPodTouch2G;
    if ([platform isEqualToString:@"iPod3,1"])      return CSDeviceHardwareiPodTouch3G;
    if ([platform isEqualToString:@"iPod4,1"])      return CSDeviceHardwareiPodTouch4G;
    if ([platform isEqualToString:@"iPod5,1"])      return CSDeviceHardwareiPodTouch5G;
    
    if ([platform isEqualToString:@"iPad1,1"])      return CSDeviceHardwareiPad;
    if ([platform isEqualToString:@"iPad2,1"])      return CSDeviceHardwareiPad2WiFi;
    if ([platform isEqualToString:@"iPad2,2"])      return CSDeviceHardwareiPad2GSM;
    if ([platform isEqualToString:@"iPad2,3"])      return CSDeviceHardwareiPad2CDMA;
    if ([platform isEqualToString:@"iPad2,4"])      return CSDeviceHardwareiPad2WiFi;
    if ([platform isEqualToString:@"iPad2,5"])      return CSDeviceHardwareiPadMiniWiFi;
    if ([platform isEqualToString:@"iPad2,6"])      return CSDeviceHardwareiPadMiniGSM;
    if ([platform isEqualToString:@"iPad2,7"])      return CSDeviceHardwareiPadMiniCDMA;
    if ([platform isEqualToString:@"iPad3,1"])      return CSDeviceHardwareiPad3WiFi;
    if ([platform isEqualToString:@"iPad3,2"])      return CSDeviceHardwareiPad3CDMA;
    if ([platform isEqualToString:@"iPad3,3"])      return CSDeviceHardwareiPad3GSM;
    if ([platform isEqualToString:@"iPad3,4"])      return CSDeviceHardwareiPad4WiFi;
    if ([platform isEqualToString:@"iPad3,5"])      return CSDeviceHardwareiPad4GSM;
    if ([platform isEqualToString:@"iPad3,6"])      return CSDeviceHardwareiPad4CDMA;
    if ([platform isEqualToString:@"iPad4,1"])      return CSDeviceHardwareiPadAirWiFi;
    if ([platform isEqualToString:@"iPad4,2"])      return CSDeviceHardwareiPadAirCellular;
    if ([platform isEqualToString:@"iPad4,4"])      return CSDeviceHardwareiPadmini2GWiFi;
    if ([platform isEqualToString:@"iPad4,5"])      return CSDeviceHardwareiPadmini2GCellular;
    
    if ([platform isEqualToString:@"i386"])         return CSDeviceHardwareSimulatori386;
    if ([platform isEqualToString:@"x86_64"])       return CSDeviceHardwareSimulatorx86;
    
    else                                            return CSDeviceHardwareUnknownHardware;
    

}

+ (NSString *) platformStr{
    
    CSDeviceHardware platform = [CSDevice platform];
    
    NSString *platformStr = [[NSString alloc]init];
    
    if (platform == CSDeviceHardwareiPhone1G)        platformStr = @"iPhone 1G";
    if (platform == CSDeviceHardwareiPhone3G)        platformStr = @"iPhone 3G";
    if (platform == CSDeviceHardwareiPhone3GS)       platformStr = @"iPhone 4 Verizon";
    if (platform == CSDeviceHardwareiPhone4)         platformStr = @"iPhone 4";
    if (platform == CSDeviceHardwareiPhoneVerizon4)  platformStr = @"Verizon iPhone 4";
    if (platform == CSDeviceHardwareiPhone4S)        platformStr = @"iPhone 4S";
    if (platform == CSDeviceHardwareiPhone5GSM)      platformStr = @"iPhone 5 (GSM)";
    if (platform == CSDeviceHardwareiPhone5CMDA)     platformStr = @"iPhone 5 (GSM+CDMA)";
    if (platform == CSDeviceHardwareiPhone5CGSM)     platformStr = @"iPhone 5c (GSM)";
    if (platform == CSDeviceHardwareiPhone5CCMDA)    platformStr = @"iPhone 5c (GSM+CDMA)";
    if (platform == CSDeviceHardwareiPhone5SGSM)     platformStr = @"iPhone 5s (GSM)";
    if (platform == CSDeviceHardwareiPhone5SCMDA)    platformStr = @"iPhone 5s (GSM+CDMA)";
    if (platform == CSDeviceHardwareiPhone6)        platformStr = @"iPhone 6 (GSM+CDMA)";
    if (platform == CSDeviceHardwareiPhone6Plus)    platformStr = @"iPhone 6 Plus (GSM+CDMA)";
    
    if (platform == CSDeviceHardwareiPodTouch1G)     platformStr = @"iPod Touch 1G";
    if (platform == CSDeviceHardwareiPodTouch2G)     platformStr = @"iPod Touch 2G";
    if (platform == CSDeviceHardwareiPodTouch3G)     platformStr = @"iPod Touch 3G";
    if (platform == CSDeviceHardwareiPodTouch4G)     platformStr = @"iPod Touch 4G";
    if (platform == CSDeviceHardwareiPodTouch5G)     platformStr = @"iPod Touch 5G";
    
    if (platform == CSDeviceHardwareiPad)            platformStr = @"iPad";
    if (platform == CSDeviceHardwareiPad2WiFi)       platformStr = @"iPad 2 (WiFi)";
    if (platform == CSDeviceHardwareiPad2GSM)        platformStr = @"iPad 2 (GSM)";
    if (platform == CSDeviceHardwareiPad2CDMA)       platformStr = @"iPad 2 (CDMA)";
    
    if (platform == CSDeviceHardwareiPadMiniWiFi)    platformStr = @"iPad Mini (WiFi)";
    if (platform == CSDeviceHardwareiPadMiniGSM)     platformStr = @"iPad Mini (GSM)";
    if (platform == CSDeviceHardwareiPadMiniCDMA)    platformStr = @"iPad Mini (GSM+CDMA)";
    
    if (platform == CSDeviceHardwareiPad3WiFi)       platformStr = @"iPad 3 (WiFi)";
    if (platform == CSDeviceHardwareiPad3GSM)        platformStr = @"iPad 3 (GSM+CDMA)";
    if (platform == CSDeviceHardwareiPad3CDMA)       platformStr = @"iPad 3 (GSM)";
    if (platform == CSDeviceHardwareiPad4WiFi)       platformStr = @"iPad 4 (WiFi)";
    
    if (platform == CSDeviceHardwareiPad4GSM)           platformStr = @"iPad 4 (GSM)";
    if (platform == CSDeviceHardwareiPad4CDMA)          platformStr = @"iPad 4 (GSM+CDMA)";
    if (platform == CSDeviceHardwareiPadAirWiFi)        platformStr = @"iPad Air (WiFi)";
    if (platform == CSDeviceHardwareiPadAirCellular)    platformStr = @"iPad Air (Cellular)";
    if (platform == CSDeviceHardwareiPadmini2GWiFi)     platformStr = @"iPad mini 2G (WiFi)";
    if (platform == CSDeviceHardwareiPadmini2GCellular) platformStr = @"iPad mini 2G (Cellular)";
    if (platform ==CSDeviceHardwareSimulatori386)       platformStr = @"Simulator i386";
    if (platform == CSDeviceHardwareSimulatorx86)       platformStr = @"Simulator x64";
    
    return platformStr;
    
}

+ (BOOL)isiPod {
    
    CSDeviceHardware device = [self platform];
  
    switch (device) {
        case CSDeviceHardwareiPodTouch1G :
        case CSDeviceHardwareiPodTouch2G :
        case CSDeviceHardwareiPodTouch3G :
        case CSDeviceHardwareiPodTouch4G :
        case CSDeviceHardwareiPodTouch5G :
            
            return YES;
            break;
            
        default:
            
            return NO;
            break;
    }
    
};

+ (BOOL) isiPhone {
    
    CSDeviceHardware device = [self platform];
    
    switch (device) {
        case CSDeviceHardwareiPhone1G :
        case CSDeviceHardwareiPhone3G :
        case CSDeviceHardwareiPhone3GS :
        case CSDeviceHardwareiPhone4 :
        case CSDeviceHardwareiPhoneVerizon4 :
        case CSDeviceHardwareiPhone4S :
        case CSDeviceHardwareiPhone5GSM :
        case CSDeviceHardwareiPhone5CMDA :
        case CSDeviceHardwareiPhone5CGSM :
        case CSDeviceHardwareiPhone5CCMDA :
        case CSDeviceHardwareiPhone5SGSM :
        case CSDeviceHardwareiPhone5SCMDA :
        case CSDeviceHardwareiPhone6 :
        case CSDeviceHardwareiPhone6Plus :
            
            return YES;
            break;
            
        default:
            return NO;
            break;
    }
    

}

+ (BOOL) isiPhoneWithRetinaDisplay {
    
    CSDeviceHardware device = [self platform];
    
    switch (device) {
        
        case CSDeviceHardwareiPhone4 :
        case CSDeviceHardwareiPhoneVerizon4 :
        case CSDeviceHardwareiPhone4S :
        case CSDeviceHardwareiPhone5GSM :
        case CSDeviceHardwareiPhone5CMDA :
        case CSDeviceHardwareiPhone5CGSM :
        case CSDeviceHardwareiPhone5CCMDA :
        case CSDeviceHardwareiPhone5SGSM :
        case CSDeviceHardwareiPhone5SCMDA :
        case CSDeviceHardwareiPhone6 :
        case CSDeviceHardwareiPhone6Plus :
            
            return YES;
            break;
            
        default:
            return NO;
            break;
    }
    
    return NO;
    
}

+ (BOOL) isWideScreeniPhone {
    
    CSDeviceHardware device = [self platform];
    
    switch (device) {
        
        case CSDeviceHardwareiPhone5GSM :
        case CSDeviceHardwareiPhone5CMDA :
        case CSDeviceHardwareiPhone5CGSM :
        case CSDeviceHardwareiPhone5CCMDA :
        case CSDeviceHardwareiPhone5SGSM :
        case CSDeviceHardwareiPhone5SCMDA :
            
            return YES;
            break;
            
        default:
            return NO;
            break;
    }

    
}

+ (BOOL) isUltraWideScreeniPhone {
    
    CSDeviceHardware device = [self platform];
    
    switch (device) {
            
        case CSDeviceHardwareiPhone6 :
        case CSDeviceHardwareiPhone6Plus :
            
            return YES;
            break;
            
        default:
            return NO;
            break;
    }
    
    
}

+ (BOOL) isiPad {
    
    
    CSDeviceHardware device = [self platform];
    
    switch (device) {
            
        case CSDeviceHardwareiPad :
        case CSDeviceHardwareiPad2WiFi :
        case CSDeviceHardwareiPad2GSM :
        case CSDeviceHardwareiPad2CDMA :
        case CSDeviceHardwareiPadMiniWiFi :
        case CSDeviceHardwareiPadMiniGSM :
        case CSDeviceHardwareiPadMiniCDMA :
        case CSDeviceHardwareiPad3WiFi :
        case CSDeviceHardwareiPad3GSM :
        case CSDeviceHardwareiPad3CDMA :
        case CSDeviceHardwareiPad4WiFi :
        case CSDeviceHardwareiPad4GSM :
        case CSDeviceHardwareiPad4CDMA :
        case CSDeviceHardwareiPadAirWiFi :
        case CSDeviceHardwareiPadAirCellular :
        case CSDeviceHardwareiPadmini2GWiFi :
        case CSDeviceHardwareiPadmini2GCellular :
        case CSDeviceHardwareSimulatori386 :
        case CSDeviceHardwareSimulatorx86 :
            
            return YES;
            break;
            
            
        default:
            return NO;
            break;
    }
    
}

+ (BOOL) isiPadWithRetinaDisplay {
    
    CSDeviceHardware device = [self platform];
    
    switch (device) {
        
        
        case CSDeviceHardwareiPad3WiFi :
        case CSDeviceHardwareiPad3CDMA :
        case CSDeviceHardwareiPad3GSM :
        case CSDeviceHardwareiPad4WiFi :
        case CSDeviceHardwareiPad4GSM :
        case CSDeviceHardwareiPad4CDMA :
        case CSDeviceHardwareiPadAirWiFi :
        case CSDeviceHardwareiPadAirCellular :
        case CSDeviceHardwareiPadmini2GWiFi :
        case CSDeviceHardwareiPadmini2GCellular :
            return YES;
            break;
            
        default:
            return NO;
            break;
    }
    
    

    
}

+ (BOOL) isiPadWithCellular {
    
    CSDeviceHardware device = [self platform];
    
    switch (device) {
        case CSDeviceHardwareiPad2GSM :
        case CSDeviceHardwareiPad2CDMA :
        case CSDeviceHardwareiPadMiniGSM :
        case CSDeviceHardwareiPadMiniCDMA :
        case CSDeviceHardwareiPad3CDMA :
        case CSDeviceHardwareiPad3GSM :
        case CSDeviceHardwareiPad4GSM :
        case CSDeviceHardwareiPad4CDMA :
        case CSDeviceHardwareiPadAirCellular :
        case CSDeviceHardwareiPadmini2GCellular :
            return YES;
            break;
            
        default:
            return NO;
            break;
    }
}

+ (BOOL) isRetinaDisplay {
    if ([self isiPhoneWithRetinaDisplay] || [self isiPadWithRetinaDisplay]) return YES;
    else                                                                    return NO;
}

+ (BOOL) is64bitArchitecture {
    
    CSDeviceHardware device = [self platform];
    
    switch (device) {
            
            
        case CSDeviceHardwareiPhone5SGSM :
        case CSDeviceHardwareiPhone5SCMDA :
        case CSDeviceHardwareiPadAirWiFi :
        case CSDeviceHardwareiPadAirCellular :
        case CSDeviceHardwareiPadmini2GWiFi :
        case CSDeviceHardwareiPadmini2GCellular :
            
            return YES;
            break;
            
        default:
            return NO;
            break;
    }
    

}

+ (BOOL) isSimulator {
    
    CSDeviceHardware device = [self platform];
    
    switch (device) {
            
            
        case CSDeviceHardwareSimulatorx86 :
        case CSDeviceHardwareSimulatori386 :
            
            return YES;
            break;
            
        default:
            return NO;
            break;
    }
    
    
}

+ (NSUInteger) getScreenWidth {
    
    CSDeviceHardware platform = [CSDevice platform];
    
    switch (platform) {
        case CSDeviceHardwareiPhone1G:
        case CSDeviceHardwareiPhone3G:
        case CSDeviceHardwareiPhone3GS:
        case CSDeviceHardwareiPhone4:
        case CSDeviceHardwareiPhoneVerizon4:
        case CSDeviceHardwareiPhone4S:
        case CSDeviceHardwareiPhone5GSM:
        case CSDeviceHardwareiPhone5CMDA:
        case CSDeviceHardwareiPhone5CGSM:
        case CSDeviceHardwareiPhone5CCMDA:
        case CSDeviceHardwareiPhone5SGSM:
        case CSDeviceHardwareiPhone5SCMDA:
            
            return 320;
            break;
            
            
        case CSDeviceHardwareiPhone6:
            
            return 375;
            break;
            
        case CSDeviceHardwareiPhone6Plus:
            
            return 414;
            break;
            
        case CSDeviceHardwareSimulatori386:
        case CSDeviceHardwareSimulatorx86:
        case CSDeviceHardwareUnknownHardware:
        default:
            
            return 320;
            break;
    }
    
    
    
    
    
}

+ (NSUInteger) getScreenHeight {
    
    CSDeviceHardware platform = [CSDevice platform];
    
    switch (platform) {
        case CSDeviceHardwareiPhone1G:
        case CSDeviceHardwareiPhone3G:
        case CSDeviceHardwareiPhone3GS:
        case CSDeviceHardwareiPhone4:
        case CSDeviceHardwareiPhoneVerizon4:
        case CSDeviceHardwareiPhone4S:
            
            return 480;
            break;
            
            
        case CSDeviceHardwareiPhone5GSM:
        case CSDeviceHardwareiPhone5CMDA:
        case CSDeviceHardwareiPhone5CGSM:
        case CSDeviceHardwareiPhone5CCMDA:
        case CSDeviceHardwareiPhone5SGSM:
        case CSDeviceHardwareiPhone5SCMDA:
            
            return 568;
            break;
            
            
        case CSDeviceHardwareiPhone6:
            
            return 667;
            break;
            
        case CSDeviceHardwareiPhone6Plus:
            
            return 736;
            break;
            
        case CSDeviceHardwareSimulatori386:
        case CSDeviceHardwareSimulatorx86:
        case CSDeviceHardwareUnknownHardware:
        default:
            return 480;
            break;
    }
    
    
    
    
    
}
@end
