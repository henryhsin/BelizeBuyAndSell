//
//  BrowseCell.swift
//  BelizeBuyAndSell
//
//  Created by 辛忠翰 on 09/01/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit

class BrowseCell: BasicCell {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(BannerCellInBrowseCell.self, forCellWithReuseIdentifier: "BannerCellInBrowseCell")
        cv.register(ItemSpeciesCell.self, forCellWithReuseIdentifier: "ItemSpeciesCell")
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    override func setupViews() {
        setupCollectionView()
    }
    
    func setupCollectionView() {
        addSubview(collectionView)
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}


extension BrowseCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cellId = ""
        if indexPath.item == 0{
            cellId = "BannerCellInBrowseCell"
        }else{
            cellId = "ItemSpeciesCell"
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
}


extension BrowseCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat
        var height: CGFloat
        if indexPath.item == 0{
            width = frame.width
            height = width * 9 / 16
        }else{
            width = (frame.width - 10) / 2
            height = width * 9 / 16
        }
        return CGSize(width: width, height: height)
    }
    
    
}
