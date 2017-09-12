//
//  Post.swift
//  JSON
//
//  Created by TørK on 26/08/2017.
//  Copyright © 2017 Tørk Egeberg. All rights reserved.
//

import Foundation


class Post {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String

    var comments:[Comment]?
    
    init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
    
    init(json: [String:Any]) throws {
        guard let userId = json["userId"] as? Int else {
            throw NetworkError.missing("Missing userID Post Model")
        }
        
        guard let id = json["id"] as? Int else {
            throw NetworkError.missing("Missing id Post Model")
        }
        
        guard let title = json["title"] as? String else {
            throw NetworkError.missing("Missing title Post Model")
        }
        
        guard let body = json["body"] as? String else {
            throw NetworkError.missing("Missing body Post Model")
        }
    
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }

}

extension Post {

    func getComments(complete:@escaping (Result<[Comment]>)->()) {
        NetworkHandler.shared.getJSONComments(url: "https://jsonplaceholder.typicode.com/posts/\(self.id)/comments") {
            (result) in

            do {
                switch result {
                case .success(let value):
                    guard let someComments = value as? [Comment] else {
                        throw NetworkError.missing("comments in getComments")
                    }
                    complete(Result.success(someComments))
                case .error(let error):
                    throw error
                }
            } catch let error {
                complete(Result.error(error))
            }
        }
    }

}







