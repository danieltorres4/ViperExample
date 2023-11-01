//
//  MovieDetailRouter.swift
//  MoviesVIPER
//
//  Created by Daniel Sanchez Torres on 07/09/23.
//

import Foundation
import UIKit

protocol MovieDetailsRouting: AnyObject {
    func showMovieDetails(fromViewController: UIViewController, with movieId: String)
}

class MovieDetailRouter: MovieDetailsRouting {
    func showMovieDetails(fromViewController: UIViewController, with movieId: String) {
        let interactor = MovieDetailInteractor()
        let presenter = MovieDetailPresenter(movieId: movieId, interactor: interactor, mapper: MovieDetailViewModelMapper())
        let view = MovieDetailView(presenter: presenter)
        
        presenter.ui = view
        
        fromViewController.present(view, animated: true)
    }
}
