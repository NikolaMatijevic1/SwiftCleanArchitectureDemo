//
//  OMDBMovieSearchProvider.swift
//  CleanArchitectureDemo
//
//  Created by Nikola Matijevic on 29/04/2019.
//  Copyright © 2019 Nikola Matijevic. All rights reserved.
//

import Foundation

class TMDBMovieSearchProvider: MovieSearchProvider {

    let webService: WebService

    init(webService: WebService = WebServiceProvider(session: DataNetworkSession())) {
        self.webService = webService
    }

    func fetch(for term: String, completion: @escaping (Response<Movies>) -> Void) {
        guard let request = ApiRequest(endpoint: .movieSearch(movieName: term)).urlRequest else { return }
        print(request)
        webService.execute(request) { (response: Response<Result>) in
            switch response {
            case .success(let movies):
                completion(.success(movies.movies))
            case .error(let error):
                print(error)
            }
        }
    }
}

struct Result: Decodable {
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
    var movies : [TMDBMovie]
}

struct TMDBMovie: Movie, Decodable {
    enum CodingKeys: String, CodingKey {
        case title
        case date = "release_date"
        case posterPath = "poster_path"
        case overview
        case rating = "vote_average"
    }

    let title: String
    var releaseDate: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd"
        return  formatter.date(from: date)

    }

    let posterPath: String?
    let overview: String
    let date: String
    var rating: Double
}
