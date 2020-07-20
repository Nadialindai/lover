//
//  Post.swift
//  Filosoffi
//
//  Created by Nadia Leung on 4/1/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//


import Foundation
import UIKit
import SwiftUI

protocol DocumentSerial {
    init?(documentData: [String: Any])
}

struct Post : Codable {
    let id: String
    let quote: String
    let text: String

    
    var dictionary: [String: Any] {
        return [
            PostKeys.Post.id: id,
            PostKeys.Post.quote: quote,
            PostKeys.Post.text: text,
        ]
    }
}


