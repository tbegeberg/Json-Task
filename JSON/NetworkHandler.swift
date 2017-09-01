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
    
    func getJSONPosts(url:String, completionHandler: @escaping (Result<[Any]>)->()) {

        var postArray = [Post]()
        let url = URL(string: url)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
                
                if error != nil {
                    print("Post error: \(error?.localizedDescription)")
                } else {
                    if let urlContent = data {
                        do {
                            if let json = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:Any]] {
                            
                                for result in json {
                                    let post = try Post(json: result)
                                    postArray.append(post)
                                    }
   
                            
                            /*
                            postArray = json.flatMap({ (<#[String : Any]#>) -> ElementOfResult? in
                                <#code#>
                            })
                            */

                            }
                            
                            DispatchQueue.main.async() {
                                if postArray.count > 0 {
                                    completionHandler(Result.success(postArray))
                                }
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
    }
    
    func getJSONComments(url:String, completionHandler: @escaping (Result<[Any]>)->()) {
        
        var commentArray = [Comment]()
        let url = URL(string: url)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                print("Comment Error: \(error?.localizedDescription)")
            } else {
                if let urlContent = data {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String:Any]] {
                            
                            for result in json {
                                let comment = try Comment(json: result)
                                commentArray.append(comment)
                            }
                            
                            
                            /*
                             postArray = json.flatMap({ (<#[String : Any]#>) -> ElementOfResult? in
                             <#code#>
                             })
                             */
                            
                        }
                        DispatchQueue.main.async() {
                            if commentArray.count > 0 {
                                completionHandler(Result.success(commentArray))
                            }                         }
                    } catch {
                        print(error)
                    }
                }
            }
        }
        task.resume()
    }
    
}
    
    
    
  


