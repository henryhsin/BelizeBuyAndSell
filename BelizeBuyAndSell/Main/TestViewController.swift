//
//  TestViewController.swift
//  BelizeBuyAndSell
//
//  Created by 辛忠翰 on 10/01/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "Browse_icon")?.withRenderingMode(.alwaysTemplate)
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let tabBarView: MainTabBarView = {
        let tv = MainTabBarView()
        tv.backgroundColor = .green
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarView()
    }

    func setupTabBarView() {
        view.addSubview(tabBarView)
        tabBarView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tabBarView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        tabBarView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
