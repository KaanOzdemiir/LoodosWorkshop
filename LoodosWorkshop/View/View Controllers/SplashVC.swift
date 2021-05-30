//
//  ViewController.swift
//  LoodosWorkshop
//
//  Created by Kaan Ozdemir on 29.05.2021.
//

import UIKit
import RxBus
import RxSwift
import Shimmer

class SplashVC: BaseVC {

    @IBOutlet weak var loodosLabel: UILabel!
    
    var shimmer: FBShimmeringView!

    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initViews()
        subscribeLoodosTextEvent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar()
    }

    func initViews() {
        loodosLabel.text = nil
    }

}

extension SplashVC{
    func subscribeLoodosTextEvent() {
        
        var rxLoodosTextDisposable: Disposable?
        rxLoodosTextDisposable = RxBus.shared.asObservable(event: RxEvent.loodosTextFeched.self, sticky: true).subscribe(onNext: { [weak self] (event) in
            guard let self = self else { return }
            self.loodosLabel.text = event.text
            rxLoodosTextDisposable?.dispose()
            self.applyShimmer()
        })
    }
    
    func applyShimmer() {
        shimmer = FBShimmeringView(frame: self.view.frame)
        self.view.addSubview(shimmer)
        shimmer.contentView = loodosLabel
        shimmer.shimmeringSpeed = 300
        shimmer.isShimmering = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.pushHomeVC()
        }
    }
    
    func hideNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
