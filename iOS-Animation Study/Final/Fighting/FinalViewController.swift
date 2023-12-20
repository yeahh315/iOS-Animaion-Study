//
//  FinalViewController.swift
//  iOS-Animation Study
//
//  Created by 김다예 on 12/15/23.
//

import UIKit

import SnapKit

final class FinalViewController: UIViewController {
    
    private var selectedCard: String = "나이트핑크가" {
        didSet {
            selectButton.setTitle("\(selectedCard) 좋겠어요", for: .normal)
        }
    }
    
    private let choiceLabel: UILabel = {
        let label = UILabel()
        label.text = "이번엔 어떤 색을 고를까요?"
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .black
        return label
    }()
    
    private let cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.snp.makeConstraints {
            $0.width.equalTo(180)
            $0.height.equalTo(300)
        }
        view.backgroundColor = .red
        view.transform = .init(rotationAngle: 60.0)
        return view
    }()
    
    private let selectedStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 30
        stackView.alignment = .center
        return stackView
    }()
    
    private let buttonList: [UIButton] = {
        var buttonList = [UIButton]()
        
        for i in 0...3 {
            let button = UIButton()
            button.snp.makeConstraints {
                $0.height.width.equalTo(30)
            }
            button.layer.cornerRadius = 15
            button.backgroundColor = .lightGray
            buttonList.append(button)
        }
        return buttonList
    }()
    
    private let foreignLabel: UILabel = {
        let label = UILabel()
        label.text = "해외 겸용 카드로 받기"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()
    
    private let foreignSwitch: UISwitch = {
        let switchView = UISwitch()
        switchView.isOn = true
        switchView.onTintColor = .systemCyan
        return switchView
    }()
    
    private lazy var selectButton: UIButton = {
        let button = UIButton()
        button.setTitle("\(selectedCard) 좋겠어요", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 15
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupStyle()
        setupLayout()
    }
}

private extension FinalViewController {
    func setupStyle() {
        view.backgroundColor = .white
    }
    
    func setupLayout() {
        view.addSubview(choiceLabel)
        view.addSubview(cardView)
        view.addSubview(selectedStackView)
        view.addSubview(foreignLabel)
        view.addSubview(foreignSwitch)
        view.addSubview(selectButton)

        buttonList.forEach {
            selectedStackView.addArrangedSubview($0)
        }
        
        choiceLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        cardView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(choiceLabel.snp.bottom).offset(75)
        }
        
        selectedStackView.snp.makeConstraints {
            $0.top.equalTo(cardView.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
        }
        
        foreignLabel.snp.makeConstraints {
            $0.top.equalTo(selectedStackView.snp.bottom).offset(40)
            $0.leading.equalToSuperview().inset(15)
        }
        
        foreignSwitch.snp.makeConstraints {
            $0.centerY.equalTo(foreignLabel)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        selectButton.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }

    }
}
