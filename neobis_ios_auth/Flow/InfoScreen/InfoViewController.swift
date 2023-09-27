//
//  InfoViewController.swift
//  neobis_ios_auth
//
//  Created by Sultan on 27/9/23.
//

import UIKit
import SnapKit

class InfoViewController : BaseViewController {
    
    let contentView = InfoScreenView()
    
    override func viewDidLoad() {
        setupViews()
        setupConstraints()
        addTarget()
    }
    
    
    override func addTarget(){}
    override func setupViews(){}
    override func setupConstraints(){}
    
}
