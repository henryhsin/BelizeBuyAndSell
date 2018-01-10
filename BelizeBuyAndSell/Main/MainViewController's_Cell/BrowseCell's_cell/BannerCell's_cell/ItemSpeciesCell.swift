//
//  ItemSpeciesCell.swift
//  BelizeBuyAndSell
//
//  Created by 辛忠翰 on 09/01/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit

class ItemSpeciesCell: BasicCell {
    let titlelabel: UILabel = {
        let label = UILabel()
        label.text = "她的時尚"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "PingFangTC-Medium", size: 20)
        label.backgroundColor = UIColor.rgb(red: 0, green: 0, blue: 0, alpha: 0.1)
        label.layer.cornerRadius = 5.0
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "test1")
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    override func setupViews() {
        setupImageView()
    }
    
    func setupImageView() {
        addSubview(imageView)
        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.addSubview(titlelabel)
        titlelabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titlelabel.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant: 10).isActive = true
        titlelabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        titlelabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
   
}
