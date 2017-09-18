//
//  Listable.swift
//  JSON
//
//  Created by TørK on 17/09/2017.
//  Copyright © 2017 Tørk Egeberg. All rights reserved.
//

import Foundation

protocol Listable {
    var title: String{ get }
}

extension Comment: Listable {
    var title: String {
        get {
            return name
        }
    }
}

extension Post: Listable {}






