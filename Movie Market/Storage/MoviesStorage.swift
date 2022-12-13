//
//  MoviesStorage.swift
//  Movie Market
//
//  Created by Julian Marzabal on 01/12/2022.
//

import Foundation
class MoviesStorage {
    static var shared: MoviesStorage = .init()
    var movies: [Movie] = [] {
        didSet {
            movies.first?.original_name 
            print(movies.count)
            
        }
        
    }
}
