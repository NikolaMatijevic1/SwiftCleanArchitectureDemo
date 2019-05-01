//
//  PosterProvider.swift
//  CleanArchitectureDemo
//
//  Created by Nikola Matijevic on 01/05/2019.
//  Copyright © 2019 Nikola Matijevic. All rights reserved.
//

import Foundation


protocol PosterProvider {
    func fetchPoster(for path: String, completion: @escaping (Response<Data>) -> Void)
}
