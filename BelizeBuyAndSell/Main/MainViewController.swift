//
//  MainViewController.swift
//  BelizeBuyAndSell
//
//  Created by 辛忠翰 on 09/01/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        cv.register(BrowseCell.self, forCellWithReuseIdentifier: "BrowseCell")
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    lazy var tabBarView: MainTabBarView = {
        let tv = MainTabBarView()
        //切記一定要讓tv的mainVC給定值,MainViewController
        tv.mainVC = self
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let takePhotoButton: UIButton = {
       let btn = UIButton(type: .custom)
        btn.setBackgroundColor(color: .white, forUIControlState: .normal)
        btn.setBackgroundColor(color: .gray, forUIControlState: .highlighted)
        btn.setImage(UIImage(named:"Add_icon"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageView?.clipsToBounds = true
        btn.addTarget(self, action: #selector(handleTakePhotoButton), for: .touchUpInside)
        btn.contentHorizontalAlignment = .fill
        btn.contentVerticalAlignment = .fill
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    @objc func handleTakePhotoButton(){
        print("Take photo!")
    }
    
    let titlelabel: UILabel = {
        let label = UILabel()
        label.text = "賣東西"
        label.textAlignment = .center
        label.textColor = .gray
        label.font = UIFont(name: "PingFangTC-Medium", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupTabBarView()
        setupTakePhotoButton()
    }
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        //TODO:需把view.topAnchor替換成navigationBar.bottomAncor，64為navigationBar的高度
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64).isActive = true
    }
    
    func setupTabBarView() {
       view.addSubview(tabBarView)
        tabBarView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tabBarView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        tabBarView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    func setupTakePhotoButton(){
        view.addSubview(takePhotoButton)
        takePhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        takePhotoButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        takePhotoButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        takePhotoButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        takePhotoButton.layoutIfNeeded()
        takePhotoButton.layer.cornerRadius = takePhotoButton.frame.height / 2
        takePhotoButton.layer.masksToBounds = true
        
        view.addSubview(titlelabel)
        titlelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titlelabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5).isActive = true
        titlelabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        titlelabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func scrollToIndex(itemIndex: Int) {
        let indexPath = IndexPath(item: itemIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .init(rawValue: 0), animated: true)
    }
    
}


extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrowseCell", for: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        //可以找到每個cell最左上方的點的位置
        //換言之可以得到每個cell的起始位置
        //當滑動cell時觸發
        var cellIndex = targetContentOffset.pointee.x / view.frame.width
        if cellIndex >= 2{
            cellIndex += 1
        }
        let indexPath = IndexPath(item: Int(cellIndex), section: 0)
        
        tabBarView.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 64*2)
    }
    
}


