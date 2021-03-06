//
//  Comments.swift
//  JSON
//
//  Created by TørK on 27/08/2017.
//  Copyright © 2017 Tørk Egeberg. All rights reserved.
//

import Foundation


struct Comment {

    var postId: Int = 0
    var id: Int = 0
    var name:  String = ""
    var email: String = ""
    var body: String = ""
    
    init(postId: Int, id: Int, name: String, email: String, body: String) {
        self.postId = postId
        self.id = id
        self.name = name
        self.email = email
        self.body = body
    }
    
    init(json: [String:Any]) throws {
        guard let postId = json["postId"] as? Int else {
            throw NetworkError.missing("Missing postId Comment Model")
        }
        
        guard let id = json["id"] as? Int else {
            throw NetworkError.missing("Missing id Comment Model")
        }
        
        guard let name = json["name"] as? String else {
            throw NetworkError.missing("Missing name Comment Model")
        }
        
        guard let email = json["email"] as? String else {
            throw NetworkError.missing("Missing email Comment Model")
        }
        
        guard let body = json["body"] as? String else {
            throw NetworkError.missing("Missing body Comment Model")
        }
        
        self.postId = postId
        self.id = id
        self.name = name
        self.email = email
        self.body = body
    }
}

