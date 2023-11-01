//
//  ListOfMoviesPresenter.swift
//  MoviesVIPER
//
//  Created by Daniel Sanchez Torres on 05/09/23.
//

import Foundation

protocol ListOfMoviesPresentable: AnyObject {
    var ui: ListOfMoviesUI? { get }
    var viewModels: [ViewModel] { get }
    func onViewAppear()
    func onTapCell(atIndex: Int)
}

protocol ListOfMoviesUI: AnyObject {
    func update(movies: [ViewModel]) // view will be the presenter's delegate
}

class ListOfMoviesPresenter: ListOfMoviesPresentable {
    weak var ui: ListOfMoviesUI?
    var viewModels: [ViewModel] = []
    private var models: [PopularMovieEntity] = []
    private var mapper: Mapper
    private let router: ListOfMoviesRouting
    
    /// Interactor reference
    private let listOfPopularMoviesInteractor: ListOfMoviesInteractable // using interactor's protocol
    init(listOfPopularMoviesInteractor: ListOfMoviesInteractable, mapper: Mapper = Mapper(), router: ListOfMoviesRouting) {
        self.listOfPopularMoviesInteractor = listOfPopularMoviesInteractor
        self.mapper = mapper
        self.router = router
    }
    
    /// The View will call this method throughout Delegation Pattern
    func onViewAppear() {
        Task {
            /// Calling Interactor in order to get the complete list of popular movies.
            models = await listOfPopularMoviesInteractor.getListOfPopularMovies().results
            
            /// Entity to ViewModel data using a mapper
            viewModels = models.map(mapper.map(entity:))
            
            /// Once the presenter gets the data, this data will be shared with the View
            ui?.update(movies: viewModels)
        }
    }
    
    func onTapCell(atIndex: Int) {
        let movieId = models[atIndex].id
        router.showMovieDetails(withMovieId: movieId.description)
    }
}
