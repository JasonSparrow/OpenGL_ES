//
//  XLDevice.swift
//  BiYou
//
//  Created by 王腾飞 on 2018/7/19.
//  Copyright © 2018年 比优心理. All rights reserved.
//

import UIKit

class BYMediaDevice: NSObject {
    static let deviceWidth = BYMediaDevice.getScreenRect().width
    static let deviceHeight = BYMediaDevice.getScreenRect().height
    static let safeAreaTopHeight = BYMediaDevice.getSafeAreaTopHeight()
    static let safeAreaBottomHeight = BYMediaDevice.getSafeAreaBottomHeight()
    static let isIphonePlus = BYMediaDevice.DeviceSzie.currentSize() == BYMediaDevice.DeviceSzie.DeviceType.inch5_5

    struct DeviceSzie {
        enum DeviceType {
            case inch3_5
            case inch4
            case inch4_7
            case inch5_5
            case iPhone_X
            case iPhone_X_Max
            case iPhone_XR
        }
        static func currentSize() -> DeviceType {
            switch (UIScreen.main.currentMode!.size.width,UIScreen.main.currentMode!.size.height) {
            case (640, 960):
                return .inch3_5
            case (640, 1136):
                return .inch4
            case (750, 1334):
                return .inch4_7
            case (1125, 2436):
                return .iPhone_X
            case (1242, 2688):
                return .iPhone_X_Max
            case (828, 1792):
                return .iPhone_XR
            case (1242, 2208):
                return .inch5_5
            default:
                return .inch4_7
            }
        }
    }
    
    private class func getScreenRect() -> CGRect {
        return UIScreen.main.bounds
    }
    private class func getSafeAreaTopHeight() -> CGFloat {
        return (UIScreen.main.bounds.size.height == 812.0 ? 88.0 : 64.0)
    }
    private class func getSafeAreaBottomHeight() -> CGFloat {
        return (UIScreen.main.bounds.size.height == 812.0 ? 83.0 : 49.0)
    }
    
    class func getHeightCoefficient() -> CGFloat {
        return (UIScreen.main.bounds.size.height == 812.0 ? 812.0 / 667.0 : 1)
    }
    
    class func getHeightWithHeight(height:CGFloat) -> CGFloat {
        return (UIScreen.main.bounds.size.width == 375 ? 1 : UIScreen.main.bounds.size.width / 375) * height
    }
    
    class func getWidthWithWidth(width:CGFloat) -> CGFloat {
        return (UIScreen.main.bounds.size.width == 375 ? 1 : UIScreen.main.bounds.size.width / 375) * width
    }
    
    class func isIphoneX() -> Bool {
        let devicesize = XLDevice.DeviceSzie.currentSize()
        switch devicesize {
        case .iPhone_X, .iPhone_X_Max, .iPhone_XR:
            return true
        default:
            return false
        }
    }
    
}
