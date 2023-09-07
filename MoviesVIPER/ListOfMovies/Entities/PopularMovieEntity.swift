//
//  PopularMovieEntity.swift
//  MoviesVIPER
//
//  Created by Daniel Sanchez Torres on 05/09/23.
//

import Foundation

struct PopularMovieEntity: Decodable {
    var id: Int
    var title: String
    var overview: String
    var imageURL: String
    var vote: Double
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case imageURL = "poster_path"
        case vote = "vote_average"
    }
}
