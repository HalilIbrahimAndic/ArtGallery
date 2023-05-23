//
//  ViewController.swift
//  ArtGallery
//
//  Created by Halil Ibrahim Andic on 18.05.2023.
//

import UIKit

class ArtworksViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar?
    @IBOutlet weak var collectionView: UICollectionView?
    
    private var artworks: [ArtworkModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    func setupUI() {
        title = "Art Gallery"
        fetchList()
    }
    
    private func fetchList() {
        AGNetwork.shared.request(router: .list, responseModel: ArtworkResponse.self) { result in
            switch result {
            case .success(let response):
                self.artworks = response.data ?? []
                print("veri: ", self.artworks[0].title ?? "empty")
                self.collectionView?.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func fetchSearch(with query: String) {
        AGNetwork.shared.request(router: .search(by: query), responseModel: ArtworkResponse.self) { result in
            switch result {
            case .success(let response):
                print("success: ", response.data ?? [])
            case .failure(let error):
                print(error)
            }
        }
    }
}

