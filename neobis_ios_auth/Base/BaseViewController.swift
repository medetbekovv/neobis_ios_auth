//
//  BaseViewController.swift
//  neobis_ios_auth
//
//  Created by user on 2/6/23.
//

import UIKit
import SnapKit

class BaseViewController : UIViewController {
    
    override func viewDidLoad() {
        setupViews()
        setupConstraints()
        addTarget()
    }
    
    
    func addTarget(){}
    func setupViews(){}
    func setupConstraints(){}
}
