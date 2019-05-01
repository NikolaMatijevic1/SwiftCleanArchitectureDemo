//
//  PostersUseCase.swift
//  CleanArchitectureDemo
//
//  Created by Nikola Matijevic on 01/05/2019.
//  Copyright © 2019 Nikola Matijevic. All rights reserved.
//

import Foundation

protocol PostersUseCase {
    func fetchPosters(for paths: [String], completion: @escaping (Response<Poster>)-> Void)
}
