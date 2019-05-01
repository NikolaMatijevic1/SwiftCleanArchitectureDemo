//
//  ApiRequest.swift
//  CleanArchitectureDemo
//
//  Created by Nikola Matijevic on 29/04/2019.
//  Copyright © 2019 Nikola Matijevic. All rights reserved.
//

import Foundation

struct ApiRequest {
    let baseUrlString = "https://api.themoviedb.org/3/search/movie?"
    let apiKey = "api_key=b095c65e998c86058e9b46ef86674daa"
    let endpoint: Endpoint

    init(endpoint: Endpoint) {
        self.endpoint = endpoint
    }

    var urlRequest: URLRequest? {
        let urlString = baseUrlString + apiKey +  endpoint.parameters
        guard let url = URL(string: urlString) else { return nil }
        return URLRequest(url: url)

    }
}

enum RequestError: Error {
    case urlRequestFailed
}
