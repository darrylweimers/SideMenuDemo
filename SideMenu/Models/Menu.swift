//
//  MenuOptions.swift
//  SideMenu
//
//  Created by Darryl Weimers on 2020-09-19.
//  Copyright © 2020 Darryl Weimers. All rights reserved.
//

import UIKit

public enum Menu: Int, CaseIterable , CustomStringConvertible {
    
    case profile
    case inbox
    case notifications
    case settings
    
    public var description: String {
        switch(self) {
        case .profile:
            return "Profile"
        case .inbox:
            return "Inbox"
        case .notifications:
            return "Notifications"
        case .settings:
            return "Settings"
        }
    }
    
    public var image: UIImage {
        switch(self) {
        case .profile:
            return UIImage(systemName: "person.fill") ?? UIImage()
        case .inbox:
            return UIImage(systemName: "envelope.fill") ?? UIImage()
        case .notifications:
            return  UIImage(systemName: "bell.fill") ?? UIImage()
        case .settings:
            return UIImage(systemName: "line.horizontal.3") ?? UIImage()
        }
    }
    
}
