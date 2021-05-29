//
//  LoadingView.swift
//  LoodosWorkshop
//
//  Created by Kaan Ozdemir on 29.05.2021.
//  Copyright © 2021 Kaan Ozdemir. All rights reserved.
//

import UIKit
import Lottie

class LoadingView: UIView {
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
        animationView.animation = Animation.named("loading")
    }
    
    func initSubviews() {
        let nib = UINib(nibName: "LoadingView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    func startAnimation() {
        if !animationView.isAnimationPlaying {
            animationView.play()
        }
        animationView.isHidden = false
    }
    
    func stopAnimation() {
        animationView.stop()
    }
}
