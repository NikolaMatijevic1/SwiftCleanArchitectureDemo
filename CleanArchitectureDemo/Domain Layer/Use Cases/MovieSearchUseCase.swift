//
//  MovieSearchUseCase.swift
//  CleanArchitectureDemo
//
//  Created by Nikola Matijevic on 28/04/2019.
//  Copyright © 2019 Nikola Matijevic. All rights reserved.
//

import Foundation

protocol MovieSearchUseCase {
    func search(for term: String, completion: @escaping (Response<Movies>) -> Void)
}
