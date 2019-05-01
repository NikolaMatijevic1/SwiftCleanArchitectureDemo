//
//  MoviePosterRequest.swift
//  CleanArchitectureDemo
//
//  Created by Nikola Matijevic on 29/04/2019.
//  Copyright © 2019 Nikola Matijevic. All rights reserved.
//

import Foundation

class MoviePosterRequest {
    let baseUrlString = "https://image.tmdb.org/t/p/"
    let imageSize = "w92"
    let imagePath: String

    init(path: String) {
        imagePath = path
    }

    var urlRequest: URLRequest? {
        let urlString = baseUrlString + imageSize + "/" + imagePath
        guard let url = URL(string: urlString) else { return nil }
        return URLRequest(url: url)
    }
}

