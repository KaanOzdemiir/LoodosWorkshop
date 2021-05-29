//
//  MovieRepository.swift
//  LoodosWorkshop
//
//  Created by Kaan Ozdemir on 29.05.2021.
//  Copyright © 2021 Kaan Ozdemir. All rights reserved.
//

import Foundation
import RxSwift

class MovieRespository {
    
    func getMovies(searchText: String, params: [String: Any]) -> Observable<MovieResponse> {
        return Observable.create({ observer -> Disposable in
            
            APIService.getMovies(searchText: searchText, params: params, completion: { (response) in
                
                if let error = response.error {
                    print("‼️ Failed. (getMovies) *-> Error: ", error.localizedDescription)
                    observer.onError(error)
                    return
                }
                
                observer.onNext(response.result.value!)
                observer.onCompleted()
            })
            return Disposables.create()
        })
    }
}
