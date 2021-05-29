//
//  ViewController.swift
//  LoodosWorkshop
//
//  Created by Kaan Ozdemir on 29.05.2021.
//

import UIKit
import RxBus
import RxSwift

class SplashVC: UIViewController {

    @IBOutlet weak var loodosLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initViews()
        subscribeLoodosTextEvent()
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
        })
    }
}
