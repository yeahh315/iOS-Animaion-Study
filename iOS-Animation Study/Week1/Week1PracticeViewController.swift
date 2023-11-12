//
//  Week1PracticeViewController.swift
//  AnimationStudy
//
//  Created by 김다예 on 11/8/23.
//

import UIKit

class Week1PracticeViewController: UIViewController {
    
    let testView : UIView = {
        let view = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        view.backgroundColor = .systemPink
        return view
    }()
    
    lazy var testButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 150, y: 400, width: 200, height: 50))
        button.setTitle("짠!", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.titleLabel?.textColor = .brown
        button.layer.backgroundColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(didMoveTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        didMoveTap()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(testView)
        
        view.addSubview(testButton)
    }
    
    @objc private func didMoveTap() {
        //        UIView.animate(withDuration: 2.0) { [self] in
        //            testView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        //        }
        //
        //        UIView.animate(withDuration: 2.0) { [self] in
        //            testView.transform = CGAffineTransform(rotationAngle: .pi)
        //        }
        //
        //        UIView.animate(withDuration: 2.0) { [self] in
        //            testView.transform = CGAffineTransform(translationX: 200, y: 200)
        //        }
        
        //        UIView.animate(withDuration: 2.0) { [self] in
        //                    testView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        //                } completion: { _ in
        //                    UIView.animate(withDuration: 2.0) { [self] in
        //                        testView.transform = CGAffineTransform(rotationAngle: .pi)
        //                    } completion: { _ in
        //                        UIView.animate(withDuration: 2.0) { [self] in
        //                            testView.transform = CGAffineTransform(translationX: 200, y: 200)
        //                        }
        //                    }
        //                }
        
//        UIView.animateKeyframes(withDuration: 3.0, delay: 0)  {
//            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3) { [self] in
//                testView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
//            }
//            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3) { [self] in
//                testView.transform = CGAffineTransform(rotationAngle: .pi)
//            }
//            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3) { [self] in
//                testView.transform = CGAffineTransform(translationX: 200, y: 200)
//            }
//        }
        
        UIView.transition(with: testView, duration: 2.0, options: .transitionFlipFromTop) {
            self.testView.alpha = 0
        }
    }
}


