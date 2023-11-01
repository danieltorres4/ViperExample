//
//  MovieDetailViewModelMapper.swift
//  MoviesVIPER
//
//  Created by Daniel Sanchez Torres on 07/09/23.
//

import Foundation

struct MovieDetailViewModelMapper {
    func map(entity: MovieDetailEntity) -> MovieDetailsViewModel {
        .init(title: entity.title, overview: entity.overview, backdropPath: URL(string: "https://image.tmdb.org/t/p/w200" + entity.backdropPath))
    }
}
