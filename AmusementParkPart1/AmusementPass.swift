//
//  AmusementPass.swift
//  AmusementParkPart1
//
//  Created by Joseph Kim on 1/7/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import Foundation


class AmusementPass {
    
    static var currentId = 1
    static var passes: [Pass] = []
    
    public func create(for entrant: Entrant, data: [String: String] = [:]) {
        let informationData = parseData(entrant: entrant, data: data)
        let pass = EntrantPass(entrant: entrant, passId: AmusementPass.currentId, entrantInformation: informationData)
        
        // Checks if age is valid next
        let _ = pass.isAgeValid
        
        // All tests passed, append pass and increment counter by 1
        AmusementPass.passes.append(pass)
        AmusementPass.currentId += 1
        print(AmusementPass.currentId)
    }
    
    public func getPass(atIndex index: Int) -> Pass {
        
        do {
            if index < 0 || index > AmusementPass.passes.count {
                throw Errors.PassIndexOutOfRange(message: "Index Out of Range!!!")
            }
        } catch Errors.PassIndexOutOfRange(message: let message) {
            print(message)
        } catch let error {
            fatalError("\(error)")
        }
        
        return AmusementPass.passes[index]
    }
    
    /// For testing use only.. This will destroy all data and reset the ID back to 1
    public func deleteAll() {
        AmusementPass.currentId = 1
        AmusementPass.passes = []
    }
    
    private func parseData(entrant: Entrant, data: [String:String]) -> [String: String] {
        var informationArray: [String: String] = [:]
        
        // checks for presence of all required fields, if found, populates the
        do {
            for property in entrant.requiredInformation {
                if let test = data[property.rawValue] {
                    informationArray[property.rawValue] = test
                } else {
                    throw Errors.IncompleteInformation(message: "Incomplete Information: \(property) is missing")
                }
            }
        } catch Errors.IncompleteInformation(message: let message) {
            print(message)
        } catch let error {
            fatalError("\(error)")
        }
        
        return informationArray
    }
}
