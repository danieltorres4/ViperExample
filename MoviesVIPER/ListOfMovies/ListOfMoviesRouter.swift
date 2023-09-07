//
//  ListOfMoviesRouter.swift
//  MoviesVIPER
//
//  Created by Daniel Sanchez Torres on 05/09/23.
//

import Foundation
import UIKit

class ListOfMoviesRouter {
    func showListOfPopularMovies(window: UIWindow?) {
        /// References
        let interactor = ListOfMoviesInteractor()
        let presenter = ListOfMoviesPresenter(listOfPopularMoviesInteractor: interactor)
        let view = ListOfMoviesView(presenter: presenter)
        
        presenter.ui = view
        
        /// Showing...
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
