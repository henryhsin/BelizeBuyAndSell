//
//  MainTabBarCell.swift
//  BelizeBuyAndSell
//
//  Created by 辛忠翰 on 09/01/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit

class MainTabBarCell: BasicCell {
    
    let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "Browse_icon")
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let titlelabel: UILabel = {
        let label = UILabel()
        label.text = "瀏覽"
        label.textAlignment = .center
        label.textColor = .gray
        label.font = UIFont(name: "PingFangTC-Medium", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupViews() {
        setupImageView()
    }
    
    var imgViewHightLayout: NSLayoutConstraint?
    func setupImageView() {
        addSubview(titlelabel)
        titlelabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        titlelabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titlelabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        titlelabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        imgViewHightLayout?.isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.bottomAnchor.constraint(equalTo: titlelabel.topAnchor, constant: 0).isActive = true
    }
    
    override var isHighlighted: Bool{
        didSet{
            imageView.tintColor = isHighlighted ? UIColor.red :  UIColor.rgb(red: 128, green: 128, blue: 128)
            titlelabel.textColor = isHighlighted ? UIColor.red :  UIColor.rgb(red: 128, green: 128, blue: 128)
            
        }
    }
    
    override var isSelected: Bool{
        didSet{
            imageView.tintColor = isSelected ? UIColor.red : UIColor.rgb(red: 128, green: 128, blue: 128)
            titlelabel.textColor = isSelected ? UIColor.red : UIColor.rgb(red: 128, green: 128, blue: 128)
        }
    }
}


