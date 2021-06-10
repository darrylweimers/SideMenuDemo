//
//  AppDeletateExtensions.swift
//  SideMenu
//
//  Created by Darryl Weimers on 2020-09-19.
//  Copyright © 2020 Darryl Weimers. All rights reserved.
//

import UIKit

extension AppDelegate {
    
    static func configureNavigationBar(barTintColor: UIColor, tintColor: UIColor, titleTextColor: UIColor) {
        
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.configureWithOpaqueBackground()
//        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//        navBarAppearance.backgroundColor = .darkGray
//        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
//        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.configureWithOpaqueBackground()
        
        // background color of navigation bar
        UINavigationBar.appearance().barTintColor = barTintColor
        
        // affects the color of back indicator image, button titles, button images. IT DOES NOT AFFECT THE NAVIGATION BAR TITLE COLOR
        UINavigationBar.appearance().tintColor = tintColor

        // change navigation item title color
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleTextColor]
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().backgroundColor = barTintColor
    }
    
}
