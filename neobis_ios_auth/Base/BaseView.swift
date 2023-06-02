//
//  BaseView.swift
//  neobis_ios_auth
//
//  Created by user on 2/6/23.
//

import UIKit
import SnapKit

class BaseView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         setupViews()
         setupConstraints()
    }
    
    func setupViews() {}
    func setupConstraints() {}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
