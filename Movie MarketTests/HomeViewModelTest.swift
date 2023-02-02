//
//  Movie_MarketTests.swift
//  Movie MarketTests
//
//  Created by Julian Marzabal on 22/12/2022.
//

import XCTest
@testable import Movie_Market

class HomeViewModelTest: XCTestCase {
    
    var sut: HomeViewmodel!
    var api: APIProtocol!
    var delegate: HomeViewModelDelegateMock!
    

    override func setUpWithError() throws {
        api = APIMock()
        sut = .init(api: api)
        delegate = .init()
        sut.delegate = delegate
    }

    override func tearDownWithError() throws {
        api = nil
        sut = nil
        delegate = nil
    }

    func testExample() throws {
        // Given
        var hasGetMovieGetResults = false
        sut.onSuccessfulUpdateReaction = {
            hasGetMovieGetResults = true
        }
        // When
        sut.getMovies()
        
        // Then
        
        XCTAssert(hasGetMovieGetResults)
        XCTAssert(sut.movies.count == 1)
        
        
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testUpdateViewModel(){
        //Given
        var hasUpdateviewmodel = false
        sut.onSuccessfulUpdateReaction = {
            hasUpdateviewmodel = true
        }
        // When
        sut.updateViewModel()
        
        // Then
        XCTAssert(hasUpdateviewmodel)
        XCTAssertFalse(sut.movieViewModel.isEmpty == false)
        
    }
    
    func testSelectMovie() {
        sut.getMovies()
        // When
        sut.selectMovieBy(index: 0)
        
        //Then
        XCTAssert(delegate.onViewCalled)
        XCTAssert(delegate.movie?.media == "movie")
    }
    
    func testSelectMovieOutOfIndex() {
        sut.getMovies()
        // When
        sut.selectMovieBy(index: 12)
        
        //Then
        XCTAssertFalse(delegate.onViewCalled)
        XCTAssertNil(delegate.movie)
    }
    
    func testUpdateMovieSelect(){
        sut.getMovies()
        
        sut.updateMovie(id:4 , isSelected: true)
        
        XCTAssert(sut.moviesSelected.count == 1)
        
        
    }
    
    func testDiselectMovie() {
        sut.getMovies()
        
        //When
        sut.updateMovie(id:4 , isSelected: true)
        sut.updateMovie(id: 4, isSelected: false)
        
        //Then
        XCTAssert(sut.moviesSelected.count == 0)
        
    }
    
    

    
}
