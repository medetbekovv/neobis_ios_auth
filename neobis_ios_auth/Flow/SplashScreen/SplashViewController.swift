//
//  SplashViewController.swift
//  neobis_ios_auth
//
//  Created by Sultan on 27/9/23.
//

import UIKit
import SnapKit

class SplashViewController : BaseViewController {
    
    let contentView = SplashScreenView()
    
    override func viewDidLoad() {
        setupViews()
        setupConstraints()
        addTarget()
    }
    
    
    override func addTarget(){
        contentView.authorizeButton.addTarget(self, action: #selector(authorizeButtonPressed), for: .touchUpInside)
        contentView.beginButton.addTarget(self, action: #selector(beginButtonPressed), for: .touchUpInside)
    }
    override func setupViews(){
        view.addSubview(contentView)
    }
    override func setupConstraints(){
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func beginButtonPressed() {
//        let userViewModel = UserViewModel()
//        let vc = RegistrationViewController(userViewModel: userViewModel)
//
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func authorizeButtonPressed() {
//        let userViewModel = UserViewModel()
//        let vc = LoginViewController(userViewModel: userViewModel)
//
//        navigationController?.pushViewController(vc, animated: true)
    }
    
}
