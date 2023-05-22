//
//  ArtworkModel.swift
//  ArtGallery
//
//  Created by Halil Ibrahim Andic on 22.05.2023.
//

import Foundation

final class ArtworkModel: Codable {
    var title, image_id: String?
    var id: Int?
    //var _score: Double?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case id = "ID"
        case image_id = "image_id"
    }
}
