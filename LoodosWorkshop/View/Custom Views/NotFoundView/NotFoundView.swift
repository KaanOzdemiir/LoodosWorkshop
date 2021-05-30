//
//  NotFoundView.swift
//  LoodosWorkshop
//
//  Created by Kaan Ozdemir on 29.05.2021.
//  Copyright © 2021 Kaan Ozdemir. All rights reserved.
//

import UIKit
import Lottie

class NotFoundView: UIView {
    @IBOutlet var contentView: UIView!

    @IBOutlet weak var animationView: AnimationView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
        animationView.loopMode = .loop
        animationView.animation = Animation.named("not_found")
        animationView.play()
    }
    
    func initSubviews() {
        self.tag = 998
        let nib = UINib(nibName: "NotFoundView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
}
