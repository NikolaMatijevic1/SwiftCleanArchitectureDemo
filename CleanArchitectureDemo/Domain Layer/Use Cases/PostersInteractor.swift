//
//  PostersInteractor.swift
//  CleanArchitectureDemo
//
//  Created by Nikola Matijevic on 01/05/2019.
//  Copyright © 2019 Nikola Matijevic. All rights reserved.
//

import Foundation

class PostersInteractor: PostersUseCase {
    let provider: PosterProvider

    init(provider: PosterProvider) {
        self.provider = provider
    }

    func fetchPosters(for paths: [String], completion: @escaping (Response<Poster>) -> Void) {
        paths.forEach { path in
            provider.fetchPoster(for: path, completion: { response in
                switch response {
                case .success(let posterData):
                    completion(.success(Poster(path: path, image: posterData)))
                case .error(let error):
                    print(error.localizedDescription)
                }
            })
        }
    }
}
