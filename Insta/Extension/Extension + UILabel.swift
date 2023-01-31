//
//  Extension + UILabel.swift
//  Insta
//
//  Created by Artem on 31.01.2023.
//

import Foundation
import UIKit

extension UILabel {
    func createLabel(size: CGFloat, weight: UIFont.Weight) -> UILabel {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: size, weight: weight)
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }
   
    
    func customLabel(text: String) -> UILabel {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 13, weight: .semibold)
        lbl.textColor = .gray
        lbl.text = text
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }
    
    func createLabelReccomend() -> UILabel {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "Рекомендуемое вам"
        lbl.font = .systemFont(ofSize: 15, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }
}
