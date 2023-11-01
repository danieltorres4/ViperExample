//
//  MovieDetailView.swift
//  MoviesVIPER
//
//  Created by Daniel Sanchez Torres on 07/09/23.
//

import Foundation
import UIKit
import Kingfisher

class MovieDetailView: UIViewController {
    private let presenter: MovieDetailPresentable
    
    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let movieName: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 32, weight: .bold, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let movieOverview: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .bold, width: .standard)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    init(presenter: MovieDetailPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        
        presenter.onViewAppear()
    }
    
    func setupView() {
        view.addSubview(movieImageView)
        view.addSubview(movieName)
        view.addSubview(movieOverview)
        
        NSLayoutConstraint.activate([
            movieImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            movieImageView.heightAnchor.constraint(equalToConstant: 200),
            movieImageView.widthAnchor.constraint(equalToConstant: 300),
            
            movieName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            movieName.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 20),
            
            movieOverview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieOverview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            movieOverview.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 20)
        ])
    }
}

extension MovieDetailView: MovieDetaiPresenterlUI {
    func update(view: MovieDetailsViewModel) {
        movieImageView.kf.setImage(with: view.backdropPath)
        movieName.text = view.title
        movieOverview.text = view.overview
    }
}
