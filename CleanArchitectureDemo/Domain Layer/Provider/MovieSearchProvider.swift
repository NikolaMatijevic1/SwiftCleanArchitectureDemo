//
//  MovieSearchProvider.swift
//  CleanArchitectureDemo
//
//  Created by Nikola Matijevic on 29/04/2019.
//  Copyright © 2019 Nikola Matijevic. All rights reserved.
//

import Foundation

protocol MovieSearchProvider {
    func fetch(for term: String, completion: @escaping (Response<Movies>) -> Void)
}
