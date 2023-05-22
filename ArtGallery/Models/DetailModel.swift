//
//  DetailModel.swift
//  ArtGallery
//
//  Created by Halil Ibrahim Andic on 22.05.2023.
//

import Foundation

final class DetailModel: Codable {
    var title, image_id, artist_display, publication_history, dimensions: String?
    var id: Int?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case image_id = "Image ID"
        case artist_display = "Artist Display"
        case publication_history = "Publication History"
        case dimensions = "Dimensions"
        case id
    }
}
