//
//  HomeViewControllerTest.swift
//  Movie MarketTests
//
//  Created by Julian Marzabal on 12/01/2023.
//

import XCTest
@testable import Movie_Market

class WelcomeViewModelTest: XCTestCase {
    
    var sut: WelcomeViewModel!

    var delegate: WelcomeViewDelegateMock!
    

    override func setUpWithError() throws {
        //sut = WelcomeViewController(viewModel: .init())
        sut = WelcomeViewModel()
        delegate = .init()
        //sut.delegate = delegate
    }

    override func tearDownWithError() throws {
        sut = nil
        delegate = nil
        
    }
    func testValidEmail() {
        let email = "julian@gm.com"
        
        
        let result = sut.isValidEmail(email)
        
        XCTAssert(result)

        
    }
    
    func testExpectedBehaviorFromValidEmail() {
        sut.isValidEmail("julian@gm.com")
        //sut.emailField.text = "julian@gm.com"
        //sut.didTapSignIn()
        
        
        XCTAssert(delegate.onSuccessCalled)
      
        
    }
    
    
}


class WelcomeViewDelegateMock: WelcomeViewDelegate {
    func onSuccess() {
        onSuccessCalled = true
    }
    var onSuccessCalled = false
    
    
}
