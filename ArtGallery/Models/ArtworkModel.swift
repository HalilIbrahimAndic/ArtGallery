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

//class ArtworkModel: Codable {
//    let pagination: Pagination?
//    let data: [Datum]?
//    let info: Info?
//    let config: Config?
//
//    init(pagination: Pagination?, data: [Datum]?, info: Info?, config: Config?) {
//        self.pagination = pagination
//        self.data = data
//        self.info = info
//        self.config = config
//    }
//}
//
//// MARK: - Config
//class Config: Codable {
//    let iiifURL: String?
//    let websiteURL: String?
//
//    enum CodingKeys: String, CodingKey {
//        case iiifURL = "iiif_url"
//        case websiteURL = "website_url"
//    }
//
//    init(iiifURL: String?, websiteURL: String?) {
//        self.iiifURL = iiifURL
//        self.websiteURL = websiteURL
//    }
//}
//
//// MARK: - Datum
//class Datum: Codable {
//    let score: Double?
//    let id: Int?
//    let imageID, title: String?
//
//    enum CodingKeys: String, CodingKey {
//        case score = "_score"
//        case id
//        case imageID = "image_id"
//        case title
//    }
//
//    init(score: Double?, id: Int?, imageID: String?, title: String?) {
//        self.score = score
//        self.id = id
//        self.imageID = imageID
//        self.title = title
//    }
//}
//
//// MARK: - Info
//class Info: Codable {
//    let licenseText: String?
//    let licenseLinks: [String]?
//    let version: String?
//
//    enum CodingKeys: String, CodingKey {
//        case licenseText = "license_text"
//        case licenseLinks = "license_links"
//        case version
//    }
//
//    init(licenseText: String?, licenseLinks: [String]?, version: String?) {
//        self.licenseText = licenseText
//        self.licenseLinks = licenseLinks
//        self.version = version
//    }
//}
//
//// MARK: - Pagination
//class Pagination: Codable {
//    let total, limit, offset, totalPages: Int?
//    let currentPage: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case total, limit, offset
//        case totalPages = "total_pages"
//        case currentPage = "current_page"
//    }
//
//    init(total: Int?, limit: Int?, offset: Int?, totalPages: Int?, currentPage: Int?) {
//        self.total = total
//        self.limit = limit
//        self.offset = offset
//        self.totalPages = totalPages
//        self.currentPage = currentPage
//    }
//}
