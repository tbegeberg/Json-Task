//
//  Result.swift
//  JSON
//
//  Created by TørK on 28/08/2017.
//  Copyright © 2017 Tørk Egeberg. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case error(Error)
}
