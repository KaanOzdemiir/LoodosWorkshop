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
    
    func pushMovieDetailVC(movie: MovieResponse) {
        guard let movieDetailVC = storyboard?.instantiateViewController(withIdentifier: "MovieDetailVC") as? MovieDetailVC else {
            return
        }
        movieDetailVC.viewModel.movie = movie
        navigationController?.pushViewController(movieDetailVC, animated: true)
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
    
    func getNotFoundView() -> NotFoundView {
        var notFoundView: NotFoundView!
        
        if let _notFoundView = self.view.subviews.first(where: {$0.tag == 998}) as? NotFoundView{
            notFoundView = _notFoundView
        }else{
            notFoundView = NotFoundView(frame: view.frame)
            view.addSubview(notFoundView)
        }
        
        return notFoundView
    }
    
    func presentNoConnectionView() {
        var noConnectionView: NoConnectionView!
        
        if let _noConnectionView = self.view.subviews.first(where: {$0.tag == 997}) as? NoConnectionView{
            noConnectionView = _noConnectionView
        }else{
            noConnectionView = NoConnectionView(frame: view.frame)
            view.addSubview(noConnectionView)
        }
        
        noConnectionView?.startAnimation()
        noConnectionView.isHidden = false
        view.bringSubviewToFront(noConnectionView!)
    }
    
    func hideNoConnectionView() {
        var noConnectionView: NoConnectionView!
        
        if let _noConnectionView = self.view.subviews.first(where: {$0.tag == 997}) as? NoConnectionView{
            noConnectionView = _noConnectionView
        }else{
            noConnectionView = NoConnectionView(frame: view.frame)
            view.addSubview(noConnectionView)
        }
        noConnectionView?.isHidden = true
        noConnectionView?.stopAnimation()
        
        view.sendSubviewToBack(noConnectionView!)
    }
}
