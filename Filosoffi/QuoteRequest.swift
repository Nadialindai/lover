//
//  QuoteResponse.swift
//  Filosoffi
//
//  Created by Nadia Leung on 3/31/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import Foundation
import Combine

class PostListViewModel : ObservableObject {
    @Published var posts = [Post]()

    init() {
        Webservice().getVerse { posts in

            self.posts = posts

        }
    }
}



 extension Post: DocumentSerial {
    init?(documentData: [String : Any]) {
        guard
            let id = documentData[PostKeys.Post.id] as? String,
            let quote = documentData[PostKeys.Post.quote] as? String,
            let text = documentData[PostKeys.Post.text] as? String
            else { return nil }
        self.init(id: id,
                  quote: quote,
                  text: text)

    }
 }

/*
struct PostViewModel {
    var post: Post
    {
        return self.post
    }
    /*init(post: Post) {
        self.post = post
    }*/

    var text: String {
        return self.post.text
    }

    var quote: String {
        return self.post.quote
    }
}*/

