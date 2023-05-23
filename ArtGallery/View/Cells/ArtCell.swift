//
//  ArtCell.swift
//  ArtGallery
//
//  Created by Halil Ibrahim Andic on 23.05.2023.
//

import UIKit
import Kingfisher

class ArtCell: UICollectionViewCell {

    static let REUSE_ID = "ArtCell"
    
    @IBOutlet weak var artImage: UIImageView!
    @IBOutlet weak var artTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(for artwork: ArtworkModel) {
        let placeholderImage = UIImage(named: "noImage")
        artTitle?.text = artwork.title
        artImage?.kf.setImage(with: URL(string: createImageURL(with: artwork.image_id ?? "")), placeholder: placeholderImage)
    }
    
    func createImageURL(with iiifID: String) -> String {
        return "https://www.artic.edu/iiif/2/\(iiifID)/full/843,/0/default.jpg"
    }

}
