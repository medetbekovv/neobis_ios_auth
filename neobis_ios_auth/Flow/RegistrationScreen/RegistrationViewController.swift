//
//  RegistrationViewController.swift
//  neobis_ios_auth
//
//  Created by Sultan on 27/9/23.
//

import UIKit
import SnapKit

class RegistrationViewController : BaseViewController {
    
    let contentView = RegistrationScreenView()
    var registerProtocol : RegisterProtocol
    
    init(registerProtocol:RegisterProtocol) {
        self.registerProtocol = registerProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        title = "Регистрация"
        setupViews()
        setupConstraints()
        addTarget()
        let backButton = UIBarButtonItem(image: UIImage(named: "backButton")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backPressed))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    
    override func addTarget(){
        contentView.enterButton.addTarget(self, action: #selector(enterPressed), for: .touchUpInside)
    }
    override func setupViews(){
        view.addSubview(contentView)
    }
    override func setupConstraints(){
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func enterPressed() {
        guard let email = contentView.loginField.text else {
            print("Email is empty.")
            return
        }
        
        registerProtocol.register(email: email)
        
        if contentView.enterButton.currentTitleColor == .white{
            let vc = InfoViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
    
}
