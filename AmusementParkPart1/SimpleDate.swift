//
//  Birthday.swift
//  AmusementParkPart1
//
//  Created by Joseph Kim on 1/6/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import Foundation


/// This is a very simplied version of Date
struct SimpleDate {
    let year: Int
    let month: Int
    let day: Int
    
    func toString() -> String {
        return "\(month)-\(day)-\(year)"
    }
}
