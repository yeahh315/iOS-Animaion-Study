//
//  Week2FightingViewController.swift
//  iOS-Animation Study
//
//  Created by 김다예 on 11/17/23.
//

import UIKit

class Week2FightingViewController: UIViewController {
    
    var score: Int = 0
    var timer: Timer? = nil
    var isPause: Bool = true
    
    private lazy var mangom = UIImageView(image: UIImage(named: "mangom"))
    private let poopList: [UILabel] = {
        var labelList = [UILabel]()
        for i in 0...20 {
            let label = UILabel()
            label.text = "💩"
            label.font = .systemFont(ofSize: 25)
            labelList.append(label)
        }
        return labelList
    }()

    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "망곰이의 💩피하기 게임\n💩을 피해서 망곰이를 움직여보세요!"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
        startTimer()
        target()
    }
    
    private func target() {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(viewPan(_:)))
        mangom.addGestureRecognizer(gesture)
        mangom.isUserInteractionEnabled = true
    }
    
    //Pan 제스처 함수
    @objc
    private func viewPan(_ sender: UIPanGestureRecognizer) {
        let transition = sender.translation(in: mangom)
        let changedX = mangom.center.x + transition.x
        let changedY = mangom.center.y + transition.y
        
        self.mangom.center = .init(x: changedX,
                                   y: changedY)
        sender.setTranslation(.zero, in: self.mangom)
    }
    
    //시간 측정
    private func startTimer() {
        guard timer == nil else { return }
        self.timer = Timer.scheduledTimer(timeInterval: 0.1,
                                          target: self,
                                          selector: #selector(self.movePoop),
                                          userInfo: nil,
                                          repeats: true)
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
        mangom.contentMode = .scaleAspectFit
    }
    
    private func setLayout() {
        self.view.addSubview(mangom)
        
        mangom.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(100)
            $0.width.equalTo(100)
        }
        
        poopList.forEach {
            view.addSubview($0)
            $0.snp.makeConstraints {
                $0.center.equalToSuperview()
            }
        }
        
        self.view.addSubview(mainLabel)
        
        mainLabel.snp.makeConstraints {
            $0.centerX.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    
    @objc
    private func movePoop() {
        poopList.forEach {
            var newFrameX = $0.frame.origin.x + CGFloat(Int.random(in: -10...10))
            var newFrameY = $0.frame.origin.y + CGFloat(Int.random(in: -20...20))
            newFrameX = calNewPosition(position: newFrameX, forFrame: view.safeAreaLayoutGuide.layoutFrame.width - $0.frame.size.width)
            newFrameY = calNewPosition(position: newFrameY, forFrame: view.safeAreaLayoutGuide.layoutFrame.height - $0.frame.size.height)
            
            $0.frame = .init(x: newFrameX, y: newFrameY, width: $0.frame.size.width, height: $0.frame.size.height)
        }
        self.calculatePositionReached()
    }
    
    private func calculatePositionReached() {
        poopList.forEach {
            if self.mangom.frame.minX <= $0.frame.minX &&
                self.mangom.frame.maxX >= $0.frame.maxX &&
                self.mangom.frame.minY <= $0.frame.minY &&
                self.mangom.frame.maxY >= $0.frame.maxY
            {
                self.mainLabel.text = "ByeBye\nScore:\(self.score)"
                self.stopTimer()
            } else {
                self.score += 10
            }
        }
    }
    
    // 벽에 부딪히면 다시 돌아오게 위치를 잡아주는 함수
    private func calNewPosition(position: CGFloat, forFrame: CGFloat) -> CGFloat {
        if position >= forFrame {
            return forFrame * 2 - position
        } else if position <= 0 {
            return -position
        } else {
            return position
        }
    }
}
