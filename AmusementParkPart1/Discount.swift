//
//  Discount.swift
//  AmusementParkPart1
//
//  Created by Joseph Kim on 1/6/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import Foundation


enum Discount {
    case food(Int)
    case merchandise(Int)
}

extension Discount {
    
    // these computed properties store discount values per entrant basis
    var discount: Int {
        switch self {
        case .food(let discount): return discount
        case .merchandise(let discount): return discount
        }
    }
}
