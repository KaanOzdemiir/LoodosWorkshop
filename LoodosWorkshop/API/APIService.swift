//
//  APIService.swift
//  LoodosWorkshop
//
//  Created by Kaan Ozdemir on 29.05.2021.
//  Copyright © 2021 Kaan Ozdemir. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class APIService {
    static let defaultHeaderParams = [
        "accept": "application/json",
        "apikey": AppConfig.apiKey
    ]
    
    static var urlScheme: String {
        get {
            return "http"
        }
    }
    
    static func getMovies(searchText: String, params: [String: Any], completion: @escaping (DataResponse<MovieResponse>) -> ()) {
        
        var urlComponents = URLComponents()
        urlComponents.host = AppConfig.host
        urlComponents.scheme = urlScheme
        
        urlComponents.queryItems = [
            URLQueryItem(name: "apikey", value: AppConfig.apiKey),
            URLQueryItem(name: "t", value: searchText)
        ]
        
        print("\n\(urlComponents.string!) istek atılıyor...")
        Alamofire.request(urlComponents.string!, method: .post, parameters: params, encoding: URLEncoding.default)
            .validate(statusCode: 200..<600)
            .responseObject { (response: DataResponse<MovieResponse>) in
                completion(response)
        }
    }
}
