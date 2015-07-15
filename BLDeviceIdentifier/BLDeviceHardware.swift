//
//  BLDeviceHardware.swift
//  BLDeviceIdentifier
//
//  Created by Linkou Bian on 7/15/15.
//  Copyright (c) 2015 Balloonsys Inc. All rights reserved.
//

import Foundation

/** BLDeviceHardware as a simple class to allow fetching model descriptions from an iOS device
 */
class BLDeviceHardware {
    
    /**
     * The model name of the device. For example, `iPhone5,3`, `iPad3,1`, `iPod5,1`
     * @return The current devices model name as a string
     */
    class func platform() -> String? {
        
        if let key = "hw.machine".cStringUsingEncoding(NSUTF8StringEncoding) {
            var size: Int = 0
            sysctlbyname(key, nil, &size, nil, 0)
            
            var machine = [CChar](count: Int(size), repeatedValue: 0)
            sysctlbyname(key, &machine, &size, nil, 0)
            
            return String.fromCString(machine)!
        }
        
        return nil
    }
    
    /**
     * The human readable platform string. For example, `iPhone 5C (GSM)`, `iPad 3 (WiFi)`, `iPod Touch 5G`.
     * @return The current devices platform string in a human readable format
     */
    class func platformString() -> String? {
        
        if let platform = self.platform() {
            switch platform {
            case "iPhone1,2": return "iPhone 3G"
            case "iPhone2,1": return "iPhone 3GS"
            case "iPhone3,1": return "iPhone 4 (GSM)"
            case "iPhone3,2": return "iPhone 4 (GSM Rev A)"
            case "iPhone3,3": return "iPhone 4 (CDMA)"
            case "iPhone4,1": return "iPhone 4S"
            case "iPhone5,1": return "iPhone 5 (GSM)"
            case "iPhone5,2": return "iPhone 5 (GSM+CDMA)"
            case "iPhone5,3": return "iPhone 5C (GSM)"
            case "iPhone5,4": return "iPhone 5C (GSM+CDMA)"
            case "iPhone6,1": return "iPhone 5S (GSM)"
            case "iPhone6,2": return "iPhone 5S (GSM+CDMA)"
            case "iPhone7,1": return "iPhone 6 Plus"
            case "iPhone7,2": return "iPhone 6"
            case "iPod1,1": return "iPod Touch 1G"
            case "iPod2,1": return "iPod Touch 2G"
            case "iPod3,1": return "iPod Touch 3G"
            case "iPod4,1": return "iPod Touch 4G"
            case "iPod5,1": return "iPod Touch 5G"
            case "iPad1,1": return "iPad 1"
            case "iPad2,1": return "iPad 2 (WiFi)"
            case "iPad2,2": return "iPad 2 (GSM)"
            case "iPad2,3": return "iPad 2 (CDMA)"
            case "iPad2,4": return "iPad 2"
            case "iPad2,5": return "iPad Mini (WiFi)"
            case "iPad2,6": return "iPad Mini (GSM)"
            case "iPad2,7": return "iPad Mini (GSM+CDMA)"
            case "iPad3,1": return "iPad 3 (WiFi)"
            case "iPad3,2": return "iPad 3 (GSM+CDMA)"
            case "iPad3,3": return "iPad 3 (GSM)"
            case "iPad3,4": return "iPad 4 (WiFi)"
            case "iPad3,5": return "iPad 4 (GSM)"
            case "iPad3,6": return "iPad 4 (GSM+CDMA)"
            case "iPad4,1": return "iPad Air (WiFi)"
            case "iPad4,2": return "iPad Air (WiFi/Cellular)"
            case "iPad4,3": return "iPad Air (China)"
            case "iPad4,4": return "iPad Mini Retina (WiFi)"
            case "iPad4,5": return "iPad Mini Retina (WiFi/Cellular)"
            case "iPad4,6": return "iPad Mini Retina (China)"
            case "iPad4,7": return "iPad Mini 3 (WiFi)"
            case "iPad4,8": return "iPad Mini 3 (WiFi/Cellular)"
            case "iPad5,3": return "iPad Air 2 (WiFi)"
            case "iPad5,4": return "iPad Air 2 (WiFi/Cellular)"
            case "i386": return "Simulator"
            case "x86_64": return "Simulator"
            default: return nil
            }
        }
        
        return nil
    }
}
