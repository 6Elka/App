//
//  Extension + UIImageView.swift
//  Insta
//
//  Created by Artem on 31.01.2023.
//

import Foundation
import UIKit

extension UIImageView {
    
    func createImage() -> UIImageView {
        let img = UIImageView()
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }
    
    func customImage(title: String) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: title)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
    
    func userImageComment(title: String) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: title)
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
}
