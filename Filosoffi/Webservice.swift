//
//  ContentView.swift
//  Filosoffi
//
//  Created by Nadia Leung on 3/30/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import SwiftUI
import Foundation
import Combine


let BIBLE_ID = "61fd76eafa1577c2-02";

class Webservice {

     var posts = [Post]()

    func getVerse(completion: @escaping ([Post]) -> ()) {
        let urlString = "https://developers.youversionapi.com/1.0/verse_of_the_day?version_id=12"
        //print(urlString)
        guard let url = URL(string: urlString) else {
            return
        }
        var tempPosts = [Post]()
        var request = URLRequest(url: url)
        request.setValue("FfB4feegVt9u7R0T1q87wqz7bUU", forHTTPHeaderField: "x-youversion-developer-token")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("en", forHTTPHeaderField: "Accept-Language")


        URLSession.shared.dataTask(with: request) { data, result, error  in
           // print(result)
            if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
               // print(json)

                if let days = json["data"] as? [[String: Any]] {
                    for day in days {
                        if let verse = day["verse"] as? [String: Any] {
                            guard let text = verse["text"] as? String else { return }
                            guard let reference = verse["human_reference"] as? String else {return }
                            let id = UUID().uuidString
                            let newPost = Post(id: id, quote: reference, text: text)
                            tempPosts.append(newPost)

                        }
                    }
                }
            }

            DispatchQueue.main.async {
                self.posts = tempPosts
                completion(self.posts)
            }
        }.resume()

    }

}

