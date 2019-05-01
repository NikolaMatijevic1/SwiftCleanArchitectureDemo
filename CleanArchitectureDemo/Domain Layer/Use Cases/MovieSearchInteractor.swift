//
//  MovieSearchUseCase.swift
//  CleanArchitectureDemo
//
//  Created by Nikola Matijevic on 29/04/2019.
//  Copyright © 2019 Nikola Matijevic. All rights reserved.
//

import Foundation

class MovieSearchInteractor: MovieSearchUseCase {

    let provider: MovieSearchProvider

    init(provider: MovieSearchProvider) {
        self.provider = provider
    }
    func search(for term: String, completion: @escaping (Response<Movies>) -> Void) {
        provider.fetch(for: term, completion: completion)
    }
}
