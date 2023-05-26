//
//  UIVC+Navigation.swift
//  ArtGallery
//
//  Created by Halil Ibrahim Andic on 25.05.2023.
//

import UIKit

extension UIViewController {
    
    func getViewController<T: UIViewController>(viewController: T, storyboardName: String) -> T? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(identifier: String(describing: T.self)) as? T else { return T() }
        return nextViewController
    }
    
    func setRootNavigationController(with viewController: String, storyboardName: String) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let rootViewController = storyboard.instantiateViewController(identifier: viewController) as? UINavigationController else { return }
        UIApplication.shared.windows.first?.rootViewController = rootViewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
