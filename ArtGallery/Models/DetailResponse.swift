//
//  DetailResponse.swift
//  ArtGallery
//
//  Created by Halil Ibrahim Andic on 23.05.2023.
//

import Foundation

class DetailResponse: Codable{
    var data: [DetailModel]?
    //var pagination: Pagination?
}

final class DetailModel: Codable {
    var title, imageID, artistTitle, history, dimensions: String?
    var id: Int?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case imageID = "image_id"
        case artistTitle = "artist_title"
        case history = "publication_history"
        case dimensions = "dimensions"
        case id = "id"
    }
}
