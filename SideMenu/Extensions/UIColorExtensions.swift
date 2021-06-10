//
//  UIColorExtensions.swift
//  SideMenu
//
//  Created by Darryl Weimers on 2020-09-19.
//  Copyright © 2020 Darryl Weimers. All rights reserved.
//

import UIKit

public extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    static func from(rgbHex: UInt32, alpha: CGFloat = 1.0) -> UIColor {
        let red = CGFloat((rgbHex & 0xFF0000) >> 16) / 256.0
        let green = CGFloat((rgbHex & 0xFF00) >> 8) / 256.0
        let blue = CGFloat(rgbHex & 0xFF) / 256.0

        return UIColor(red:red, green:green, blue:blue, alpha: alpha)
    }
}
