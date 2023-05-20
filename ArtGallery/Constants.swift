//
//  Constants.swift
//  ArtGallery
//
//  Created by Halil Ibrahim Andic on 21.05.2023.
//

import Foundation

final class Constants {
    static let baseURL = "https://api.artic.edu/api/v1/artworks"
    static let isBoostedURL = "https://api.artic.edu/api/v1/artworks/search?query[term][is_boosted]=true&fields=title,artist_display,image_id, dimensions, publication_history"
}
