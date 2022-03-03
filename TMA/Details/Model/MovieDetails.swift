//
//  MovieDetails.swift
//  TMA
//
//  Created by Antonio Espino Muñoz on 3/3/22.
//

import Foundation

struct MovieDetails: Codable {
    let title: String
    let posterPath: String
    let sinopsis: String
    let releaseDate: String
    let originalTitle: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case title
        case posterPath = "poster_path"
        case sinopsis = "overview"
        case releaseDate = "release_date"
        case originalTitle = "original_title"
        case voteAverage = "vote_average"
    }
}
