//
//  PostTableCell.swift
//  Insta
//
//  Created by Artem on 31.01.2023.
//

import Foundation
import UIKit

final class PostsTableCell: UITableViewCell {
    
    //MARK: - Configure
    func configure(info: PostCellItem) {
        self.imageUser.image = UIImage(named: info.userImage)
        self.userLabel.text = info.userName
        self.subtitleLabel.text = info.postSubtitle
        self.imagePost.image = UIImage(named: info.postImage)
        self.numberOfLikes.text = "Нравится: \(info.numberOfLikes)"
        self.followerName.text = info.comment?.userName
        self.followerComment.text = info.comment?.userComment
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    //MARK: - ImageView
    private let imageUser = UIImageView().createImage()
    private let imagePost = UIImageView().createImage()
    private let imageUserComment = UIImageView().userImageComment(title: "two")
    
    //MARK: - Enum Constants
    private enum Constants {
        static let heightImage: CGFloat = 40
        static let widthImage: CGFloat = 40
        static let heightPostImage: CGFloat = 200
        static let widthImageComment: CGFloat = 20
        static let heightImageComment: CGFloat = 20
    }
  
    //MARK: - Create Label
    private let userLabel = UILabel().createLabel(size: 13, weight: .bold)
    private let subtitleLabel = UILabel().createLabel(size: 10, weight: .semibold)
    private let numberOfLikes = UILabel().createLabel(size: 13, weight: .bold)
    private let followerName = UILabel().createLabel(size: 14, weight: .bold)
    private let followerComment = UILabel().createLabel(size: 13, weight: .medium)
    
    //MARK: - Custom Label
    private let showComment = UILabel().customLabel(text: "Посмотреть комментарий")
    private let addComment = UILabel().customLabel(text: "Добавьте комментарий...")
    private let actionHeart = UILabel().customLabel(text: "❤️")
    private let actionHands = UILabel().customLabel(text:  "🙌")
    private let actionPlus = UILabel().customLabel(text: "✕")
    private let minLabel = UILabel().customLabel(text: "4 минут назад")
    
    //MARK: - Button
    private let optionsButton = UIButton().createButton(image: "ellipsis")
    private let likeButton = UIButton().createButton(image: "heart")
    private let commentButton = UIButton().createButton(image: "message")
    private let shareButton = UIButton().createButton(image: "paperplane")
    private let lovesButton = UIButton().createButton(image: "bookmark")
    private let editingButton = UIButton().createButton(image: "ellipsis")

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Private Init
extension PostsTableCell {
    private func initialize() {
        
        //MARK: - View
        addSubview(imageUser)
        imageUser.layer.cornerRadius = Constants.heightImage / 2
        
        addSubview(userLabel)
        addSubview(subtitleLabel)
        addSubview(optionsButton)
        addSubview(imagePost)
        addSubview(numberOfLikes)
        addSubview(followerName)
        addSubview(followerComment)
        addSubview(editingButton)
        
        addSubview(imageUserComment)
        imageUserComment.layer.cornerRadius = Constants.heightImageComment / 2
        
        addSubview(addComment)
        addSubview(actionHeart)
        addSubview(actionPlus)
        addSubview(actionHands)
        addSubview(minLabel)
        
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        addSubview(lovesButton)
        addSubview(showComment)
        
        //MARK: - Constraints
        NSLayoutConstraint.activate([
            imageUser.topAnchor.constraint(equalTo: topAnchor),
            imageUser.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageUser.heightAnchor.constraint(equalToConstant: Constants.heightImage),
            imageUser.widthAnchor.constraint(equalToConstant: Constants.widthImage),
            
            userLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            userLabel.leadingAnchor.constraint(equalTo: imageUser.trailingAnchor, constant: 10),
            
            subtitleLabel.topAnchor.constraint(equalTo: userLabel.topAnchor, constant: 20),
            subtitleLabel.leadingAnchor.constraint(equalTo: imageUser.trailingAnchor, constant: 10),
            
            editingButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            editingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            optionsButton.topAnchor.constraint(equalTo: topAnchor),
            optionsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
            
            imagePost.topAnchor.constraint(equalTo: imageUser.bottomAnchor, constant: 10),
            imagePost.leadingAnchor.constraint(equalTo: leadingAnchor),
            imagePost.trailingAnchor.constraint(equalTo: trailingAnchor),
            imagePost.heightAnchor.constraint(equalToConstant: Constants.heightPostImage),
            
            likeButton.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: 10),
            likeButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            commentButton.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: 10),
            commentButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 10),
            
            shareButton.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: 10),
            shareButton.leadingAnchor.constraint(equalTo: commentButton.trailingAnchor, constant: 10),
            
            lovesButton.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: 10),
            lovesButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            numberOfLikes.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 10),
            numberOfLikes.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            followerName.topAnchor.constraint(equalTo: numberOfLikes.bottomAnchor, constant: 10),
            followerName.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            followerComment.topAnchor.constraint(equalTo: numberOfLikes.bottomAnchor, constant: 10),
            followerComment.leadingAnchor.constraint(equalTo: followerName.trailingAnchor, constant: 10),
            
            showComment.topAnchor.constraint(equalTo: followerName.bottomAnchor, constant: 10),
            showComment.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            imageUserComment.topAnchor.constraint(equalTo: showComment.bottomAnchor, constant: 10),
            imageUserComment.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageUserComment.heightAnchor.constraint(equalToConstant: Constants.heightImageComment),
            imageUserComment.widthAnchor.constraint(equalToConstant: Constants.widthImageComment),
            
            addComment.topAnchor.constraint(equalTo: showComment.bottomAnchor, constant: 10),
            addComment.leadingAnchor.constraint(equalTo: imageUserComment.trailingAnchor, constant: 10),
            
            actionHeart.centerYAnchor.constraint(equalTo: addComment.centerYAnchor),
            actionHeart.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            
            actionHands.centerYAnchor.constraint(equalTo: addComment.centerYAnchor),
            actionHands.leadingAnchor.constraint(equalTo: actionHeart.trailingAnchor, constant: 10),
            
            actionPlus.centerYAnchor.constraint(equalTo: addComment.centerYAnchor),
            actionPlus.leadingAnchor.constraint(equalTo: actionHands.trailingAnchor, constant: 10),
            
            minLabel.topAnchor.constraint(equalTo: imageUserComment.bottomAnchor, constant: 10),
            minLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
}
