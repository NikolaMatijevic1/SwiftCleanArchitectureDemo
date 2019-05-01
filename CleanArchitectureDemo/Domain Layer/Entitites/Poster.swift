//
//  Poster.swift
//  CleanArchitectureDemo
//
//  Created by Nikola Matijevic on 01/05/2019.
//  Copyright © 2019 Nikola Matijevic. All rights reserved.
//

import Foundation

struct Poster {
    var path: String
    var image: Data

    init(path: String, image: Data ){
        self.path = path
        self.image = image
    }
}
