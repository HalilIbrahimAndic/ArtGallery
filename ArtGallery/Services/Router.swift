//
//  Router.swift
//  ArtGallery
//
//  Created by Halil Ibrahim Andic on 21.05.2023.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    case search(by: String)
    case detail(by: String)
    case list
    
    var baseURL: URL {
        return URL(string: "")!
    }
    
    func asURLRequest() throws -> URLRequest {
        //
    }
}
