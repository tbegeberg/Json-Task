//
//  AsyncCompleter.swift
//  JSON
//
//  Created by TørK on 26/08/2017.
//  Copyright © 2017 Tørk Egeberg. All rights reserved.
//

import Foundation

class AsyncCompleter {
 
    func runAsyncWithDelay(delay:TimeInterval, completionHandler: @escaping (Result<String>)->()) {
        
        
        DispatchQueue.main.asyncAfter(deadline: .now()+delay) {
            if arc4random_uniform(3) > 1 {
                completionHandler(Result.success("Hello happiness"))
            } else {
                completionHandler(Result.error(MyFancyError(reason: "It failed!!")))
            }
        }
        
        
        
    }
}
