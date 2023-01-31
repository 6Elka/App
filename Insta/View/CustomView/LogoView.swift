//
//  LogoView.swift
//  Insta
//
//  Created by Artem on 31.01.2023.
//

import Foundation
import UIKit

final class LogoView: UIView {
    
    //MARK: - Image
    private let imageView = UIImageView().customImage(title: "insta")
    
    //MARK: - Private Constants
    private enum Constants {
        static let logoWidth: CGFloat = 130
        static let logoHeight: CGFloat = 55
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
extension LogoView {
    private func initialize() {
        addSubview(imageView)
        
        //MARK: - Constraints
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -10),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: Constants.logoHeight),
            imageView.widthAnchor.constraint(equalToConstant: Constants.logoWidth)
        ])
    }
}
