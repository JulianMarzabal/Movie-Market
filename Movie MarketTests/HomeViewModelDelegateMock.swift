//
//  HomeViewModelDelegateMock.swift
//  Movie MarketTests
//
//  Created by Julian Marzabal on 05/01/2023.
//

import Foundation
@testable import Movie_Market

class HomeViewModelDelegateMock: HomeViewDelegate {
    func onLogOut() {
        
    }
    
    func onView(movie: Movie) {
        onViewCalled = true
        self.movie = movie
    }
    var onViewCalled = false
    var movie: Movie?
    
}
