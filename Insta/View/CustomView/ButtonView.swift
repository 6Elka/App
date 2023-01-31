//
//  ButtonView.swift
//  Insta
//
//  Created by Artem on 31.01.2023.
//

import Foundation
import UIKit

final class ButtonView: UIView {
    
    //MARK: - Image
    private let imageView = UIImageView().customImage(title: "call")
    
    //MARK: - Private Constants
    private enum Constants {
        static let logoWidth: CGFloat = 25
        static let logoHeight: CGFloat = 25
    }
    
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Private Init
extension ButtonView {
    private func initialize() {
        addSubview(imageView)
        
        //MARK: - Constraints
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: Constants.logoHeight),
            imageView.widthAnchor.constraint(equalToConstant: Constants.logoWidth)
        ])
    }
}
