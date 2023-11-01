//
//  MovieDetailPresenter.swift
//  MoviesVIPER
//
//  Created by Daniel Sanchez Torres on 07/09/23.
//

import Foundation

protocol MovieDetaiPresenterlUI: AnyObject {
    func update(view: MovieDetailsViewModel) // view will be the presenter's delegate
}

protocol MovieDetailPresentable: AnyObject {
    var ui: MovieDetaiPresenterlUI? { get }
    var movieId: String { get }
    func onViewAppear()
}

class MovieDetailPresenter: MovieDetailPresentable {
    weak var ui: MovieDetaiPresenterlUI?
    let movieId: String
    private var interactor: MovieDetailInteractable
    private let mapper: MovieDetailViewModelMapper
    
    init(movieId: String, interactor: MovieDetailInteractable, mapper: MovieDetailViewModelMapper) {
        self.movieId = movieId
        self.interactor = interactor
        self.mapper = mapper
    }
    
    func onViewAppear() {
        Task {
            let model = await interactor.getDetailMovie(with: movieId)
            
            /// MAPPER
            let viewModel = mapper.map(entity: model)
            
            /// ViewModel data is sent to UI
            await MainActor.run {
                self.ui?.update(view: viewModel)
                debugPrint(viewModel)
            }
        }
    }
}
