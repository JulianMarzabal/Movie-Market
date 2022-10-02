//
//  MovieModel.swift
//  Movie Market
//
//  Created by Julian Marzabal on 26/09/2022.
//

import Foundation

struct MovieResponse:Decodable {
    let results: [Movie]
}

struct Movie:Decodable {
    
    let id: Int
    let release_date: String?
    let media: String?
 
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int?
    let vote_average: Double?
    
    
}
