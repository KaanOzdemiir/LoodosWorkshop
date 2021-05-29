//
//  AppDelegate.swift
//  LoodosWorkshop
//
//  Created by Kaan Ozdemir on 29.05.2021.
//

import UIKit
import Firebase
import FirebaseRemoteConfig

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()

        fetchRemoteConfig()

        return true
    }

}


extension AppDelegate {
    func fetchRemoteConfig() {
        let remoteConfigSettings = RemoteConfigSettings()
        RemoteConfig.remoteConfig().configSettings = remoteConfigSettings
        
        RemoteConfig.remoteConfig().fetch(withExpirationDuration: 0) { [unowned self] (status, error) -> Void in
            if status == .success {
                print("Config fetched!")
                self.setLocaleConfigValues()
                
                RemoteConfig.remoteConfig().activate { (status, error) in
                    if status {
                        print("Config Activated!")
                    }else {
                        print("Error: \(error?.localizedDescription ?? "No error available.")")
                    }
                }
                
                
            } else {
                print("Config not fetched")
                print("Error: \(error?.localizedDescription ?? "No error available.")")
            }
        }
    }
    
    func setLocaleConfigValues() {
        let config = RemoteConfig.remoteConfig()
        let loodosText = config.configValue(forKey: "LoodosText").stringValue ?? ""
        
        print("Loodos Text: \(loodosText)")
    }
}
