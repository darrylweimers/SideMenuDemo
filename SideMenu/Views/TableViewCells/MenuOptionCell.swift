//
//  MenuOptionCell.swift
//  SideMenu
//
//  Created by Darryl Weimers on 2020-09-19.
//  Copyright © 2020 Darryl Weimers. All rights reserved.
//

import UIKit

class MenuOptionCell: UITableViewCell {
    static let reuseIdentifier = "\(MenuOptionCell.self)"
    
    var iconImageView: UIImageView!
    var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel = createLabel()
        iconImageView = createImageView()
        layoutViews(superview: self.contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        reset()
    }
    
    // layout
    func layoutViews(superview: UIView) {
        guard let imageView = self.iconImageView, let label = self.titleLabel else { return }
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
       
        // group
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        // constraint
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        
        [label, imageView].forEach( { stackView.addSubview($0) } )
        
        // add to superview
        [stackView].forEach( { superview.addSubview($0) } )
        
        // layout
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: superview.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -8),
            stackView.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -8),
        ])
    }
    
    func reset() {
        
    }
    
    // create
    func createLabel() -> UILabel {
        let label = UILabel(frame: .zero)
        label.text = nil
        label.backgroundColor = .clear
        return label
    }
    
    func createImageView() -> UIImageView {
        let imageView = UIImageView(frame: .zero)
        let image = UIImage(systemName: "circle.fill")
        imageView.image = image
        image?.withTintColor(.blue)
        return imageView
    }
}


