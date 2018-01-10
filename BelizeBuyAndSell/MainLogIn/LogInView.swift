//
//  LogInView.swift
//  BelizeBuyAndSell
//  Created by 辛忠翰 on 08/01/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit

class LogInView: BasicView {
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailTextfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Email"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    let emailSeperateView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Password"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    let logInButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Log In", for: .normal)
        btn.backgroundColor = UIColor.rgb(red: 51, green: 91, blue: 151)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.layer.cornerRadius = 5
        btn.layer.masksToBounds = false
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let forgetPasswordButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = UIColor.clear
        btn.setTitle("忘記密碼？", for: .normal)
        btn.setTitleColor(UIColor.rgb(red: 51, green: 91, blue: 151), for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.layer.cornerRadius = 5
        btn.layer.masksToBounds = false
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func setupViews() {
        setupInputsContainerView()
        setupEmailRegisterButton()
        setupForgetPasswordButton()
    }
    func setupInputsContainerView() {
        addSubview(inputsContainerView)
        inputsContainerView.addSubview(emailTextfield)
        inputsContainerView.addSubview(emailSeperateView)
        inputsContainerView.addSubview(passwordTextfield)
        
        inputsContainerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        inputsContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        inputsContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/5).isActive = true
        
        emailTextfield.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextfield.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailTextfield.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        emailTextfield.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2).isActive = true
        
        emailSeperateView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        emailSeperateView.bottomAnchor.constraint(equalTo: emailTextfield.bottomAnchor).isActive = true
        emailSeperateView.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        emailSeperateView.widthAnchor.constraint(equalTo: emailTextfield.widthAnchor).isActive = true
        
        
        passwordTextfield.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextfield.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passwordTextfield.topAnchor.constraint(equalTo: emailTextfield.bottomAnchor).isActive = true
        passwordTextfield.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2).isActive = true
    }
    
    func setupEmailRegisterButton() {
        addSubview(logInButton)
        logInButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logInButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 20).isActive = true
        logInButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
        logInButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupForgetPasswordButton() {
        addSubview(forgetPasswordButton)
        forgetPasswordButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        forgetPasswordButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 10).isActive = true
        forgetPasswordButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
        forgetPasswordButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
