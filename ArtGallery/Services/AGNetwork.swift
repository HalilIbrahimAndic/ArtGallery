//
//  NetworkService.swift
//  ArtGallery
//
//  Created by Halil Ibrahim Andic on 20.05.2023.
//

import Foundation
import Alamofire

final class AGNetwork {
    
    //create a shared instance of the network layer.
    static let shared = AGNetwork()
    
    //Generic fetch request
    public func request<T: Codable>(router: AGRouter, responseModel: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        do {
            //create request from Router
            let urlRequest = try router.asURLRequest()
    
            //Call Alamofire
            AF.request(urlRequest).validate().responseDecodable(of:responseModel) { response in
                switch response.result {
                case .success(let result):
                    completion(.success(result))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }
}
