//
//  Manager.swift
//  Movie Market
//
//  Created by Julian Marzabal on 25/09/2022.
//

import Foundation

final class Manager {
    static let shared = Manager()
    
    private init() {}
    var isSignedIn: Bool {
        return false
    }
}
