//
//  ListOfMoviesRouter.swift
//  MoviesVIPER
//
//  Created by Daniel Sanchez Torres on 05/09/23.
//

import Foundation
import UIKit

protocol ListOfMoviesRouting: AnyObject {
    var routerDetail: MovieDetailsRouting? { get }
    var listOfMoviesView: ListOfMoviesView? { get }
    
    func showListOfPopularMovies(window: UIWindow?)
    func showMovieDetails(withMovieId movieId: String)
}

class ListOfMoviesRouter: ListOfMoviesRouting {
    /// Reference to the MovieDetailsRouter
    var routerDetail: MovieDetailsRouting?
    var listOfMoviesView: ListOfMoviesView?
    
    func showListOfPopularMovies(window: UIWindow?) {
        self.routerDetail = MovieDetailRouter()
        /// References
        let interactor = ListOfMoviesInteractor()
        let presenter = ListOfMoviesPresenter(listOfPopularMoviesInteractor: interactor, router: self)
        listOfMoviesView = ListOfMoviesView(presenter: presenter)
        
        presenter.ui = listOfMoviesView
        
        /// Showing...
        window?.rootViewController = listOfMoviesView
        window?.makeKeyAndVisible()
    }
    
    func showMovieDetails(withMovieId movieId: String) {
        guard let fromViewController = listOfMoviesView else { return }
        routerDetail?.showMovieDetails(fromViewController: fromViewController, with: movieId)
    }
}
