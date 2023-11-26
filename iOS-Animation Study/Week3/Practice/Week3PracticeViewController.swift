//
//  Week3PracticeViewController.swift
//  iOS-Animation Study
//
//  Created by 김다예 on 11/26/23.
//

import UIKit

class Week3PracticeViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        // TestView 사용 (CAAnimation)
//        let view = TestView(frame: UIScreen.main.bounds)
//        self.view = view
//        view.setAnimateBackGround()
        
        // progressView 사용
        let progressView = ProgressView(frame: .init(origin: .zero, size: .init(width: 100,
                                                                                height: 100)))
        self.view.addSubview(progressView)
        progressView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        progressView.progressAnimation(duration: 5, value: 1)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TestView2 사용 (이상한 곡선)
//        let bezierView = TestView2()
//        bezierView.frame = CGRect(x: 0, y: 250, width: 500, height: 500)
//        bezierView.backgroundColor = .white
//        self.view.addSubview(bezierView)
        
        // TestView3 사용 (원)
//        self.view = TestView3()
    }
}

/// 화면 바뀌는 CAAnimation
class TestView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        self.backgroundColor = .white
    }
    
    func setAnimateBackGround() {
        let animation = CABasicAnimation(keyPath: "backgroundColor")
        animation.duration = 4
        animation.fromValue = UIColor.red.cgColor
        animation.toValue = UIColor.blue.cgColor
        animation.isRemovedOnCompletion = false
        self.layer.add(animation, forKey: "backgroundAni")
    }
}

/// 이상한 곡선 View
class TestView2: UIView {
    
    override func draw(_ rect: CGRect) {
        
        UIColor.red.setStroke()
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 100, y: 200))
        //addLine = 직선
        //addCurve = 곡선
        //addQuadCurve = n차 곡선
        
        bezierPath.addLine(to: CGPoint(x: 200, y: 250))
        bezierPath.addCurve(to: CGPoint(x: 160, y: 140),
                            controlPoint1: CGPoint(x: 200, y: 80),
                            controlPoint2: CGPoint(x: 160, y: 80))
        bezierPath.addQuadCurve(to: CGPoint(x: 40, y: 140),
                                controlPoint: CGPoint(x: 100, y: 200))
        bezierPath.close()
        bezierPath.stroke()
        
    }
}

/// circle View
class TestView3: UIView {
    override func draw(_ rect: CGRect) {
        drawCircle()
    }
    
    func drawCircle() {
        let path = UIBezierPath(ovalIn: CGRect(x: bounds.midX - 50,
                                               y: bounds.midY - 50,
                                               width: 100,
                                               height: 100))
        UIColor.systemRed.setFill()
        UIColor.systemYellow.setStroke()
        path.lineWidth = 10
        path.stroke()
        path.fill()
    }
}

class ProgressView: UIView {
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var startPoint = CGFloat(3 * Double.pi / 4)
    private var endPoint = CGFloat(Double.pi / 4)
    
    override func draw(_ rect: CGRect) {
        createCircularPath()
    }
    
    func createCircularPath() {
        self.backgroundColor = .white
        let circularPath = UIBezierPath(arcCenter: .init(x: self.frame.width / 2.0,
                                                         y: self.frame.height / 2.0),
                                        radius: (frame.size.height - 10) / 2.0 ,
                                        startAngle: startPoint,
                                        endAngle: endPoint,
                                        clockwise: true)
        
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round       // layer의 끝 부분을 둥글게
        circleLayer.lineWidth = 3
        circleLayer.strokeEnd = 1.0        // scroke를 중지할 상대 위치 (0~1 사이)
        circleLayer.strokeColor = UIColor.white.withAlphaComponent(0.4).cgColor
        layer.addSublayer(circleLayer)
        
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 3
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = UIColor.red.cgColor
        layer.addSublayer(progressLayer)
    }
    
    func progressAnimation(duration: TimeInterval, value: Double) {
        // created circularProgressAnimation with keyPath
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        // set the end time
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = value
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
}
