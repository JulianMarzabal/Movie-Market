//
//  APICaller.swift
//  Movie Market
//
//  Created by Julian Marzabal on 25/09/2022.
//

import Foundation
import Alamofire

fileprivate struct Constants {
    static let APIKey = "c876ca87c400f39cd8a257467c590fa8"
    static let BaseUrl = "https://api.themoviedb.org"
}

protocol APIProtocol:AnyObject {
    func getMovies(completion: @escaping (Result<[Movie],Error>) -> Void)
    
}

class APICaller: APIProtocol {
    
    static let shared = APICaller()
    
    func getMovies(completion: @escaping (Result<[Movie],Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.BaseUrl)//3/trending/movie/day?api_key=\(Constants.APIKey)") else {return}
        
        let request = AF.request(url)
        request.responseData() { response in
            guard let data = response.data else {
                return
            }
            let decoder = JSONDecoder()
            
            do {
                let response = try decoder.decode(MovieResponse.self, from: data)
                completion(.success(response.results))
                
            } catch {
                completion(.failure(error))
            }
            
        }
    }
}
