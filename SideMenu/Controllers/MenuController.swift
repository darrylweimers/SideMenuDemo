//
//  MenuController.swift
//  SideMenu
//
//  Created by Darryl Weimers on 2020-09-17.
//  Copyright © 2020 Darryl Weimers. All rights reserved.
//

import UIKit

class MenuController: UIViewController {

    // MARK: properties
    var tableView: UITableView!
    var delegate: HomeControllerDelegate?
    
    // MARK: init
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        super.loadView()
        
        tableView = createTableView(superview: self.view)
    }
    
    // MARK: handlers

}

extension MenuController : UITableViewDelegate, UITableViewDataSource {
    
    func createTableView(superview: UIView) -> UITableView {
        let tableView = UITableView()
        
        // configuration
        tableView.separatorStyle = .none
        tableView.separatorInset = .zero
        tableView.backgroundColor = .darkGray
        tableView.rowHeight = 60
        
        // delegate
        tableView.delegate = self
        tableView.dataSource = self
        
        // cell
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: MenuOptionCell.reuseIdentifier)
        
        // layout
        tableView.translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: superview.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
        ])
        
        return tableView
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Menu.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuOptionCell.reuseIdentifier, for: indexPath) as? MenuOptionCell else {
            fatalError("Can't create menu cell!")
        }
        
        let menuOption = Menu(rawValue: indexPath.row)
        // item
        cell.titleLabel.text = menuOption?.description
        cell.iconImageView.image = menuOption?.image
        // color
        cell.titleLabel.textColor = .white
        cell.iconImageView.tintColor = .white
        cell.contentView.backgroundColor = .darkGray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Menu"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let option = Menu(rawValue: indexPath.row)
        delegate?.toggleMenu(forOption: option)
    }
    
}
