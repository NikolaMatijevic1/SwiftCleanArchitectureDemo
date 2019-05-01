//
//  Movie.swift
//  CleanArchitectureDemo
//
//  Created by Nikola Matijevic on 29/04/2019.
//  Copyright © 2019 Nikola Matijevic. All rights reserved.
//

import Foundation

protocol Movie {
    var title: String { get }
    var releaseDate: Date? { get }
    var posterPath: String? { get }
    var overview: String { get }
    var rating: Double { get }
}

typealias Movies = [Movie]
