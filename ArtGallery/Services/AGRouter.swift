//
//  Router.swift
//  ArtGallery
//
//  Created by Halil Ibrahim Andic on 21.05.2023.
//

import Foundation
import Alamofire

enum AGRouter: URLRequestConvertible {
    
    //There are 3 request cases where two of them requires user input
    case search(by: String)
    case detail(by: String)
    case list
    
    //Define GET method for all cases
    var method: HTTPMethod {
        switch self {
        case .search, .detail, .list:
            return .get
        }
    }
    
    //Define customized query parameters for each case
    var params: [String: String] {
        switch self {
        case .search(let artName):
            return [
                "q": artName,
                "fields": Constants.fieldParameters
            ]
        case .detail(let id):
            return [
                "query[term][id]": id,
                "fields": Constants.detailFieldParameters
            ]
        case .list:
            return [
                "query[term][is_boosted]": "true",
                "fields": Constants.fieldParameters
            ]
        }
    }
    
    //Parse the URL
    var components: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = Constants.host // "api.artic.edu"
        urlComponents.path = Constants.path // "/api/v1/artworks/search"
        
        switch self {
        case .search, .detail, .list:
            urlComponents.setQueryItems(with: params)
        }
        
        return urlComponents
    }
    
    //Create the URL
    func asURLRequest() throws -> URLRequest {
        guard let url = components.url else { throw NSError() }
        print(url)
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }
}

//MARK: - Extension
extension URLComponents {
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value)}
    }
}
