//
//  Network.swift
//  JSON
//
//  Created by TørK on 26/08/2017.
//  Copyright © 2017 Tørk Egeberg. All rights reserved.
//

import Foundation
import UIKit

class NetworkHandler {
    
    static let shared = NetworkHandler()
    
    func getJSON<T> (url: String, completionHandler: @escaping (Result<[T]>)->()) where T: Initializer {

        var jsonArray = [T]()
      
        if let url = URL(string: url) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                DispatchQueue.main.async {
                    if let error = error {
                        return completionHandler(Result.error(error))
                    }
                }
                if let urlContent = data {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:Any]] {
                            
                            for result in json {
                                let post = try T(json: result)
                                jsonArray.append(post)
                            }
                            
                        }
                        DispatchQueue.main.async {
                            if jsonArray.count > 0 {
                                completionHandler(Result.success(jsonArray))
                            }
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
        
    }
    
    func getJSONComments(url:String, completionHandler: @escaping (Result<[Comment]>)->()) {
        
        var commentArray = [Comment]()
        let url = URL(string: url)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            DispatchQueue.main.async {
                if let error = error {
                    return completionHandler(Result.error(error))
                }
            }
            if let urlContent = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:Any]] {

                        for result in json {
                            let comment = try Comment(json: result)
                            commentArray.append(comment)
                        }
                    }
                    DispatchQueue.main.async {
                        if commentArray.count > 0 {
                            completionHandler(Result.success(commentArray))
                        }
                    }
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
}
    
    
    
  


