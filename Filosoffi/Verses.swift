//
//  ContentView.swift
//  Filosoffi
//
//  Created by Nadia Leung on 3/30/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import SwiftUI


struct QuoteResponse:Decodable {
    var response:Quotes
}

struct Chapter:Decodable{
    var id: String

}

struct Bible:Decodable {
    var id: String

}

struct Verses: Decodable {
    var id: String

}

struct Quotes: Decodable {
    var quotes:[Verses]
}
