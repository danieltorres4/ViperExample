//
//  ListOfMoviesView.swift
//  MoviesVIPER
//
//  Created by Daniel Sanchez Torres on 05/09/23.
//

import Foundation
import UIKit

class ListOfMoviesView: UIViewController {
    
    private var moviesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MovieCellView.self, forCellReuseIdentifier: "MovieCellView")
        
        return tableView
    }()
    
    private let presenter: ListOfMoviesPresentable  /// presenter reference
    
    init(presenter: ListOfMoviesPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        setupTableView()
        
        /// When the View appears, it calls the presenter to get the info
        presenter.onViewAppear()
    }
    
    func setupTableView() {
        view.addSubview(moviesTableView)
        
        NSLayoutConstraint.activate([
            moviesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moviesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            moviesTableView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        moviesTableView.dataSource = self /// Data will be provided by ListOfMoviesView
        moviesTableView.delegate = self
    }
    
}


extension ListOfMoviesView: ListOfMoviesUI {
    func update(movies: [ViewModel]) {
        print("\n\nMOVIES")
        debugPrint(movies)
        print("\n\n")
        
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }

}

extension ListOfMoviesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onTapCell(atIndex: indexPath.row)
    }
}

extension ListOfMoviesView: UITableViewDataSource {
    
    // #Cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.viewModels.count
    }
    
    // Visual representation of our model: each movie in each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCellView", for: indexPath) as! MovieCellView
        
        let model = presenter.viewModels[indexPath.row]
        cell.configure(model: model)
        
        return cell
    }
    
    
}
