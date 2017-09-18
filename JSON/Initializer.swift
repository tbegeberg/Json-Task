//
//  Initializer.swift
//  JSON
//
//  Created by TørK on 17/09/2017.
//  Copyright © 2017 Tørk Egeberg. All rights reserved.
//

import Foundation

protocol Initializer {
    init(json: [String:Any]) throws
}
