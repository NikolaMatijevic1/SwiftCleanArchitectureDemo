//
//  AppDepenciesContainer.swift
//  CleanArchitectureDemo
//
//  Created by Nikola Matijevic on 29/04/2019.
//  Copyright © 2019 Nikola Matijevic. All rights reserved.
//

import Foundation

class AppDependenciesContainer: ResultVCDependencies {
    var postersUseCase: PostersUseCase = PostersInteractor(provider: TMDBPosterProvider())
    var searchUseCase: MovieSearchUseCase = MovieSearchInteractor(provider: TMDBMovieSearchProvider())
}
