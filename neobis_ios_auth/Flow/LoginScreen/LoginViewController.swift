//
//  LoginViewController.swift
//  neobis_ios_auth
//
//  Created by Sultan on 27/9/23.
//

import UIKit
import SnapKit

class LoginViewController : BaseViewController {
    
    let contentView = LoginScreenView()
    
    var loginProtocol : LoginViewModelProtocol
    
    init(loginProtocol: LoginViewModelProtocol) {
        self.loginProtocol = loginProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setupViews()
        setupConstraints()
        addTarget()
    }
    
    
    override func addTarget(){
        contentView.enterButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        contentView.resetPasswordButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }
    
    @objc func loginPressed() {
        guard let email = contentView.loginField.text, let password = contentView.passwordField.text else {
            print("Email or password is empty.")
            return
        }
        
        loginProtocol.login(email: email, password: password)
    }
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    override func setupViews(){
        view.addSubview(contentView)
    }
    override func setupConstraints(){
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
