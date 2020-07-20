//
//  PostKeys.swift
//  Filosoffi
//
//  Created by Nadia Leung on 4/2/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//


import Foundation
import Combine
import SwiftUI

struct PostKeys {

    struct Post : Codable, Hashable {
        static let id = "id"
        static let quote = "quote"
        static let text = "text"
    }

    struct CollectionPath {
        static let posts = "posts"
    }

}




