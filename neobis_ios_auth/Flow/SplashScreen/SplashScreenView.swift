//
//  SplashScreenView.swift
//  neobis_ios_auth
//
//  Created by Sultan on 27/9/23.
//

import UIKit
import SnapKit

class SplashScreenView : BaseView {
    
    lazy var smileImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "smile")
        
        return image
    }()
    
    lazy var messageLabel : UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "Смейся\nи улыбайся\nкаждый день")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
        label.attributedText = attributedText
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(red: 93/255, green: 95/255, blue: 249/255, alpha: 1.0)
        label.font = UIFont(name: "GothamPro-Medium", size: 40)
        
        return label
    }()
    
    lazy var beginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 93/255, green: 95/255, blue: 249/255, alpha: 1.0)
        button.layer.cornerRadius = 16
        let buttonTitle = "Начать пользоваться"
        button.setTitle(buttonTitle, for: .normal)
        button.titleLabel?.font = UIFont(name: "GothamPro-Bold", size: 16)
        button.contentVerticalAlignment = .center
        
        return button
    }()
    
    lazy var authorizeButton : UIButton = {
        let button = UIButton()
        let buttonTitle = "Есть аккаунт? Войти"
        button.setTitle(buttonTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "GothamPro-Bold", size: 16)
        button.contentVerticalAlignment = .center
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
         setupViews()
         setupConstraints()
    }
    
    override func setupViews() {
        addSubview(smileImage)
        addSubview(messageLabel)
        addSubview(beginButton)
        addSubview(authorizeButton)
    }
    override func setupConstraints() {
        smileImage.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(UIScreen.main.bounds.height * 154 / 812)
        }
        
        messageLabel.snp.makeConstraints{ make in
            make.top.equalTo(smileImage.snp.bottom).offset(UIScreen.main.bounds.height * 93 / 812)
            make.width.equalTo(UIScreen.main.bounds.width * 335 / 375)
            make.height.equalTo(UIScreen.main.bounds.height * 144 / 812)
            make.centerX.equalToSuperview()
        }
        
        beginButton.snp.makeConstraints{ make in
            make.top.equalTo(messageLabel.snp.bottom).offset(UIScreen.main.bounds.height * 64 / 812)
            make.width.equalTo(UIScreen.main.bounds.width * 335 / 375)
            make.height.equalTo(UIScreen.main.bounds.height * 65 / 812)
            make.centerX.equalToSuperview()
        }
        
        authorizeButton.snp.makeConstraints{ make in
            make.top.equalTo(beginButton.snp.bottom).offset(UIScreen.main.bounds.height * 41 / 812)
            make.width.equalTo(UIScreen.main.bounds.width * 335 / 375)
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
