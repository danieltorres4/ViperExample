//
//  Mapper.swift
//  MoviesVIPER
//
//  Created by Daniel Sanchez Torres on 07/09/23.
//

import Foundation

struct Mapper {
    func map(entity: PopularMovieEntity) -> ViewModel {
        /// Entity to ViewModel data
        ViewModel(title: entity.title, overview: entity.overview, imageURL: URL(string: "https://image.tmdb.org/t/p/w200" + entity.imageURL))
    }
}
