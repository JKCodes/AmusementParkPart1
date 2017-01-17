//
//  RideAccess.swift
//  AmusementParkPart1
//
//  Created by Joseph Kim on 1/6/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import Foundation

enum RideAccess{
    case allRides(Bool)
    case skipLine(Bool)
}

extension RideAccess {
    
    // these computed property stores access level per entrant basis
    var access: Bool {
        switch self {
        case .allRides(let flag): return flag
        case .skipLine(let flag): return flag
        }
    }
}
