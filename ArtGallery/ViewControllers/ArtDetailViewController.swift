//
//  ArtDetailViewController.swift
//  ArtGallery
//
//  Created by Halil Ibrahim Andic on 18.05.2023.
//

import Foundation
import UIKit
import Kingfisher

class ArtDetailViewController: BaseViewController {
    
    
    @IBOutlet weak var imageViewArt: UIImageView?
    @IBOutlet weak var labelTitle: UILabel?
    @IBOutlet weak var labelArtist: UILabel?
    @IBOutlet weak var labelDimension: UILabel?
    @IBOutlet weak var labelHistory: UILabel?
    
    private var artwork: DetailModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func initializeWith(artwork: DetailModel?) {
        self.artwork = artwork
    }
    
    func setupUI() {
        let placeholderImage = UIImage(named: "noImage")
        labelTitle?.text = artwork?.title
        labelArtist?.text = "Artist: \(artwork?.artistTitle ?? "")"
        labelDimension?.text = "Dimensions: \(artwork?.dimensions ?? "")"
        labelHistory?.text = "Publication History: \(artwork?.history ?? "")"
        imageViewArt?.kf.setImage(with: URL(string: super.createImageURL(with: artwork?.imageID ?? "")), placeholder: placeholderImage)
        
    }
}
