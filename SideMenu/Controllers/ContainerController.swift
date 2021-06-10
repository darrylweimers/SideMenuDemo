//
//  ContainerViewController.swift
//  SideMenu
//
//  Created by Darryl Weimers on 2020-09-17.
//  Copyright © 2020 Darryl Weimers. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {

    // MARK: properties
    var menuController: MenuController!
    var centerController: UIViewController!
    
    var expanded = false
    var panGestureRecognizer: UIPanGestureRecognizer!
    
    // MARK: init
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
        configureHomeController()
        addScreenEdgePanGestureRecognizer()
    }
    
    // status bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersStatusBarHidden: Bool {
        return expanded
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    func configureHomeController() {
        let homeController = HomeController()
        homeController.delegate = self
        
        centerController = UINavigationController(rootViewController: homeController)
        display(contentController: centerController)
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
        
    }
}

// menu controller
extension ContainerController {
    
    func configureMenuController() {
        if menuController == nil {
            menuController = MenuController()
            menuController.delegate = self
            display(contentController: menuController)
            print("setup menu controller")
        }
    }
    
    func showMenuController(expand: Bool, option: Menu?) {

        if (expand) {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut) {
                self.centerController.view.frame.origin.x = 0
            } completion: { (_) in
                guard let menuOption = option else { return }
                self.didSelectMenuOption(option: menuOption)
            }
        }
        
        self.animateStatusBar()
    }
    
    func didSelectMenuOption(option: Menu) {
        print("\(option.description)")
        switch option {
        case .profile:
            return
        case .inbox:
            return
        case .notifications:
            return
        case .settings:
            let settingController = SettingController()
            let navigationController = UINavigationController(rootViewController: settingController)
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true, completion: nil)
            return
        }
    }
}


extension ContainerController : HomeControllerDelegate {
    
    func toggleMenu(forOption menuOption: Menu?) {
        if !expanded {
            configureMenuController()
        }
        
        expanded = !expanded
        showMenuController(expand: expanded, option: menuOption)
    }
        
}

extension ContainerController : UIGestureRecognizerDelegate {
    
    func addPanGestureRecognizer() {
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        self.centerController.view.addGestureRecognizer(panGestureRecognizer)
    }
    
    func removePanGestureRecognizer() {
        if panGestureRecognizer != nil {
            self.centerController.view.removeGestureRecognizer(panGestureRecognizer)
        }
    }
    
    func addScreenEdgePanGestureRecognizer() {
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        edgePan.edges = .left
        self.centerController.view.addGestureRecognizer(edgePan)
    }
    
    @objc func handlePanGesture(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        let gestureIsDraggingFromLeftToRight = (recognizer.velocity(in: view).x > 0)
        print("recognizer velocity in view x: \(recognizer.velocity(in: view).x)")
        
        switch recognizer.state {
        case .began:
            print("began:")
            if !expanded {
                if gestureIsDraggingFromLeftToRight {
                    configureMenuController()
                }
            }
        case .changed:
            print("changed:")
            if gestureIsDraggingFromLeftToRight {
                if let rview = recognizer.view {
                  rview.center.x = rview.center.x + recognizer.translation(in: view).x
                  recognizer.setTranslation(CGPoint.zero, in: view)
                }
            }
        case .ended:
            print("ended:")
            if let recognizerView = recognizer.view {
            let hasMovedGreaterThanHalfway = recognizerView.center.x > view.bounds.size.width
                if hasMovedGreaterThanHalfway {
                    toggleMenu(forOption: nil)
                    addPanGestureRecognizer()
                } else {
                    showMenuController(expand: false, option: nil)
                    removePanGestureRecognizer()
                }
            }

        default:
          break
        }

    }
    
}
