//
//  ArtworkResponse.swift
//  ArtGallery
//
//  Created by Halil Ibrahim Andic on 23.05.2023.
//

import Foundation

final class ArtworkResponse: Codable{
    var data: [ArtworkModel]?
    //var pagination: Pagination?
}

final class ArtworkModel: Codable {
    var title, artistTitle, imageID: String?
    var id: Int?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case artistTitle = "artist_title"
        case id = "id"
        case imageID = "image_id"
    }
}

//class Pagination: Codable {
//    let nextURL: String
//
//    enum CodingKeys: String, CodingKey {
//        case nextURL = "next_url"
//    }
//}
