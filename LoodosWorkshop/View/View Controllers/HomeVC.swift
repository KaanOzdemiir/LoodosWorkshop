//
//  HomeVC.swift
//  LoodosWorkshop
//
//  Created by Kaan Ozdemir on 29.05.2021.
//  Copyright © 2021 Kaan Ozdemir. All rights reserved.
//

import UIKit
import Lottie
import RxCocoa
import RxSwift

class HomeVC: UIViewController {
    
    var viewModel = HomeViewModel()
    
    @IBOutlet weak var searchBar: UISearchBar!{
        didSet{
            searchBar.text = "inception" // Toplu halde filerin çekilebileceği endpoint olmadığı için bu şekilde ayarlandı. İlk açılışta ekranın dolu görünmesini istiyorum.
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureSearchBar()
        subscribeMovieResponse()
        presentLoadingView()
    }
    
    func configureCollectionView() {
        collectionView.register(UINib(nibName: MovieCollectionViewCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.cellIdentifier)
    }
    
    func subscribeMovieResponse() {
        viewModel.rxMovieResponse.subscribe(onNext: { [weak self] (result) in
            guard let self = self else { return }
            
            self.hideLoadingView()
            if result.response.boolValue{
                self.collectionView.backgroundView = nil
            }else{
                if self.viewModel.isSeaching{
                    self.collectionView.backgroundView = self.getNotFoundView()
                }else{
                    let alert = UIAlertController(title: "Error!", message: "Something went wrong. Please check your entry.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                }
            }
            
            self.collectionView.reloadData()

        }, onError: { (error) in
            
        }).disposed(by: viewModel.disposeBag)
    }
}

// MARK: CollectionView DataSource
extension HomeVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.cellIdentifier, for: indexPath) as! MovieCollectionViewCell
        let movie = viewModel.movies[indexPath.item]
        cell.setWith(movie)
        
        return cell
    }
}

// MARK: CollectionView Delegate
extension HomeVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = viewModel.movies[indexPath.item]
        self.pushMovieDetailVC(movie: movie)
    }
}

// MARK: CollectionView Flow Layout Delegate
extension HomeVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width - 16, height: 280)
    }
}

// MARK: Search
extension HomeVC{
    func configureSearchBar() {
    
        // If Non-Empty
        searchBar
            .rx.text
            .orEmpty
            .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .filter { !$0.isEmpty }
            .subscribe(onNext: { [weak self] text in
                print("Search Bar Text --> ", text)
                guard let self = self else { return }
                self.viewModel.searchText = text
            })
            .disposed(by: viewModel.disposeBag)
        
        // If Empty
        searchBar
            .rx.text
            .orEmpty
            .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .filter { $0.isEmpty }
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.viewModel.searchText = ""
            })
            .disposed(by: viewModel.disposeBag)
    }
}
