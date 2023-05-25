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
    
    private func setupCollectionView() {
        let cell = UINib(nibName: ArtCell.REUSE_ID, bundle: nil)
        collectionView?.register(cell, forCellWithReuseIdentifier: ArtCell.REUSE_ID)

        collectionView?.delegate = self
        collectionView?.dataSource = self
    }

    func setupUI() {
        title = "Art Gallery"
        setupCollectionView()
        //fetchList()
        fetchSearch(with: "")
    }
    
    //Fetch function for List request
//    private func fetchList() {
//        AGNetwork.shared.request(router: .list, responseModel: ArtworkResponse.self) { result in
//            switch result {
//            case .success(let response):
//                self.artworks = response.data ?? []
//                self.collectionView?.reloadData()
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
    //Fetch function for Search request
    private func fetchSearch(with query: String) {
        AGNetwork.shared.request(router: .search(by: query), responseModel: ArtworkResponse.self) { result in
            switch result {
            case .success(let response):
                self.artworks = response.data ?? []
                self.collectionView?.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

//MARK: - CollectionView
extension ArtworksViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artworks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtCell.REUSE_ID, for: indexPath) as? ArtCell {
            let artwork = artworks[indexPath.row]
            //trigger the function that handles cell setup for the specified entry
            cell.setupCell(for: artwork)
            return cell
        }
        return UICollectionViewCell()
    }
}

extension ArtworksViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width / 2, height: collectionView.frame.height/2)
        }
}
    

