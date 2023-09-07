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
}

protocol ListOfMoviesUI: AnyObject {
    func update(movies: [ViewModel]) // view will be the presenter's delegate
}

class ListOfMoviesPresenter: ListOfMoviesPresentable {
    weak var ui: ListOfMoviesUI?
    var viewModels: [ViewModel] = []
    private var mapper: Mapper
    
    /// Interactor reference
    private let listOfPopularMoviesInteractor: ListOfMoviesInteractable // using interactor's protocol
    init(listOfPopularMoviesInteractor: ListOfMoviesInteractable, mapper: Mapper = Mapper()) {
        self.listOfPopularMoviesInteractor = listOfPopularMoviesInteractor
        self.mapper = mapper
    }
    
    /// The View will call this method throughout Delegation Pattern
    func onViewAppear() {
        Task {
            /// Calling Interactor in order to get the complete list of popular movies.
            let models = await listOfPopularMoviesInteractor.getListOfPopularMovies().results
            
            /// Entity to ViewModel data using a mapper
            viewModels = models.map(mapper.map(entity:))
            
            /// Once the presenter gets the data, this data will be shared with the View
            ui?.update(movies: viewModels)
        }
    }
}
