//
//  TMDBPosterProvider.swift
//  CleanArchitectureDemo
//
//  Created by Nikola Matijevic on 01/05/2019.
//  Copyright © 2019 Nikola Matijevic. All rights reserved.
//

import Foundation

class TMDBPosterProvider: PosterProvider {
    let webService: WebService
    var postersCache: [String : Data ] = [:]

    init(webService: WebService = WebServiceProvider(session: DataNetworkSession())) {
        self.webService = webService
    }

    func fetchPoster(for path: String, completion: @escaping (Response<Data>) -> Void) {
        if let posterData = postersCache[path] {
            completion(.success(posterData))
        }
        guard let imageRequest = MoviePosterRequest(path: path).urlRequest else { return }
        webService.execute(imageRequest) { [weak self] (response: Response<Data>) in
            switch response {
            case .success(let imageData):
                self?.postersCache[path] = imageData
                completion(.success(imageData))
            case .error(let error):
                print(error)
            }
        }
    }
}

