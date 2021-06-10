//
//  ViewControllerExtensions.swift
//  SideMenu
//
//  Created by Darryl Weimers on 2020-09-19.
//  Copyright © 2020 Darryl Weimers. All rights reserved.
//

import UIKit


// view controller containment
// allows use to embed controller inside another
public extension UIViewController {
    
    func display(contentController: UIViewController) {
        addChild(contentController)
        //self.view.addSubview(contentController.view)
        self.view.insertSubview(contentController.view, at: 0)
        contentController.didMove(toParent: self)
    }
    
    func hide(contentController: UIViewController) {
        contentController.willMove(toParent: nil)
        contentController.view.removeFromSuperview()
        contentController.removeFromParent()
    }    
}
