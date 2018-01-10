//
//  MainTabBarView.swift
//  BelizeBuyAndSell
//
//  Created by 辛忠翰 on 09/01/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit

class MainTabBarView: BasicView {
    let imgs = ["Browse_icon","Group_icon","","Timeline_icon", "Personal_icon"]
    let imgNames = ["瀏覽", "社團", "", "動態", "我"]
    //In order to call the function "scrollItemAtIndex(:)" in MainViewController, we need to use mainVC
    var mainVC: MainViewController?
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        cv.register(MainTabBarCell.self, forCellWithReuseIdentifier: "MainTabBarCell")
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    override func setupViews() {
        setupCollectionView()
        //一進到畫面就讓scrollView選擇item = 0, section = 0
        let selectionIndexPath = NSIndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectionIndexPath as IndexPath, animated: false, scrollPosition: .top)
        
    }
    
    func setupCollectionView() {
        addSubview(collectionView)
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

}


extension MainTabBarView: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainTabBarCell", for: indexPath) as! MainTabBarCell
        //因為imageView目前被包在collectionView裡面，所以需要在這裡讓他有.withRenderingMode(.alwaysTemplate)，才能換tintColor
        cell.imageView.image = UIImage(named: imgs[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor.rgb(red: 128, green: 128, blue: 128)
        cell.titlelabel.text = imgNames[indexPath.item]
        cell.layoutIfNeeded()
        print("GG")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item >= 2{
            //因為我們有5個tab，但卻只有4個view
            mainVC?.scrollToIndex(itemIndex: indexPath.item - 1)
        }else{
            mainVC?.scrollToIndex(itemIndex: indexPath.item)
        }
        
    }
}

extension MainTabBarView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/5, height: frame.height)
    }
    
    
}
