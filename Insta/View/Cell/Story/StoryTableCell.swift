//
//  StoryTableCell.swift
//  Insta
//
//  Created by Artem on 31.01.2023.
//

import Foundation
import UIKit

final class StoryTableCell: UITableViewCell {
    
    //MARK: - Configure
    func configure(info: StoryCell) {
        self.items = info
        print(items)
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
    
    //MARK: - DataPostAndStory
    private var items = StoryCell()
    
    //MARK: - Enum
    private enum Constants {
        static let heightCollection: CGFloat = 80
        static let widthSize: CGFloat = 60
        static let heightSize: CGFloat = 72
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
extension StoryTableCell {
    private func initialize() {
    
        //MARK: - Collection
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(StoryItemCell.self, forCellWithReuseIdentifier: String(describing: StoryItemCell.self))
        
        //MARK: - Constraints
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
}
//MARK: - Colletion Delegate
extension StoryTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: StoryItemCell.self), for: indexPath) as! StoryItemCell
        cell.configure(info: items[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Constants.widthSize, height: Constants.heightSize)
    }
}

