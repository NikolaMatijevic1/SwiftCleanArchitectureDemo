//
//  Endpoint.swift
//  CleanArchitectureDemo
//
//  Created by Nikola Matijevic on 29/04/2019.
//  Copyright © 2019 Nikola Matijevic. All rights reserved.
//

import Foundation

enum Endpoint {
    case movieSearch(movieName: String)
    
    var parameters: String {
        switch self {
        case let .movieSearch(movieName: movieName):
            return "&query=\(movieName)"
        }
    }
}
