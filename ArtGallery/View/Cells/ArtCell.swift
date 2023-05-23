//
//  ArtCell.swift
//  ArtGallery
//
//  Created by Halil Ibrahim Andic on 23.05.2023.
//

import UIKit

class ArtCell: UICollectionViewCell {

    static let REUSE_ID = "ArtCell"
    
    @IBOutlet weak var artImage: UIImageView?
    @IBOutlet weak var artTitle: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(for artwork: ArtworkModel) {
        artTitle?.text = artwork.title
    }

}
