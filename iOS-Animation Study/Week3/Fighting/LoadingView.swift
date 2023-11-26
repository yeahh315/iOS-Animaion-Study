//
//  LoadingView.swift
//  iOS-Animation Study
//
//  Created by 김다예 on 11/26/23.
//

import UIKit

class LoadingView: UIView {
    
    private let countOfCircle: Int = 3
    private let radius: CGFloat = 10
    
    private var circleLayerList = [CAShapeLayer]()
    
    override func draw(_ rect: CGRect) {
        setupStyle()
        createLoadingPath()
    }
}

extension LoadingView {
    
    private func setupStyle() {
        backgroundColor = .clear
    }
    
    private func createLoadingPath() {
        for i in 0..<countOfCircle {
            let circularPath = UIBezierPath(ovalIn: .init(x: CGFloat(i) * 2 * radius,
                                                          y: 0,
                                                          width: radius,
                                                          height: radius))
            
            let circleLayer = CAShapeLayer()
            circleLayer.path = circularPath.cgPath
            circleLayer.fillColor = UIColor.black.withAlphaComponent(0.8).cgColor
            
            let circularColorAnimation = CABasicAnimation(keyPath: "fillColor")
            circularColorAnimation.toValue = UIColor.black.withAlphaComponent(0.1).cgColor
            
            let circularSizeAnimation = CABasicAnimation(keyPath: "transform.scale.y")
            circularSizeAnimation.toValue = 1.2
            
            let groupAnimation = CAAnimationGroup()
            groupAnimation.animations = [circularColorAnimation, circularSizeAnimation]
            groupAnimation.duration = 0.8
            groupAnimation.repeatCount = .infinity
            groupAnimation.autoreverses = true
            groupAnimation.beginTime = 0.3 * Double(i)
            
            circleLayer.add(groupAnimation, forKey: "LoadingAnimation")

            circleLayerList.append(circleLayer)
            layer.addSublayer(circleLayerList[i])
        }
    }
}
