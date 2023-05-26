//
//  Constants.swift
//  ArtGallery
//
//  Created by Halil Ibrahim Andic on 21.05.2023.
//

import Foundation

final class Constants {
    static let baseURL = "https://api.artic.edu/api/v1/artworks"
    static let host = "api.artic.edu"
    static let path = "/api/v1/artworks/search"
    static let pageLimit = 20
    static let fieldParameters = "title,image_id,id,artist_title"
    static let detailFieldParameters = "title,artist_title,image_id,dimensions,publication_history"
}
