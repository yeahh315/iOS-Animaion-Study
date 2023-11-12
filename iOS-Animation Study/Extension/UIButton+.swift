//
//  UIButton+.swift
//  iOS-Animation Study
//
//  Created by 김다예 on 11/12/23.
//

import UIKit

extension UIButton {
    func shakeButton() {
        self.transform = CGAffineTransform(translationX: 0, y: 20)
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 1,
                       options: [.curveEaseInOut]) {
            self.transform = .identity
        }
    }
}
