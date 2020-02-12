//
//  TableViewCell.swift
//  MyApp
//
//  Created by Chaithra on 12/02/20.
//  Copyright © 2020 chaithra. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let padding: CGFloat = 10
    lazy var imageview = UIImageView()
    lazy var titleLabel = UILabel()
    lazy var descriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUI()
    }
    
    //MARK: - Setup of UI
    func setUI() {
         self.heightAnchor.constraint(greaterThanOrEqualToConstant: (100+(2*padding))).isActive = true
        
        setImage()
        setTitleLabel()
        setDescriptionLabel()
    }
    
    func setImage() {
        imageview.image = UIImage.init(named: "placeholder")
        imageview.contentMode = .scaleAspectFit
        self.addSubview(imageview)
        
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding).isActive = true
        imageview.topAnchor.constraint(equalTo: self.topAnchor, constant: padding).isActive = true
        imageview.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageview.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setTitleLabel() {
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.lineBreakMode = .byWordWrapping
        self.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: self.imageview.trailingAnchor, constant: padding).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: padding).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding).isActive = true
    }
    
    func setDescriptionLabel() {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.lineBreakMode = .byWordWrapping
        self.addSubview(descriptionLabel)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leadingAnchor.constraint(equalTo: self.imageview.trailingAnchor, constant: padding).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: (padding/2)).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding).isActive = true
        descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -padding).isActive = true
    }
    
    //MARK: - Set data
    func setCountryData(_ data: Country) {
        self.titleLabel.text = data.title
        self.descriptionLabel.text = data.description
    }
    
    func setImage(with url: String?) {
        
    }
}
