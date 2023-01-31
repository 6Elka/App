//
//  PostModel.swift
//  Insta
//
//  Created by Artem on 31.01.2023.
//

import Foundation

struct PostCellItem {
    let userImage: String
    let userName: String
    let postSubtitle: String
    let postImage: String
    let numberOfLikes: Int
    let comment: CommentFollowers?
}
 
struct CommentFollowers {
    let userName: String
    let userComment: String
}

typealias PostCell = [PostCellItem]

