//
//  StoryItemCell.swift
//  Insta
//
//  Created by Artem on 31.01.2023.
//

import Foundation
import UIKit

final class StoryItemCell: UICollectionViewCell {
    
    //MARK: - Configure
    func configure(info: StoryCellItem) {
        self.imageViewUser.image = UIImage(named: info.image)
        self.label.text = info.userName
    }
    
    //MARK: - ImageView
    private let imageViewUser = UIImageView().createImage()
      
    //MARK: - Label
    private let label = UILabel().createLabel(size: 15, weight: .semibold)
    
    //MARK: - Enum Constants
    private enum Constants {
        static let imageHeight: CGFloat = 60
        static let imageWidth: CGFloat = 60
        static let labelWidth: CGFloat = 80
}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Private Init
extension StoryItemCell {
    private func initialize() {

        //MARK: - Add view
        addSubview(imageViewUser)
        imageViewUser.layer.cornerRadius = Constants.imageHeight / 2
        
        addSubview(label)
        
        //MARK: - Constraints
        NSLayoutConstraint.activate([
            imageViewUser.topAnchor.constraint(equalTo: topAnchor),
            imageViewUser.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 10),
            imageViewUser.heightAnchor.constraint(equalToConstant: Constants.imageHeight),
            imageViewUser.widthAnchor.constraint(equalToConstant: Constants.imageWidth),
            
            label.topAnchor.constraint(equalTo: imageViewUser.bottomAnchor, constant: 5),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: Constants.labelWidth),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5)
        ])
    }
}
