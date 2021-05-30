//
//  NoConnectionView.swift
//  LoodosWorkshop
//
//  Created by Kaan Ozdemir on 30.05.2021.
//  Copyright © 2021 Kaan Ozdemir. All rights reserved.
//

import Foundation
import Lottie

class NoConnectionView: UIView {
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
        animationView.animation = Animation.named("no_connection")
        animationView.play()
    }
    
    func initSubviews() {
        self.tag = 997
        let nib = UINib(nibName: "NoConnectionView", bundle: nil)
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
