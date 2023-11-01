//
//  MovieDetailInteractor.swift
//  MoviesVIPER
//
//  Created by Daniel Sanchez Torres on 07/09/23.
//

import Foundation

protocol MovieDetailInteractable: AnyObject {
    func getDetailMovie(with id: String) async -> MovieDetailEntity
}

class MovieDetailInteractor: MovieDetailInteractable {
    let apiK = "aac68339b14a798e91c45b11fd82e3ee"
    
    /// HTTP petition with the movie ID received
    func getDetailMovie(with id: String) async -> MovieDetailEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=\(apiK)")!
        
        let (data, _) = try! await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try! jsonDecoder.decode(MovieDetailEntity.self, from: data)
        
    }
}
