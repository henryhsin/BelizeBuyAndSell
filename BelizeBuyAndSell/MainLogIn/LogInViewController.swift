//
//  LogInViewController.swift
//  BelizeBuyAndSell
//
//  Created by 辛忠翰 on 08/01/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    let backButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "btn_back_arror_normal")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageView?.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    @objc func handleBackButton(){
        self.navigationController?.pushViewController(MainLogInViewController(), animated: true)
    }
    
    let logInView: LogInView = {
       let lv = LogInView()
        return lv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupNavigationBar()
        setupLogInView()
    }

    func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.title = "登入"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barTintColor = .red
        self.navigationController!.navigationBar.isTranslucent = false
        
        
        let leftBarButton = UIBarButtonItem(customView: backButton)
        backButton.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    func setupLogInView() {
        view.addSubview(logInView)
        logInView.frame = view.frame
    }
}
