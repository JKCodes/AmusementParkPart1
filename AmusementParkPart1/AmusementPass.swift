//
//  AmusementPass.swift
//  AmusementParkPart1
//
//  Created by Joseph Kim on 1/7/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import Foundation


class AmusementPass {
    
    // Id starts at 1, and NOT 0
    static var currentId = 1
    static var passes: [Pass] = []
    
    // Note that both data and testMode are non-required arguments
    public func create(for entrant: Entrant, data: [String: String] = [:], testMode: Bool = false) {
        // See if the data itself is valid, if not an "error" array is returned
        let informationData = parseData(entrant: entrant, data: data)
        
        // Once data is determined to be in valid form, create an entrant pass
        let pass = EntrantPass(entrant: entrant, passId: AmusementPass.currentId, entrantInformation: informationData)
        
        // Checks if age is valid next if testMode is false
        if !testMode {
            let valid = pass.isAgeValid
            if valid {
                print("This pass is eligible for a child pass")
            }
        }
        
        // All tests passed, append pass to passes and increment id counter by 1
        AmusementPass.passes.append(pass)
        AmusementPass.currentId += 1
    }
    
    // Uses class's power of reference type to modify the entrant info
    // Modifying here automatically updates the pass in viewController
    // For testing use only.. will be changed or removed in project 5
    public func updateEntrantInfo(_ pass: Pass, key: String, with value: String) {
        // Updates the key with the specified value
        // Adds the key/value if the pair does not already exist
        var pass = pass
        pass.entrantInformation[key] = value
        AmusementPass.passes[pass.passId] = pass
    }
    
    // Similarly, remove an entrant info
    // For testing use only.. will be changed or removed in project 5
    public func removeEntrantInfo(_ pass: Pass, key: String) {
        // Removes the specified key
        var pass = pass
        pass.entrantInformation[key] = nil
        AmusementPass.passes[pass.passId] = pass
    }
    
    // Returns a pass for a given index number
    // If index is out of range, returns a dummy pass
    public func getPass(atIndex index: Int) -> Pass {
        var validIndex = true
        
        do {
            if index < 0 || index > AmusementPass.passes.count {
                validIndex = false
                throw Errors.PassIndexOutOfRange(message: "Pass Index Out of Range! Returning a dummy pass")
            }
        } catch Errors.PassIndexOutOfRange(message: let message) {
            print(message)
        } catch let error {
            fatalError("\(error)")
        }
        
        return validIndex ? AmusementPass.passes[index] : EntrantPass(entrant: Guest.classic, passId: -1, entrantInformation: [:])
    }
    
    /// For testing use only.. This will destroy all data and reset the ID back to 1
    public func deleteAll() {
        AmusementPass.currentId = 1
        AmusementPass.passes = []
    }
    
    /// This  function takes in the data from viewController and analyzes for invalidity.  Returns an error array or the initial data array
    private func parseData(entrant: Entrant, data: [String:String]) -> [String: String] {
        // right now, if an invalid data is detected, returned array is set to ["error": "true"], but nothing happens
        // for project 5, the error key will be used to ask the user to input the data again
        
        var informationArray: [String: String] = data
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat.dateFormat.rawValue
        
        // checks for presence of all required fields. Populates informationArray as needed
        do {
            for property in entrant.requiredInformation {
                guard let _ = data[property.rawValue] else {
                    throw Errors.IncompleteInformation(message: "Incomplete Information: \(property) is missing")
                }
            }
        } catch Errors.IncompleteInformation(message: let message) {
            informationArray = ["error":"true"]
            print(message)
        } catch let error {
            fatalError("\(error)")
        }
        
        // checks for invalid date format, if date of birth provided
        
        do {
            for field in informationArray {
                if field.key == "dob" {
                    guard let _ = dateFormatter.date(from: field.value) else {
                        throw Errors.InvalidDateFormat(message: "Please enter date in the following format: \"MM-dd-yyyy\"")
                    }
                }
            }
        } catch Errors.InvalidDateFormat(message: let message) {
            informationArray = ["error":"true"]
            print(message)
        } catch let error {
            fatalError("\(error)")
        }
        
        // Removes the unnecessary managementTier info if not a manager
        if !(entrant is Manager) {
            informationArray.removeValue(forKey: PersonalData.managementTier.rawValue)
        }
        
        return informationArray
    }
}
