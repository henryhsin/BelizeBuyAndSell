//
//  MainLogInViewController.swift
//  BelizeBuyAndSell
//
//  Created by 辛忠翰 on 07/01/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase

class MainLogInViewController: UIViewController {
    //MARK:setup the UI of LogInViewController
    let imgs = ["test1","test2","test3","test4"]
    var currentIndexPath: IndexPath?
    var oldOffSet: CGFloat = 0.0
    
    //若隱藏NavigationBar會出現上面有一小段距離的bug，只有在collectionView發生
    //經多方嘗試發現在(0,0)用一個view即可，不知原因
    let dummyView: UIView = {
       let view = UIView()
        view.frame = CGRect.zero
        return view
    }()
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        cv.register(MainLogInCell.self, forCellWithReuseIdentifier: "MainLogInCellID")
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
    
    //    let fbLogInButton: FBSDKLoginButton = {
    //        let btn = FBSDKLoginButton()
    //        btn.translatesAutoresizingMaskIntoConstraints = false
    //        return btn
    //    }()
    
    //custom FB log in button
    
    let fbLogInButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("使用Facebook登入", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor.rgb(red: 61, green: 91, blue: 151)
        btn.layer.cornerRadius = 5.0
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(handleFBLogInButton), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let eMailLoginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("透過Email註冊", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .gray
        btn.layer.cornerRadius = 5.0
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(handleGoToEMailLogInVC), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    @objc func handleGoToEMailLogInVC() {
        let emailLogInVC = EMailLogInViewController()
        self.present(emailLogInVC, animated: true, completion: nil)
    }
    
    
    let policyLabel: UILabel = {
        let label = UILabel()
        label.text = "註冊表示您同意我們的服務條款和隱私政策"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let logInButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("登入", for: .normal)
        btn.titleLabel?.frame = btn.bounds
        btn.titleLabel?.font = UIFont(name: "PingFangTC-Medium", size: 20)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 5.0
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(handleLogIbButton), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @objc func handleLogIbButton(){
        print("GG")
        self.navigationController?.pushViewController(LogInViewController(), animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(dummyView)
        setupCollectionView()
        setupPolicyLabel()
        setupEMailLoginButton()
        setupFbLogInButton()
        setupPageView()
        setupLogInButton()

        addTimer()
        hiddenNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hiddenNavigationBar()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        hiddenNavigationBar()
    }
    
    func hiddenNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        collectionView.isPagingEnabled = true
        
        collectionView.layoutIfNeeded()
        currentIndexPath = IndexPath(item: imgs.count, section: 0)
        collectionView.scrollToItem(at: currentIndexPath!, at: .centeredHorizontally, animated: true)
    }
    
    func setupPolicyLabel(){
        view.addSubview(policyLabel)
        policyLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10) .isActive = true
        policyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        policyLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        policyLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    func setupEMailLoginButton() {
        view.addSubview(eMailLoginButton)
        eMailLoginButton.bottomAnchor.constraint(equalTo: policyLabel.topAnchor, constant: -10) .isActive = true
        eMailLoginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        eMailLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        eMailLoginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        eMailLoginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    }
    
    func setupFbLogInButton(){
        view.addSubview(fbLogInButton)
        fbLogInButton.bottomAnchor.constraint(equalTo: eMailLoginButton.topAnchor, constant: -10) .isActive = true
        fbLogInButton.heightAnchor.constraint(equalTo: eMailLoginButton.heightAnchor).isActive = true
        fbLogInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fbLogInButton.widthAnchor.constraint(equalTo: eMailLoginButton.widthAnchor).isActive = true
    }
    
    func setupPageView() {
        view.addSubview(pageView)
        pageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageView.bottomAnchor.constraint(equalTo: fbLogInButton.topAnchor, constant: -10).isActive = true
        pageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        pageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupLogInButton() {
        view.addSubview(logInButton)
        logInButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        logInButton.rightAnchor.constraint(equalTo: fbLogInButton.rightAnchor).isActive = true
        logInButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        logInButton.heightAnchor.constraint(equalTo: fbLogInButton.heightAnchor).isActive = true
    }
    
    
    var fbLogInManager: FBSDKLoginManager?
    @objc func handleFBLogInButton() {
        fbLogInManager = FBSDKLoginManager()
        fbLogInManager?.logIn(withReadPermissions: ["email", "public_profile", "user_friends"], from: self) { (result, error) in
            if error != nil{
                print("Fail to log in!", error.debugDescription)
                return
            }
            guard let result = result else{return}
            print("result: ",result)
            self.logInFBAndUpdateUserInfoInFirebase()
        }
    }
    
    let userDefaults = UserDefaults.standard
    func logInFBAndUpdateUserInfoInFirebase() {
        //for firebase to use FB to sign in
        let accesstoken = FBSDKAccessToken.current()
        guard let accesstokenString = accesstoken?.tokenString else {
            return
        }
        let credential = FacebookAuthProvider.credential(withAccessToken: accesstokenString)
        Auth.auth().signIn(with: credential) { (user, error) in
            if error != nil{
                print("Firebase FB log is failed: ", error.debugDescription)
                return
            }
            guard let user = user else{return}
            print("Successfully logged in with our user: ", user.displayName)
            
            //FB Sign In to get profile imformation
            FBSDKGraphRequest(graphPath: "/me", parameters: ["fields" : "id, name, email, picture.type(large), cover"]).start { (connection, result, error) in
                if error != nil{
                    print("Faild to start graph request",error.debugDescription)
                }
                guard let result = result as! [String:Any]? else{return}
                guard let picture = result["picture"] as! [String:Any]? else{print("picture wrong"); return}
                guard let data = picture["data"] as! [String:Any]? else{print("data wrong"); return}
                guard let urlStr = data["url"] as? String else{print("url wrong"); return}
                if let url = URL(string: urlStr){
                    URLSession.shared.dataTask(with: url, completionHandler: { (data, response, err) in
                        if err != nil{
                            print("Can not fatch the img", err.debugDescription)
                            return
                        }
                        guard let data = data else{return}
                        self.userDefaults.setValue(data, forKey: "user_profile_image")
                        
                    }).resume()
                    self.updateUserInformationToFirebase(user: user, profileImageStr: urlStr)
                }
            }
        }
    }
    
    func updateUserInformationToFirebase(user: User, profileImageStr: String) {
        let ref = Database.database().reference(fromURL: "https://belizebuyandsell-87bab.firebaseio.com/")
        let userRef = ref.child("users").child(user.uid)
        let values = ["userName":user.displayName,"email":user.email, "profile_image_str": profileImageStr]
        userRef.updateChildValues(values) { (error, ref) in
            if error != nil{
                print("Failed to update user info: ", error.debugDescription)
                return
            }
            print("Successfully update user information!!")
        }
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
























//MARK: 有關UICollectionView的各種delegate

extension MainLogInViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainLogInCellID", for: indexPath) as! MainLogInCell
        cell.imageView.image = UIImage(named: imgs[indexPath.item % imgs.count])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgs.count * 2
    }
}

extension MainLogInViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
}

extension MainLogInViewController: UIScrollViewDelegate{
    //當user手動滑動時銷毀timer，不在自動滑動圖片
    //當用戶的手在collectionView上時觸發
    //用户开始拖动scroll view的时候被调用
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeTimer()
        oldOffSet = scrollView.contentOffset.x
    }
    
    //当通过代码滑动scroll view时（setContentOffset(_:animated:)或者scrollRectVisible(_:animated:)），动画结束时会调用该方法；值得一提的是，当且仅当动画存在时才会调用该方法。
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        reloadImage()
    }
    
    //在用户结束拖动后被调用，willDecelerate为YES时，结束拖动后会有减速过程（惯性）。
    //當用戶的手離開collectionView時觸發
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()
        //contentOffset.x抓到手的位置
        //當手離開時的位置，小於之前手剛碰到collectionView的位置，表要向左滑，所以回到上張圖
        if scrollView.contentOffset.x < oldOffSet {
            showPreImage()
        }else{
            showNextImage()
        }
    }
}

















