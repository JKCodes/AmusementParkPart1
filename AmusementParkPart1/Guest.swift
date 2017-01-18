//
//  Guest.swift
//  AmusementParkPart1
//
//  Created by Joseph Kim on 1/6/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import Foundation

// Initial value for discounts
let vipFoodDiscount = 10
let vipMerchandiseDiscount = 20

enum Guest: Entrant, AgeVerifiable {
    case classic
    case vip
    case child
}

// Each entrant has its own set of privileges and required information
extension Guest {
    
    var areaAccess: [Area] {
        return [.amusement]
    }
    
    // Only VIP guests can skip lines
    var skipAllowed: Bool {
        switch self {
        case .vip: return true
        default: return false
        }
    }
    
    // Only VIP guests can receive any discounts
    var foodDiscount: Int {
        switch self {
        case .vip: return vipFoodDiscount
        default: return 0
        }
    }
    
    var merchandiseDiscount: Int {
        switch self {
        case .vip: return vipMerchandiseDiscount
        default: return 0
        }
    }
    
    // Of the three quest types, only child guest is required to provide a dob information
    var requiredInformation: [PersonalData] {
        switch self {
        case .child: return [.dob]
        default: return []
        }
    }
}
