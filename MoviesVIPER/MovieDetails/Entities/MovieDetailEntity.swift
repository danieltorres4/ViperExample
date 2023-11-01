//
//  MovieDetailEntity.swift
//  MoviesVIPER
//
//  Created by Iván Sánchez Torres on 07/09/23.
//

import Foundation

struct MovieDetailEntity: Decodable {
    let title: String
    let overview: String
    let backdropPath: String
    let status: String
    let releaseDate: String
    let voteAverage: Double
    let tagline: String
}
