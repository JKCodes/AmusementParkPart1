//
//  Manager.swift
//  AmusementParkPart1
//
//  Created by Joseph Kim on 1/7/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import Foundation

// Initial values for manager discounts
let managerFoodDiscount = 25
let managerMerchandiseDiscount = 25

enum Manager: Entrant {
    case manager
}

extension Manager {
    var areaAccess: [Area] {
        // using switch here even though there are only one possible choice
        // in case more options are added in future
        switch self {
        case .manager: return [.amusement, .kitchen, .rideControl, .office]
        }
    }
    
    // Note that there is only one type of manager, so switch statement is not needed
    var foodDiscount: Int {
        return managerFoodDiscount
    }
    
    var merchandiseDiscount: Int {
        return managerMerchandiseDiscount
    }
    
    var requiredInformation: [PersonalData] {
        return [.firstName, .lastName, .streetAddress, .city, .state, .zipCode, .ssn, .dob, .managementTier]
    }
}
