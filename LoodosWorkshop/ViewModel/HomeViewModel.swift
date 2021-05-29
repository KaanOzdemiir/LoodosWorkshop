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
        }
    }
    
    var params: [String: Any] = [:]
    
    var rxMovieResponse = PublishSubject<MovieResponse>()
    var movies: [MovieResponse] = []
    
    func fetchMovies() {
          movieRepository
            .getMovies(searchText: searchText, params: params).subscribe(onNext: { [weak self] (response) in
                guard let self = self else { return }
                self.movies = [response]
                self.rxMovieResponse.onNext(response)
            }, onError: { [weak self] (error) in
                self?.rxMovieResponse.onError(error)
            })
          .disposed(by: disposeBag)
      }
}
