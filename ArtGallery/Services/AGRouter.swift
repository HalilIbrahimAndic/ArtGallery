//
//  Router.swift
//  ArtGallery
//
//  Created by Halil Ibrahim Andic on 21.05.2023.
//

import Foundation
import Alamofire

enum AGRouter: URLRequestConvertible {
    
    //There are 2 request cases
    case search(by: String, for: Int)
    case detail(by: String)
    
    //Define GET method for all cases
    var method: HTTPMethod {
        switch self {
        case .search, .detail:
            return .get
        }
    }
    
    //Define customized query parameters for each case
    var params: [String: String] {
        switch self {
        case .search(let artName, let pageNumber):
            return [
                "q": artName,
                "page": "\(pageNumber)",
                "fields": Constants.fieldParameters,
                "limit": "\(Constants.pageLimit)"
            ]
        case .detail(let id):
            return [
                "query[term][id]": id,
                "fields": Constants.detailFieldParameters
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
        case .search, .detail:
            urlComponents.setQueryItems(with: params)
        }
        
        return urlComponents
    }
    
    //Create the URL
    func asURLRequest() throws -> URLRequest {
        guard let url = components.url else { throw NSError() }
        var request = URLRequest(url: url)
        print(request)
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
