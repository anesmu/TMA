//
//  Constants.swift
//  TMA
//
//  Created by Antonio Espino Muñoz on 2/3/22.
//

import Foundation

struct Constants {
    static let apiKey = "?api_key=157e2c600e4edec03a9fb324ed354052"

    struct URL {
        static let main = "https://api.themoviedb.org/"
        static let urlImages = "https://image.tmdb.org/t/p/w200"
    }

    struct Endpoints {
        static let urlListPopularMovies = "3/movie/popular"
        static let urlDetailsMovie = "3/movie/"
    }
}
