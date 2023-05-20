//
//  ArtDetailViewController.swift
//  ArtGallery
//
//  Created by Halil Ibrahim Andic on 18.05.2023.
//

import UIKit

final class ArtDetailViewController: BaseViewController {
    
    @IBOutlet weak var imageViewArt: UIImageView?
    @IBOutlet weak var labelTitle: UILabel?
    @IBOutlet weak var labelArtist: UIStackView?
    @IBOutlet weak var labelDimension: UILabel?
    @IBOutlet weak var labelHistory: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
