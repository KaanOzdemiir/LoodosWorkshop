//
//  BaseVC.swift
//  LoodosWorkshop
//
//  Created by Kaan Ozdemir on 30.05.2021.
//  Copyright © 2021 Kaan Ozdemir. All rights reserved.
//

import UIKit
import Reachability

class BaseVC: UIViewController {
    
    let reachability = try! Reachability()

    override func viewDidLoad() {
        super.viewDidLoad()
        startInternetReachibityNotifier()
    }
    
    func startInternetReachibityNotifier() {
        //declare this property where it won't go out of scope relative to your listener

        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
            } else {
                print("Reachable via Cellular")
            }
            self.hideNoConnectionView()
        }
        reachability.whenUnreachable = { _ in
            print("Not reachable")
            self.presentNoConnectionView()
        }

        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
}
