//
//  CoordinatorTest.swift
//  Movie MarketTests
//
//  Created by Julian Marzabal on 12/01/2023.
//

import XCTest
@testable import Movie_Market

class CoordinatorTest: XCTestCase {
    var sut: MainCoordinator!
    var navController: UINavigationController!
 
    

    override func setUpWithError() throws {
        navController = .init()
        sut = .init(navigationController: navController)
    }

    override func tearDownWithError() throws {
        sut = nil
        navController = nil
        
    }
    
    func testStart() {
        
        sut.start()
        
        XCTAssertNotNil(navController.viewControllers.last as? WelcomeViewController)
        XCTAssertNil(navController.viewControllers.last as? HomeViewController)
      
    }
    
    
    
}
