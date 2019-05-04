//
//  ResultVCDataSource.swift
//  CleanArchitectureDemo
//
//  Created by Nikola Matijevic on 30/04/2019.
//  Copyright © 2019 Nikola Matijevic. All rights reserved.
//

import UIKit

protocol ResultVCDependencies {
    var searchUseCase: MovieSearchUseCase { get }
    var postersUseCase: PostersUseCase { get }
}

protocol DataSourceUpdateFeedback: class {
    func dataSourceUpdated()
}

class ResultVCDataSource: NSObject {
    let cellID = "movieCell"
    let dependencies: ResultVCDependencies
    var movies = Movies()
    weak var feedback: DataSourceUpdateFeedback?

    init(dependencies: ResultVCDependencies){
        self.dependencies = dependencies
    }

    func fetchMovies(for term: String) {
        dependencies.searchUseCase.search(for: term) { [weak self] resp in
            switch resp {
            case .success(let movies):
                self?.movies = movies
                self?.feedback?.dataSourceUpdated()
            case .error(let error):
                print(error.localizedDescription)
            }
        }
    }

    func fetchPosters(for indexPaths: [IndexPath], in tableView: UITableView) {
        guard let first = indexPaths.first?.row, let last = indexPaths.last?.row, last >= first else { return }
        let paths = movies[first...last].compactMap { $0.posterPath }
        dependencies.postersUseCase.fetchPosters(for: paths) { [weak self] response in
            switch response {
            case .success(let poster):
                self?.updatePosters(with: poster, in: tableView)
            case .error(let error):
                print(error.localizedDescription)
            }
        }
    }

    func updatePosters(with poster:Poster, in tableView: UITableView) {
        guard let cells = tableView.visibleCells as? [MovieCell], let cell = cells.first(where: { $0.posterPath == poster.path }), let image = UIImage(data: poster.image) else { return }
            cell.posterImageView?.image = image

    }
}

extension ResultVCDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        guard let movieCell = cell as? MovieCell else { return cell }
        let movie = movies[indexPath.row]
        if movie.releaseDate != nil {
            movieCell.dateLabel.text = movieCell.dateFormatter.string(from: movie.releaseDate!)
        }
        movieCell.movieTitleLabel.text = movie.title
        movieCell.descriptionLabel.text = movie.overview
        movieCell.ratingLabel.text = "\(movie.rating)"
        movieCell.posterPath = movie.posterPath
        return movieCell
    }
}
