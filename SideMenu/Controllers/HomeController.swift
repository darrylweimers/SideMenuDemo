//
//  HomeController.swift
//  SideMenu
//
//  Created by Darryl Weimers on 2020-09-17.
//  Copyright © 2020 Darryl Weimers. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    // MARK: properties
    var delegate: HomeControllerDelegate?
    
    // MARK: init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        configureNavigationBar()
    }
    
    // MARK: handlers
    @objc func handleMenuToggle() {
        delegate?.toggleMenu(forOption: nil)
    }

}

// navigation controller
extension HomeController {
    
    func configureNavigationBar() {
        let image = UIImage(systemName: "line.horizontal.3.decrease")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleMenuToggle))
        self.navigationItem.title = "Side Menu"
    }
    
}
