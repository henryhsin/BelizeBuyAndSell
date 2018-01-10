//
//  EMailLogInViewController.swift
//  
//
//  Created by 辛忠翰 on 07/01/18.
//

import UIKit

class EMailLogInViewController: UIViewController {

    let eMailLogInView: EMailLogInView = {
       let eView = EMailLogInView()
        eView.translatesAutoresizingMaskIntoConstraints = false
        return eView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        eMailLogInView.backButton.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
    }
    @objc func handleBackButton(){
        let mainLogInVC = MainLogInViewController()
        self.present(mainLogInVC, animated: true, completion: nil)
    }
    
    func setupViews() {
        view.addSubview(eMailLogInView)
        eMailLogInView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        eMailLogInView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        eMailLogInView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        eMailLogInView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    
}
