//
//  EMailLogInView.swift
//  BelizeBuyAndSell
//
//  Created by 辛忠翰 on 07/01/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit

class EMailLogInView: BasicView{
   
    
    let bannerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bannerBackgroundImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "test1")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "註冊"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: FONT_PINGFANGTC_MEDIUM, size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addProfilePhotoButton: UIButton = {
       let btn = UIButton(type: .system)
        btn.backgroundColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "在這邊買賣東新，信任和安全很重要。新增您的照片，讓其他人知道他們正在和誰聊天!"
        label.numberOfLines = 4
        label.font = UIFont(name: FONT_PINGFANGTC_MEDIUM, size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.alpha = 0.8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let inputsContainerView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameTextfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Name"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    let nameSeperateView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
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
    
    let registerButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let emailRegisterButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Register", for: .normal)
        btn.backgroundColor = UIColor.rgb(red: 51, green: 91, blue: 151)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    @objc func handleRegister(){
       
    }
    
    
    let backButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "btn_back_arror_normal"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageView?.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
   
    
    override func setupViews() {
        backgroundColor = .gray
        setupBannerView()
        setupInputsContainerView()
        setupEmailRegisterButton()
    }
    
    
    
    func setupBannerView() {
        addSubview(bannerView)
        bannerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bannerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3).isActive = true
        bannerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        bannerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        setupBannerBackgroundImageView()
        setupBackButton()
        setupTitleLabel()
        setupAddProfilePhotoButton()
        setupSubtitleLabel()
    }
    
    func setupBackButton() {
        bannerView.addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: bannerView.topAnchor, constant: 20).isActive = true
        backButton.leftAnchor.constraint(equalTo: bannerView.leftAnchor, constant: 20).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupBannerBackgroundImageView(){
        bannerView.addSubview(bannerBackgroundImageView)
        bannerBackgroundImageView.centerXAnchor.constraint(equalTo: bannerView.centerXAnchor).isActive = true
        bannerBackgroundImageView.topAnchor.constraint(equalTo: bannerView.topAnchor).isActive = true
        bannerBackgroundImageView.heightAnchor.constraint(equalTo: bannerView.heightAnchor).isActive = true
        bannerBackgroundImageView.widthAnchor.constraint(equalTo: bannerView.widthAnchor).isActive = true
        
        bannerBackgroundImageView.addSubview(redView)
        redView.topAnchor.constraint(equalTo: bannerBackgroundImageView.topAnchor).isActive = true
        redView.bottomAnchor.constraint(equalTo: bannerBackgroundImageView.bottomAnchor).isActive = true
        redView.leftAnchor.constraint(equalTo: bannerBackgroundImageView.leftAnchor).isActive = true
        redView.rightAnchor.constraint(equalTo: bannerBackgroundImageView.rightAnchor).isActive = true
    }
    
    func setupTitleLabel() {
        bannerView.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: bannerView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupAddProfilePhotoButton(){
        bannerView.addSubview(addProfilePhotoButton)
        addProfilePhotoButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40).isActive = true
        addProfilePhotoButton.leftAnchor.constraint(equalTo: bannerView.leftAnchor, constant: 40).isActive = true
        addProfilePhotoButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        addProfilePhotoButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        addProfilePhotoButton.layoutIfNeeded()
        addProfilePhotoButton.layer.cornerRadius = addProfilePhotoButton.frame.height / 2
        addProfilePhotoButton.layer.masksToBounds = true
    }
    
    func setupSubtitleLabel() {
        bannerView.addSubview(subTitleLabel)
        subTitleLabel.topAnchor.constraint(equalTo: addProfilePhotoButton.topAnchor).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: bannerView.rightAnchor, constant: -40).isActive = true
        subTitleLabel.leftAnchor.constraint(equalTo: addProfilePhotoButton.rightAnchor, constant: 20).isActive = true
        subTitleLabel.heightAnchor.constraint(equalTo: addProfilePhotoButton.heightAnchor).isActive = true
    }
    
   
    
    
    
    
    
    func setupInputsContainerView() {
        addSubview(inputsContainerView)
        inputsContainerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        inputsContainerView.topAnchor.constraint(equalTo: bannerBackgroundImageView.bottomAnchor, constant: 10).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        inputsContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 2/5).isActive = true
        
        inputsContainerView.addSubview(nameTextfield)
        inputsContainerView.addSubview(nameSeperateView)
        inputsContainerView.addSubview(emailTextfield)
        inputsContainerView.addSubview(emailSeperateView)
        inputsContainerView.addSubview(passwordTextfield)
        
        nameTextfield.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        nameTextfield.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameTextfield.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        nameTextfield.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        nameSeperateView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        nameSeperateView.bottomAnchor.constraint(equalTo: nameTextfield.bottomAnchor).isActive = true
        nameSeperateView.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        nameSeperateView.widthAnchor.constraint(equalTo: nameTextfield.widthAnchor).isActive = true
        
        emailTextfield.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextfield.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailTextfield.topAnchor.constraint(equalTo: nameTextfield.bottomAnchor).isActive = true
        emailTextfield.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        emailSeperateView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        emailSeperateView.bottomAnchor.constraint(equalTo: emailTextfield.bottomAnchor).isActive = true
        emailSeperateView.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        emailSeperateView.widthAnchor.constraint(equalTo: emailTextfield.widthAnchor).isActive = true
        
        
        passwordTextfield.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextfield.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passwordTextfield.topAnchor.constraint(equalTo: emailTextfield.bottomAnchor).isActive = true
        passwordTextfield.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
    }
    
    func setupEmailRegisterButton() {
        addSubview(emailRegisterButton)
        emailRegisterButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        emailRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 10).isActive = true
        emailRegisterButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
        emailRegisterButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
