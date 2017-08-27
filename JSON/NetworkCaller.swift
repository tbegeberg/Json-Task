//
//  NetworkCaller.swift
//  JSON
//
//  Created by TørK on 27/08/2017.
//  Copyright © 2017 Tørk Egeberg. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case error(Error)
}

class NetworkCaller {

    let getPost = Network()
    
    static let shared = NetworkCaller()
    
    func getOutput(url: String, completionHandler: @escaping (Result<[Any]>)->()) {
        
        getPost.getJSONPosts(url: url, completionHandler: completionHandler)
        
    }
    
    func getOutputComment(url: String, completionHandler: @escaping (Result<[Any]>)->()) {
        
        getPost.getJSONComments(url: url, completionHandler: completionHandler)
        
    }

    
}

