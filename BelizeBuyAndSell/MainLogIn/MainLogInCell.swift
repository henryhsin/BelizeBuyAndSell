//
//  LogInCell.swift
//  BelizeBuyAndSell
//
//  Created by 辛忠翰 on 05/01/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit

class MainLogInCell: BasicCell {
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "30秒拍照、上傳、拍賣"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "PingFangTC-Medium", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "拍張照片，加上商品敘述，標上價格。就是這麼簡單！免費APP!"
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont(name: "PingFangTC-Medium", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    override func setupViews() {
        backgroundColor = .green
        setupImageView()
        setupTitleLabel()
        setupSubTitleLabel()
    }
    
    func setupImageView() {
        addSubview(imageView)
        setupGradientLayer()
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.3, 1.0]
        imageView.layer.addSublayer(gradientLayer)
    }
    
    func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupSubTitleLabel() {
        addSubview(subTitleLabel)
        subTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        subTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        subTitleLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
