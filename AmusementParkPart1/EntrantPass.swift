//
//  EntrantPass.swift
//  AmusementParkPart1
//
//  Created by Joseph Kim on 1/7/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import Foundation


// Contains information about individual passes
class EntrantPass: Pass, AgeVerifiable {
    let entrant: Entrant
    
    // passId is a unique id number
    let passId: Int
    
    // entrantInformation is entrant's personal information.
    // This could be blank for some entrants
    var entrantInformation: [String: String]

    init(entrant: Entrant, passId: Int, entrantInformation: [String: String]) {
        self.entrant = entrant
        self.passId = passId
        self.entrantInformation = entrantInformation
    }

    var foodDiscount: Int {
        return entrant.foodDiscount
    }
    
    var merchandiseDiscount: Int {
        return entrant.merchandiseDiscount
    }
    
    var allRides: Bool {
        return entrant.allRides
    }
    
    var skipAllowed: Bool {
        return entrant.skipAllowed
    }

    var areaAccess: [Area] {
        return entrant.areaAccess
    }
    
    func canAccess(area: Area) -> Bool {
        return areaAccess.contains(area)
    }
    
    var isAgeValid: Bool {
        // Do nothing if the entrant does not need age checked
        if entrant is AgeVerifiable && entrant is Guest {
            // technically, at current state, only child guest should be matched
            // but for project 5, i decided to 'switch' anyway
            switch entrant as! Guest {
            case .child:
            do {
                if let dob = entrantInformation["dob"] {
                    return try isValidChild(for: dob)
                }
            } catch Errors.InvalidChildAge(message: let message) {
                print(message)
            } catch let error {
                fatalError("\(error)")
                }
            
            default: break
            }
        } else {
            return false
        }
        return false
    }
}
