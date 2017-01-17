//
//  HourlyEmployee.swift
//  AmusementParkPart1
//
//  Created by Joseph Kim on 1/6/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import Foundation

// Initial values for hourly employee discounts
let hourlyEmployeeFoodDiscount = 15
let hourlyEmployeeMerchandiseDiscount = 25

enum HourlyEmployee: Entrant {
    case foodServices
    case rideServices
    case maintenance
}

extension HourlyEmployee {
    var areaAccess: [Area] {
        switch self {
        case .foodServices: return [.amusement, .kitchen]
        case .rideServices: return [.amusement, .rideControl]
        case .maintenance: return [.amusement, .kitchen, .rideControl, .maintenance]
        }
    }
    
    var foodDiscount: Int {
        return hourlyEmployeeFoodDiscount
    }
    
    var merchandiseDiscount: Int {
        return hourlyEmployeeMerchandiseDiscount
    }
    
    
    // All three types require the same information
    var requiredInformation: [PersonalData] {
        return [.firstName, .lastName, .streetAddress, .city, .state, .zipCode, .ssn, .dob]
    }

}
