//
//  AnalyticsFunction.swift
//  LoodosWorkshop
//
//  Created by Kaan Ozdemir on 30.05.2021.
//  Copyright © 2021 Kaan Ozdemir. All rights reserved.
//

import Foundation
import FirebaseAnalytics

class AnalyticsFunction {
    
    struct MovieDetailAnalyticsData { var title, type, year, genre: String?}
    
    static let shared = AnalyticsFunction()
    
    func sendMovieDetailAnalytics(data: MovieDetailAnalyticsData) {
        
        let params: [String: Any] = [
            "movie_name": data.title ?? "",
            "movie_type": data.type ?? "",
            "movie_year": data.year ?? "",
            "movie_genre": data.genre ?? ""
        ]
        
        Analytics.logEvent("movie_detail", parameters: params)
    }
}
