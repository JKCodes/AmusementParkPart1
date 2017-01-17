//
//  SwipeCard.swift
//  AmusementParkPart1
//
//  Created by Joseph Kim on 1/7/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import Foundation

protocol SwipeCard {
    func swipe(_ pass: Pass, for area: Area) -> String
    func swipe(_ pass: Pass, for discount: Discount) -> String
    mutating func swipe(_ pass: Pass, for rideAccess: RideAccess) -> String
    func playSound(for sound: AccessSound)
    func processBirthday(for pass: Pass)
}
