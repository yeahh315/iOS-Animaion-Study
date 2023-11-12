//
//  UIButton+.swift
//  iOS-Animation Study
//
//  Created by 김다예 on 11/12/23.
//

import UIKit

extension UIButton {
    func shakeButton() {
        self.transform = CGAffineTransform(translationX: 0, y: 5)
        UIView.animate(withDuration: 1,
                               delay: 0,
                               usingSpringWithDamping: 0.1,
                       initialSpringVelocity: 2,
                       options: [.curveEaseInOut]) {
            self.transform = .identity
        }
    }
}
