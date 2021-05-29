//
//  VC+Extension.swift
//  LoodosWorkshop
//
//  Created by Kaan Ozdemir on 29.05.2021.
//

import UIKit

extension UIViewController{
    func pushHomeVC() {
        guard let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC else {
            return
        }
        
        navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func presentLoadingView() {
        var loadingView: LoadingView!
        
        if let _loadingView = self.view.subviews.first(where: {$0.tag == 999}) as? LoadingView{
            loadingView = _loadingView
        }else{
            loadingView = LoadingView(frame: view.frame)
            view.addSubview(loadingView)
        }
        loadingView?.isHidden = false
        loadingView?.startAnimation()
        
        view.bringSubviewToFront(loadingView!)
    }
    
    func hideLoadingView() {
        var loadingView: LoadingView!
        
        if let _loadingView = self.view.subviews.first(where: {$0.tag == 999}) as? LoadingView{
            loadingView = _loadingView
        }else{
            loadingView = LoadingView(frame: view.frame)
            view.addSubview(loadingView)
        }
        loadingView?.isHidden = true
        loadingView?.stopAnimation()
        
        view.sendSubviewToBack(loadingView!)
    }
}
