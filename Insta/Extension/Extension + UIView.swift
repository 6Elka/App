//
//  Extension + UIView.swift
//  Insta
//
//  Created by Artem on 31.01.2023.
//

import Foundation
import UIKit

extension UIView {
    func createView(color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
