//
//  MovieResponse.swift
//  LoodosWorkshop
//
//  Created by Kaan Ozdemir on 29.05.2021.
//  Copyright © 2021 Kaan Ozdemir. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieResponse: Mappable {
    var metascore, title, boxOffice, website, awards, director, imdbRating, dvd, actors, year, plot, imdbVotes, type, language, rated, runtime, poster, writer, country, released, imdbID, genre, production: String?
    var ratings: [RatingData]?
    var response: String = "false"
    
    func mapping(map: Map) {
        metascore <- map["Metascore"]
        title <- map["Title"]
        boxOffice <- map["BoxOffice"]
        website <- map["Website"]
        awards <- map["Awards"]
        
        director <- map["Director"]
        imdbRating <- map["imdbRating"]
        dvd <- map["DVD"]
        response <- map["Response"]
        actors <- map["Actors"]
        
        year <- map["Year"]
        plot <- map["Plot"]
        imdbVotes <- map["imdbVotes"]
        type <- map["Type"]
        language <- map["Language"]
        
        rated <- map["Rated"]
        title <- map["Title"]
        runtime <- map["Runtime"]
        poster <- map["Poster"]
        writer <- map["Writer"]
        
        country <- map["Country"]
        ratings <- map["Ratings"]
        released <- map["Released"]
        imdbID <- map["imdbID"]
        genre <- map["Genre"]
        
        production <- map["Production"]
    }
    
    required init?(map: Map) {}
}

class RatingData: Mappable {
    var source, value: String?
    
    func mapping(map: Map) {
        source <- map["Source"]
        value <- map["Value"]
    }
    
    required init?(map: Map) {}
}
