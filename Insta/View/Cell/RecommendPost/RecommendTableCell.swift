//
//  RecommendTableCell.swift
//  Insta
//
//  Created by Artem on 31.01.2023.
//

import Foundation
import UIKit

final class RecommendTableCell: UITableViewCell {
    
    //MARK: - Configure
    func configure(info: ReccomendCell) {
        self.items = info
    }
    
    //MARK: - Collection
    private let collectionView: UICollectionView = {
        let someLayout = UICollectionViewFlowLayout()
        someLayout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero,collectionViewLayout: someLayout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    //MARK: - Label
    private let userLabel = UILabel().createLabelReccomend()
    
    //MARK: - Button
    private let button = UIButton().createButtonReccomend()
    
    //MARK: - DataPostAndStory
    private var items = ReccomendCell()
    
    //MARK: - Enum
    private enum Constants {
        static let heightSize: CGFloat = 220
        static let widthSize: CGFloat = 200
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Private Init
extension RecommendTableCell {
    private func initialize() {
        
        //MARK: - Collection
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = #colorLiteral(red: 0.07862900079, green: 0.07970003529, blue: 0.08342231305, alpha: 1)
        collectionView.register(ReccomendItemCell.self, forCellWithReuseIdentifier: String(describing: ReccomendItemCell.self))
        
        collectionView.addSubview(userLabel)
        collectionView.addSubview(button)
        
        //MARK: - Constraints
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            userLabel.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 10),
            userLabel.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: 10),
            
            button.centerYAnchor.constraint(equalTo: userLabel.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
//MARK: - Colletion Delegate
extension RecommendTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ReccomendItemCell.self), for: indexPath) as! ReccomendItemCell
        cell.configure(info: items[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Constants.widthSize, height: Constants.heightSize)
    }
}
