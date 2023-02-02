//
//  APIMock.swift
//  Movie MarketTests
//
//  Created by Julian Marzabal on 22/12/2022.
//

import Foundation
@testable import Movie_Market

class APIMock: APIProtocol{
    var arrayMovies:[Movie] = [.init(id: 4, release_date: "22-333", media: "movie", original_name: "IOS", original_title: "APPLE", poster_path: "ggg", overview: "10", vote_count: 8, vote_average: 5.6)]
    func getMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        completion(.success(arrayMovies))
    }
    
    
    
    
}
