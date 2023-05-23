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
    var title, image_id: String?
    var id: Int?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case id = "ID"
        case image_id = "image_id"
    }
}

//class Pagination: Codable {
//    let total, limit, offset, totalPages: Int?
//    let currentPage: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case total, limit, offset
//        case totalPages = "total_pages"
//        case currentPage = "current_page"
//    }
//}
