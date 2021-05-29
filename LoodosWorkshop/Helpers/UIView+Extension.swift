//
//  UIView+Extension.swift
//  LoodosWorkshop
//
//  Created by Kaan Ozdemir on 29.05.2021.
//  Copyright © 2021 Kaan Ozdemir. All rights reserved.
//

import UIKit

extension UIView {
    func applyGradient(startColor: UIColor, endColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.colors = [startColor.cgColor,
                           endColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.frame = self.bounds
        gradient.cornerRadius = self.bounds.width / 2
        gradient.masksToBounds = true
        self.layer.insertSublayer(gradient, at: 0)
    }
}
