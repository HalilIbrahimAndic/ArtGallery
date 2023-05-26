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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    
    //create an instance of Artwork array to store fetched data
    private var artworks: [ArtworkModel] = []
    private var queryText = ""
    private var currentPage = 1
    private var totalPages = 50
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        //setup UI Components
        setupCollectionView()
        setupSearchBar()
        
        // Initial list request
        fetchSearch(query: queryText, page: 1)
    }
    
    private func setupCollectionView() {
        let cell = UINib(nibName: ArtCell.REUSE_ID, bundle: nil)
        collectionView?.register(cell, forCellWithReuseIdentifier: ArtCell.REUSE_ID)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        refreshControl.addTarget(self, action: #selector(loadPage), for: .valueChanged)
        collectionView?.refreshControl = refreshControl
    }
    
    private func setupSearchBar() {
        searchBar?.delegate = self
        searchBar?.placeholder = "Type here to search artwork..."
    }
    
    // Selector function for refreshControl
    @objc func loadPage() {
        currentPage += 1
        fetchSearch(query: queryText, page: currentPage)
        refreshControl.endRefreshing()
    }
    
    private func startActivityIndicator() {
        activityIndicator?.isHidden = false
        activityIndicator?.startAnimating()
    }
    
    private func stopActivityIndicator() {
        activityIndicator?.isHidden = true
        activityIndicator?.stopAnimating()
    }
    
    //MARK: - Fetch Functions
    //Fetch function for Search request
    private func fetchSearch(query: String, page: Int) {
        startActivityIndicator()
        
        AGNetwork.shared.request(router: .search(by: query, for: page), responseModel: ArtworkResponse.self) { result in
            switch result {
            case .success(let response):
                self.stopActivityIndicator()
                self.artworks.append(contentsOf: response.data ?? [])
                //self.artworks = response.data ?? []
                self.collectionView?.reloadData()
            case .failure(let error):
                self.stopActivityIndicator()
                print(error)
            }
        }
    }
    
    //Fetch function for Detail request
    private func fetchDetail(with id: Int, onSuccess: @escaping ((DetailModel?) -> Void), onFailure: @escaping ((Error?) -> Void)) {
        startActivityIndicator()
        
        AGNetwork.shared.request(router: .detail(by: String(id)), responseModel: DetailResponse.self) { result in
            switch result {
            case .success(let response):
                self.stopActivityIndicator()
                onSuccess(response.data?[0])
            case .failure(let error):
                self.stopActivityIndicator()
                print(error)
            }
        }
    }
}

//MARK: - SearchBar
extension ArtworksViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //search request requires at least 3 letters to start
        if searchText.count >= 3 {
            queryText = searchText
        } else {
            queryText = ""
        }
        
        //resets before each search request
        artworks = []
        currentPage = 0
        loadPage()
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
            
            //trigger the function that handles cell setup for the selected artwork
            cell.setupCell(for: artwork)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let id = artworks[indexPath.row].id else { return }
        
        fetchDetail(with: id) { detailedArtwork in
            if let detailVC = self.getViewController(viewController: ArtDetailViewController(), storyboardName: "Detail") {
                detailVC.initializeWith(artwork: detailedArtwork)
                self.navigationController?.pushViewController(detailVC, animated: true)
            }
        } onFailure: { _ in
            print("Failed to get detail")
        }
    }
    
    // Pagination
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == artworks.count - 1, currentPage < totalPages {
            loadPage()
        }
    }
}

//MARK: - Layout Extension
// layout setup for 2x2 grid presentation
extension ArtworksViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.height/2)
    }
}
