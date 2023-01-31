//
//  RecommendItemCell.swift
//  Insta
//
//  Created by Artem on 31.01.2023.
//

import Foundation
import UIKit

final class ReccomendItemCell: UICollectionViewCell {
    //MARK: - Configure
    func configure(info: RecommendItem) {
        self.imageViewUser.image = UIImage(named: info.userImage)
        self.label.text = info.userName
    }
    
    //MARK: - ImageView
    private let imageViewUser = UIImageView().createImage()
      
    //MARK: - Label
    private let label = UILabel().createLabel(size: 15, weight: .semibold)
    
    //MARK: - Enum Constants
    private enum Constants {
        static let imageHeight: CGFloat = 150
        static let imageWidth: CGFloat = 150
        static let labelWidth: CGFloat = 80
    }
    
    //MARK: - SomeView
    private let someView = UIView().createView(color: .black)
    
    //MARK: - Button
    private let buttonSkip = UIButton().createSkipButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Private Init
extension ReccomendItemCell {
    private func initialize() {
        
        //MARK: - View
        contentView.addSubview(someView)
        
        //MARK: - Add view
        someView.addSubview(imageViewUser)
        imageViewUser.layer.cornerRadius = Constants.imageHeight / 2
        
        someView.addSubview(label)
        someView.addSubview(buttonSkip)
        
        NSLayoutConstraint.activate([
            someView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            someView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            someView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),
            someView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageViewUser.topAnchor.constraint(equalTo: someView.topAnchor, constant: 15),
            imageViewUser.centerXAnchor.constraint(equalTo: someView.centerXAnchor),
            imageViewUser.heightAnchor.constraint(equalToConstant: Constants.imageHeight),
            imageViewUser.widthAnchor.constraint(equalToConstant: Constants.imageWidth),
            
            label.topAnchor.constraint(equalTo: imageViewUser.bottomAnchor, constant: 5),
            label.centerXAnchor.constraint(equalTo: someView.centerXAnchor),
            
            buttonSkip.topAnchor.constraint(equalTo: someView.topAnchor, constant: 10),
            buttonSkip.trailingAnchor.constraint(equalTo: someView.trailingAnchor, constant: -10)
        ])
    }
}
