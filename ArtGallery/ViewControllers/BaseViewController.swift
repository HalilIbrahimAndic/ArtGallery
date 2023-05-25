//
//  BaseViewController.swift
//  ArtGallery
//
//  Created by Halil Ibrahim Andic on 18.05.2023.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        hideKeyboarAction()
    }
    
    func hideKeyboarAction() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func createImageURL(with iiifID: String) -> String {
        return "https://www.artic.edu/iiif/2/\(iiifID)/full/180,/0/default.jpg"
    }
}
