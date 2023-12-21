//
//  FinalViewController.swift
//  iOS-Animation Study
//
//  Created by 김다예 on 12/15/23.
//

import UIKit

import SnapKit

final class FinalViewController: UIViewController {
    
    private let cardList: [CardStyleProtocol] = [LemonBlueCardStyle(),
                                                 OrangeMilkCardStyle(),
                                                 NightPinkCardStyle(),
                                                 PurpleGreenCardStyle()]
    
    private var selectedCardIndex: Int = 2 {
        didSet {
            selectButton.setTitle("\(cardList[selectedCardIndex].cardName) 좋겠어요", for: .normal)
            selectButton.backgroundColor = cardList[selectedCardIndex].cardFrontColor
            cardView.backgroundColor = cardList[selectedCardIndex].cardFrontColor
        }
    }
    
    private let choiceLabel: UILabel = {
        let label = UILabel()
        label.text = "이번엔 어떤 색을 고를까요?"
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .black
        return label
    }()
    
    private let cardLayerView: UIView = UIView()
    
    private let cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.snp.makeConstraints {
            $0.width.equalTo(180)
            $0.height.equalTo(300)
        }
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
    
    private lazy var buttonList: [UIButton] = {
        var buttonList = [UIButton]()
        
        for i in 0...3 {
            let button = UIButton()
            button.snp.makeConstraints {
                $0.height.width.equalTo(30)
            }
            button.layer.cornerRadius = 15
            button.backgroundColor = cardList[i].cardFrontColor
            button.addTarget(self, action: #selector(cardStyleButtonTappd(_:)), for: .touchUpInside)
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
        button.setTitle("\(cardList[selectedCardIndex].cardName) 좋겠어요", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 15
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        setupLayout()
        setupTimer()
    }
}

private extension FinalViewController {
    func setupStyle() {
        view.backgroundColor = .white
    }
    
    func setupLayout() {
        view.addSubview(choiceLabel)
        view.addSubview(cardLayerView)
        view.addSubview(selectedStackView)
        view.addSubview(foreignLabel)
        view.addSubview(foreignSwitch)
        view.addSubview(selectButton)
        
        cardLayerView.addSubview(cardView)
        buttonList.forEach {
            selectedStackView.addArrangedSubview($0)
        }
        
        choiceLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        cardLayerView.snp.makeConstraints {
            $0.height.equalTo(300)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(choiceLabel.snp.bottom).offset(50)
        }
        
        cardView.snp.makeConstraints {
            $0.center.equalToSuperview()
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
    
    func setupTimer() {
        var count: Double = 0
        _ = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            self.cardLayerView.layer.transform = self.rotation3D(degree: count)
            count += 1
        }
    }
    
    func rotation3D(degree: Double) -> CATransform3D {
        var transform = CATransform3DIdentity
        
        let rotateAngle = CGFloat((degree * Double.pi) / 180.0).remainder(dividingBy: Double.pi * 2)
        
        // Angle에 따라 카드의 색을 바꿔줌
        
        if Double.pi / 2 >= rotateAngle && rotateAngle >= 0 {
            cardView.backgroundColor = cardList[selectedCardIndex].cardFrontColor
        } else if -Double.pi / 2 <= rotateAngle && rotateAngle <= 0 {
            cardView.backgroundColor = cardList[selectedCardIndex].cardFrontColor
        } else {
            cardView.backgroundColor = cardList[selectedCardIndex].cardBackColor
        }
        transform = CATransform3DRotate(transform, rotateAngle, 0, 1, 0)
        
        return transform
    }
    
    @objc func cardStyleButtonTappd(_ button: UIButton) {
        guard let index = buttonList.firstIndex(of: button) else { return }
        selectedCardIndex = index
    }
}
