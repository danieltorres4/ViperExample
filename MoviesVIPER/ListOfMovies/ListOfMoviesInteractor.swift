//
//  ListOfMoviesInteractor.swift
//  MoviesVIPER
//
//  Created by Daniel Sanchez Torres on 05/09/23.
//

import Foundation

protocol ListOfMoviesInteractable: AnyObject {
    func getListOfPopularMovies() async -> PopularMovieResponseEntity
}

class ListOfMoviesInteractor: ListOfMoviesInteractable {
    let apiK = "aac68339b14a798e91c45b11fd82e3ee"
    
    /// The following method will be called from de Presenter
    func getListOfPopularMovies() async -> PopularMovieResponseEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiK)")!
        
        let (data, _) = try! await URLSession.shared.data(from: url)
        
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
}

class ListOfMoviesInteractorMock: ListOfMoviesInteractable {
    func getListOfPopularMovies() async -> PopularMovieResponseEntity {
        return PopularMovieResponseEntity(results: [
            .init(id: 1, title: "Hola 1", overview: "Overview 1", imageURL: "", vote: 10),
            .init(id: 2, title: "Hola 2", overview: "Overview 2", imageURL: "", vote: 10),
            .init(id: 3, title: "Hola 3", overview: "Overview 3", imageURL: "", vote: 10),
            .init(id: 4, title: "Hola 4", overview: "Overview 4", imageURL: "", vote: 10)
        ])
    }
}
