//
//  BannerViewCellInBannerCell.swift
//  BelizeBuyAndSell
//
//  Created by 辛忠翰 on 09/01/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit

class BannerViewCellInBannerCell: BasicCell {
    var currentIndexPath: IndexPath?
    
    let titlelabel: UILabel = {
        let label = UILabel()
        label.text = "瀏覽嚴選商品"
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
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.addSubview(titlelabel)
        titlelabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        titlelabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -30).isActive = true
        titlelabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titlelabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
