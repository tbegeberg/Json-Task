//
//  Network.swift
//  JSON
//
//  Created by TørK on 26/08/2017.
//  Copyright © 2017 Tørk Egeberg. All rights reserved.
//

import Foundation
import UIKit

class Network {
    
    
    func getJSONPosts(url:String, completionHandler: @escaping (Result<[Any]>)->()) {

        var postArray = [Posts]()
        let url = URL(string: url)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
                
                if error != nil {
                    print(error)
                } else {
                    if let urlContent = data {
                        do {
                            let json = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as! [[String:Any]]

                            for result in json {
                                
                                var post = Posts()
                                post.userId = result["userId"] as! Int
                                post.id = result["id"] as! Int
                                post.title = result["title"] as! String
                                post.body = result["body"] as! String
                                postArray.append(post)
     
                            }
                            
                            DispatchQueue.main.async() {
                                if postArray.count > 0 {
                                    completionHandler(Result.success(postArray))
                                } else {
                                    completionHandler(Result.error(error!))
                                }
                            }
                            
                            
            
                        } catch {
                            print("Jsonresult failed")
                            
                        }
                    }
                    
                    
                    
                }
            }
            task.resume()
       
    }
    
    
    func getJSONComments(url:String, completionHandler: @escaping (Result<[Any]>)->()) {
        
        var commentsArray = [Comments]()
        let url = URL(string: url)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                print(error)
            } else {
                if let urlContent = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as! [[String:Any]]
                        
                        for result in json {
                            
                            var comment = Comments()
                            comment.postId = result["postId"] as! Int
                            comment.id = result["id"] as! Int
                            comment.name = result["name"] as! String
                            comment.email = result["email"] as! String
                            comment.body = result["body"] as! String
                            commentsArray.append(comment)
                            
                        }
                        
                        DispatchQueue.main.async() {
                            if commentsArray.count > 0 {
                                completionHandler(Result.success(commentsArray))
                            } else {
                                completionHandler(Result.error(error!))
                            }
                        }
                        
                        
                        
                    } catch {
                        print("Jsonresult failed")
                        
                    }
                }
                
                
                
            }
        }
        task.resume()
        
    }
    

}
    
    
    
  


