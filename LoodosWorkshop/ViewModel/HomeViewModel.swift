//
//  HomeViewModel.swift
//  LoodosWorkshop
//
//  Created by Kaan Ozdemir on 29.05.2021.
//  Copyright © 2021 Kaan Ozdemir. All rights reserved.
//

import Foundation
import RxSwift

class HomeViewModel {
    
    let disposeBag = DisposeBag()
    
    let movieRepository = MovieRespository()
    
    var searchText: String = ""{
        didSet{
            fetchMovies()
            isSeaching = !searchText.isEmpty
        }
    }
    var isSeaching: Bool = false
    
    var params: [String: Any] = [:]
    
    var rxMovieResponse = PublishSubject<MovieResponse>()
    var movies: [MovieResponse] = []
    
    func fetchMovies() {
          movieRepository
            .getMovies(searchText: searchText, params: params).subscribe(onNext: { [weak self] (result) in
                guard let self = self else { return }
                self.movies = result.response.boolValue ? [result] : []
                self.rxMovieResponse.onNext(result)
            }, onError: { [weak self] (error) in
                self?.rxMovieResponse.onError(error)
            })
          .disposed(by: disposeBag)
      }
}
