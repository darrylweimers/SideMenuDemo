//
//  SettingController.swift
//  SideMenu
//
//  Created by Darryl Weimers on 2020-09-19.
//  Copyright © 2020 Darryl Weimers. All rights reserved.
//

import UIKit

class SettingController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureNavbar()
    }
    
    
    func configureNavbar() {
        self.navigationItem.title = "Settings"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        // required to disable blur effect & allow barTintColor to work
        //self.navigationController?.navigationBar.isTranslucent = false
        
        
        
//        self.navigationController?.navigationBar.barStyle = .black
//        self.navigationController?.navigationBar.barTintColor = .darkGray
        
        
        
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.configureWithOpaqueBackground()
//        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//        navBarAppearance.backgroundColor = .darkGray
//        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
//        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
    }
    
    @objc func handleDone() {
        dismiss(animated: true, completion: nil)
    }
    

}
