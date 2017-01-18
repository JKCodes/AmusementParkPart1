//
//  Entrant.swift
//  AmusementParkPart1
//
//  Created by Joseph Kim on 1/6/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import Foundation

// All Entrants must have these properties
protocol Entrant {
    var areaAccess: [Area] { get }
    var allRides: Bool { get }
    var skipAllowed: Bool { get }
    var foodDiscount: Int { get }
    var merchandiseDiscount: Int { get }
    var requiredInformation: [PersonalData] { get }
}

extension Entrant {
    
    // The below two property has a default value, for most entrants have these default value
    var allRides: Bool {
        return true
    }
    
    var skipAllowed: Bool {
        return false
    }
    
    // Default value for requiredInformation array
    var requiredInformation: [PersonalData] {
        return []
    }
}
