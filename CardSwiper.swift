//
//  CardSwiper.swift
//  AmusementParkPart1
//
//  Created by Joseph Kim on 1/7/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import Foundation
import AudioToolbox

struct CardSwiper: SwipeCard {
    var lastId = 0
    var lastTime: TimeInterval = 0
    var waitTimeNeeded: TimeInterval = 15
    var currentTime: TimeInterval = 0
}

extension CardSwiper {
    mutating func reset() {
        lastId = 0
        lastTime = 0
    }
    
    func swipe(_ pass: Pass, for area: Area) -> String {
        processBirthday(for: pass)
        let success = pass.canAccess(area: area)
        var snippet = ""
        switch area {
        case .amusement: snippet = "amusement park"
        case .kitchen: snippet = "kitchen"
        case .rideControl: snippet = "ride control area"
        case .maintenance: snippet = "maintenance"
        case .office: snippet = "office"
        }
        playSound(for: success ? AccessSound.granted : AccessSound.denied)
        return success ? "This pass has access to \(snippet)" : "This pass does not have access to \(snippet)"
    }
    
    func swipe(_ pass: Pass, for discount: Discount) -> String {
        processBirthday(for: pass)
        var discountType = ""
        var discountAmount = 0
        
        switch discount {
        case .food(let discount):
            discountType = "food"
            discountAmount = discount
        case .merchandise(let discount):
            discountType = "merchandise"
            discountAmount = discount
        }
        playSound(for: discountAmount != 0 ? AccessSound.granted : AccessSound.denied)
        
        return discountAmount == 0 ? "This pass is not eligible for a \(discountType) discount" :
        "This pass has a \(discountAmount)% \(discountType) discount"
        
    }
    
    mutating func swipe(_ pass: Pass, for rideAccess: RideAccess) -> String {
        
        var access = false
        var snippet = ""
        var doubleSwipeFlag = true
        
        processBirthday(for: pass)
        
        switch rideAccess {
        case .allRides(let flag):
            access = flag
            snippet = "to all rides"
        case .skipLine(let flag):
            access = flag
            if !access {
                doubleSwipeFlag = false
            }
            snippet = "to skip all lines"
        }

        if doubleSwipeFlag {
            do {
                let _ = try minimumTimeHasPassed(for: pass.passId)
            } catch Errors.DoubleSwipeError(message: let message) {
                return message
            } catch let error {
                fatalError("\(error)")
            }
        }

        playSound(for: access ? AccessSound.granted : AccessSound.denied)
        
        lastTime = currentTime
        lastId = pass.passId
        
        return access ? "This pass has access \(snippet)" : "This pass does not have access \(snippet)"
    }
    
    mutating func minimumTimeHasPassed(for id: Int) throws -> Bool {
        currentTime = Date().timeIntervalSince1970
        if lastId == 0 {
            // No one has swiped yet for the day
            return true
        }
        
        if lastId == id {

            guard currentTime - waitTimeNeeded > lastTime else {
                playSound(for : currentTime - waitTimeNeeded > lastTime ? AccessSound.granted : AccessSound.denied)
                throw Errors.DoubleSwipeError(message: "ID: \(id) must wait at least \(waitTimeNeeded - currentTime + lastTime) more seconds until next swipe")
            }
            return true
        }
        return true
    }
    
    func processBirthday(for pass: Pass) {
        let birthday = extractBirthday(for: pass)
        var isBirthday: Bool = false
        
        if let date = birthday {
            isBirthday = checkBirthday(for: date)
        }
        
        if isBirthday {
            print("Happy Birthday!!")
        }
    }
    
    private func extractBirthday(for pass: Pass) -> SimpleDate? {
        // Extract birthday from information
        guard let stringYear = pass.entrantInformation["year"],
            let stringMonth = pass.entrantInformation["month"],
            let stringDay = pass.entrantInformation["day"] else {
            return nil
        }
        
        guard let year = Int(stringYear), let month = Int(stringMonth), let day = Int(stringDay) else {
            return nil
        }
        
        return SimpleDate(year: Int(year), month: Int(month), day: Int(day))
    }
    
    
    
    private func checkBirthday(for date: SimpleDate) -> Bool {
        let currentDate = Date()
        let calendar = NSCalendar.current
        
        // Current Year is unnecessary to check birthday
        let currentMonth = calendar.component(.month, from: currentDate)
        let currentDay = calendar.component(.day, from: currentDate)

        return (currentMonth, currentDay) == (date.month, date.day)
    }
    
    func playSound(for sound: AccessSound) {
        do {
            let soundID = try AccessSound.playSound(for: sound)
            AudioServicesPlaySystemSound(soundID)
        } catch Errors.SoundNotFound(message: let message) {
            print(message)
        } catch let error {
            print("\(error)")
        }
    }
}
