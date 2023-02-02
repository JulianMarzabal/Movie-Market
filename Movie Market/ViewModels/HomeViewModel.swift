//
//  HomeViewModel.swift
//  Movie Market
//
//  Created by Julian Marzabal on 15/12/2022.
//

import Foundation
import UIKit

protocol HomeViewDelegate: AnyObject {
    func onView(movie: Movie)
    func onLogOut() 
    
}

class HomeViewmodel {
    
   private(set) var movies: [Movie] = [Movie]()
    weak var delegate: HomeViewDelegate?
    private var api: APIProtocol
    var movieViewModel: [MovieViewModel] = []
    var onSuccessfulUpdateReaction:  (() -> Void)?
    
    init(api: APIProtocol = APICaller.shared){
        self.api = api
    }
    
    private (set) var moviesSelected: [Movie] = MoviesStorage.shared.movies {
        didSet{
            MoviesStorage.shared.movies = moviesSelected
            
        }
    }
    
    func selectMovieBy(index: Int) {
        guard index < movies.count else { return }
        delegate?.onView(movie: movies[index])
    }
    
     func getMovies(){
        api.getMovies { [weak self ]results in
            switch results {
            case .success(let movies):
                print("all is ok")
                self?.movies = movies
                self?.createViewModel()
                self?.onSuccessfulUpdateReaction?()
                
         
            case .failure(let error):
                print(error)
            }
        }
    }
    func updateMovie(id: Int, isSelected: Bool){
        isSelected ? movieSelection(id: id) : removeMovieSelection(id: id)
        
        
        
    }
    private func movieSelection(id: Int){
        if moviesSelected.first(where: {
            $0.id == id
        }) == nil {
            if let movie = movies.first(where: {
                $0.id == id
            }) {
                moviesSelected.append(movie)
            }
        }
            
        
    }
    private func removeMovieSelection(id: Int){
        if let index = moviesSelected.firstIndex(where: {
            $0.id == id
        }) {
            moviesSelected.remove(at: index)
        }
    }
    
    private func isMovieSelected(id:Int) -> Bool{
        var isMovieSelected: Bool = false
        var index = 0
        while (!isMovieSelected && index < moviesSelected.count ) {
            if moviesSelected[index].id == id {
                isMovieSelected = true
            } else {
                index += 1
                
            }
        
        }
        
        return isMovieSelected
    }
    
    func updateViewModel(){
        moviesSelected = MoviesStorage.shared.movies
        createViewModel()
        onSuccessfulUpdateReaction?()
    }
    
    private func createViewModel(){
        movieViewModel = []
        for movie in movies {
            movieViewModel.append(.init(id: movie.id, titleName: movie.original_title ?? "unknown" , posterURL: movie.poster_path ?? "unknown ", isSelectedMovie: isMovieSelected(id: movie.id)))
        }
        
    }
    
    
}



