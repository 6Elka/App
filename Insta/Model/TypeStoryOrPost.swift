//
//  TypeStoryOrPost.swift
//  Insta
//
//  Created by Artem on 31.01.2023.
//

import Foundation

enum TypeStoryOrPost {
    case stories(StoryCell)
    case posts(PostCell)
    case recommend(ReccomendCell)
}

