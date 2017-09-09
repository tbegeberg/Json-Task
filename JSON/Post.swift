//
//  Post.swift
//  JSON
//
//  Created by TørK on 26/08/2017.
//  Copyright © 2017 Tørk Egeberg. All rights reserved.
//

import Foundation


struct Post {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
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







