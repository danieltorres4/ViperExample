//
//  PopularMovieResponseEntity.swift
//  MoviesVIPER
//
//  Created by Daniel Sanchez Torres on 05/09/23.
//

import Foundation

struct PopularMovieResponseEntity: Decodable {
    var results: [PopularMovieEntity]
}
