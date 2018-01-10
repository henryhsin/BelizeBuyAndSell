//
//  BannerCell.swift
//  BelizeBuyAndSell
//
//  Created by 辛忠翰 on 09/01/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit

class BannerCellInBrowseCell: BasicCell {
    let imgs = ["test1","test2","test3","test4"]
    var currentIndexPath: IndexPath?
    var oldOffSet: CGFloat = 0.0
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .red
        cv.delegate = self
        cv.dataSource = self
        cv.register(BannerViewCellInBannerCell.self, forCellWithReuseIdentifier: "BannerViewCellInBannerCell")
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    lazy var pageView: UIPageControl = {
        let pv = UIPageControl()
        pv.currentPage = 0
        pv.numberOfPages = imgs.count
        pv.pageIndicatorTintColor = .gray
        pv.currentPageIndicatorTintColor = .white
        pv.translatesAutoresizingMaskIntoConstraints = false
        return pv
    }()
    
    override func setupViews() {
        setupCollectionView()
        setupPageView()
        addTimer()
    }
    
    func setupCollectionView() {
        addSubview(collectionView)
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        collectionView.layoutIfNeeded()
        currentIndexPath = IndexPath(item: imgs.count, section: 0)
        collectionView.scrollToItem(at: currentIndexPath!, at: .centeredHorizontally, animated: true)
    }
    
    func setupPageView() {
        addSubview(pageView)
        pageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        pageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        pageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    //MARK: 圖片輪播
    
    var timer: Timer?
    func addTimer(){
        timer = Timer(timeInterval: 3, repeats: true, block: { [weak self] (timer) in
            self?.showNextImage()
        })
        
        guard let timer = timer else {
            return
        }
        RunLoop.current.add(timer, forMode: .commonModes)
    }
    func removeTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func showNextImage() {
        currentIndexPath = IndexPath(item: currentIndexPath!.item + 1, section: 0)
        pageView.currentPage = currentIndexPath!.item % imgs.count
        collectionView.scrollToItem(at: currentIndexPath!, at: .centeredHorizontally, animated: true)
    }
    
    func showPreImage(){
        currentIndexPath = IndexPath(item: currentIndexPath!.item - 1, section: 0)
        pageView.currentPage = currentIndexPath!.item % imgs.count
        collectionView.scrollToItem(at: currentIndexPath!, at: .centeredHorizontally, animated: true)
    }
    
    func reloadImage()  {
        if currentIndexPath!.item == imgs.count * 2 - 1 {  //如果是最后一个图片，回到第一部分的最后一张图片
            currentIndexPath = IndexPath(item: imgs.count - 1, section: 0)
            collectionView.scrollToItem(at: currentIndexPath!, at: .centeredHorizontally, animated: false)
        } else if currentIndexPath!.item == 0 {  //如果是第一个图片，就回到第二部分的第一张图片
            currentIndexPath = IndexPath(item: imgs.count, section: 0)
            collectionView.scrollToItem(at: currentIndexPath!, at: .centeredHorizontally, animated: false)
        }
    }
}

extension BannerCellInBrowseCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerViewCellInBannerCell", for: indexPath) as! BannerViewCellInBannerCell
        cell.imageView.image = UIImage(named: imgs[indexPath.item % imgs.count])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgs.count * 2
    }
}


extension BannerCellInBrowseCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
    
    
}

extension BannerCellInBrowseCell: UIScrollViewDelegate{
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeTimer()
        oldOffSet = scrollView.contentOffset.x
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        reloadImage()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()
        if scrollView.contentOffset.x < oldOffSet {
            showPreImage()
        }else{
            showNextImage()
        }
    }
}
