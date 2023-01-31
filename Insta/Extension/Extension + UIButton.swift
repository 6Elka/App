//
//  Extension + UIButton.swift
//  Insta
//
//  Created by Artem on 31.01.2023.
//
import Foundation
import UIKit

extension UIButton {
    func createButton(image: String) -> UIButton {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: image), for: .normal)
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }
    
    func createSkipButton() -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(systemName: "multiply")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func createButtonReccomend() -> UIButton {
        let btn = UIButton()
        btn.setTitle("Все", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }
}
