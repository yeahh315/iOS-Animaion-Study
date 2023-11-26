//
//  Week3FightingViewController.swift
//  iOS-Animation Study
//
//  Created by 김다예 on 11/26/23.
//

import UIKit

import SnapKit

class Week3FightingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let loadingView = LoadingView()
        
        view.addSubview(loadingView)
        loadingView.snp.makeConstraints {
            $0.width.equalTo(50)
            $0.height.equalTo(10)
            $0.center.equalToSuperview()
        }
    }
}
