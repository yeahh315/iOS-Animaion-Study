//
//  Week1FightingViewController.swift
//  iOS-Animation Study
//
//  Created by 김다예 on 11/12/23.
//

import UIKit

import SnapKit

class Week1FightingViewController: UIViewController {
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "1주차 화이팅 해야지~"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .systemIndigo
        label.textAlignment = .center
        return label
    }()
    
    private lazy var shakeButton: UIButton = {
        let button = UIButton()
        button.setTitle("흔들리는 꽃들 속에서", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(shakeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var toastButton: UIButton = {
        let button = UIButton()
        button.setTitle("토스트 맛있겠다", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(toastButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var turnButton: UIButton = {
        let button = UIButton()
        button.setTitle("엎어라 뒤짚어라", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(turnButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var toastLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-200, width: 150, height: 35))
        label.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "토스트 맛있겠당"
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        setupLayout()
    }
    
}

extension Week1FightingViewController {
    
    private func setupStyle() {
        view.backgroundColor = .white
    }
    
    private func setupLayout() {
        view.addSubview(mainLabel)
        view.addSubview(shakeButton)
        view.addSubview(toastButton)
        view.addSubview(turnButton)
        
        
        mainLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        
        shakeButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.top.equalTo(mainLabel.snp.bottom).offset(50)
        }
        
        toastButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.top.equalTo(shakeButton.snp.bottom).offset(20)
        }
        
        turnButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.top.equalTo(toastButton.snp.bottom).offset(20)
        }
    }
    
    @objc private func shakeButtonTapped() {
        shakeButton.shakeButton()
    }
    
    @objc private func toastButtonTapped() {
        view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
            self.toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            self.toastLabel.removeFromSuperview()
            self.toastLabel.alpha = 1.0
        })
    }
    
    @objc private func turnButtonTapped() {
        UIView.transition(with: turnButton, duration: 0.5, options: .transitionFlipFromRight, animations: nil)
    }
}
