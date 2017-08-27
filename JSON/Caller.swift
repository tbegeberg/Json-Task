//
//  Caller.swift
//  JSON
//
//  Created by TørK on 26/08/2017.
//  Copyright © 2017 Tørk Egeberg. All rights reserved.
//

import Foundation



struct MyFancyError:LocalizedError {
    let reason:String
    
    var localizedDescription: String {
        get {
            return self.reason
        }
    }
    
    var errorDescription: String? {
        get {
            return self.reason
        }
    }
}

class Caller {
    
    let myCompleter = AsyncCompleter()
    
    static let shared = Caller()
    
    func getCompleterOutput(completionHandler: @escaping (Result<String>)->()) {
        
        self.myCompleter.runAsyncWithDelay(delay: 2,completionHandler: completionHandler)
        
    }
    
}
