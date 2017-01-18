//
//  CardSwiper.swift
//  AmusementParkPart1
//
//  Created by Joseph Kim on 1/7/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import Foundation
import AudioToolbox

// The heart of the card swiper
struct CardSwiper: SwipeCard {
    var lastId = 0
    var lastTime: TimeInterval = 0
    var waitTimeNeeded: TimeInterval = 15
    var currentTime: TimeInterval = 0
}

extension CardSwiper {
    
    // resets lastId and lastTime to zero.  this is used mainly for testing purposes
    mutating func reset() {
        lastId = 0
        lastTime = 0
    }
    
    //  For area access
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
        
        // If success is true, that means that access is granted
        playSound(for: success ? AccessSound.granted : AccessSound.denied)
        return success ? "This pass has access to \(snippet)" : "This pass does not have access to \(snippet)"
    }
    
    // For Discount eligibility
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
        
        // if discountAmount is 0, then there obviously isn't any discount
        playSound(for: discountAmount != 0 ? AccessSound.granted : AccessSound.denied)
        
        return discountAmount == 0 ? "This pass is not eligible for a \(discountType) discount" :
        "This pass has a \(discountAmount)% \(discountType) discount"
        
    }
    
    // For Ride privileges
    // This function also takes an optional argument called testAccess, which controls whether double swipe runs or not
    mutating func swipe(_ pass: Pass, for rideAccess: RideAccess, testAccess: Bool = false) -> String {
        
        var access = false
        var snippet = ""
        
        processBirthday(for: pass)
        
        switch rideAccess {
        case .allRides(let flag):
            access = flag
            snippet = "to all rides"
        case .skipLine(let flag):
            access = flag
            snippet = "to skip all lines"
        }

        // testAccess is used to note if the originating task is solely to check if one has access
        if !testAccess {
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
        
        // This checks if a person swipes a second time (hence lastId == id)
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
        
        // Currently, birthday message is displayed for all swipe transactions,
        // but depending on the requirement for project 5, it could easily be changed
        // in this function.
        
        
        if let date = birthday {
            isBirthday = checkBirthday(for: date)
        }
        
        if isBirthday {
            if let name = pass.entrantInformation[PersonalData.firstName.rawValue] {
                print("Happy Birthday, \(name)!")
            } else {
                print("Happy Birthday!")
            }
            
        }
    }
    
    private func extractBirthday(for pass: Pass) -> SimpleDate? {
        // Extracts birthday from information from the provided pass
        var complexDate = Date()
        guard let dob = pass.entrantInformation[PersonalData.dob.rawValue] else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat.dateFormat.rawValue
       
        if let tempDate = dateFormatter.date(from: dob) {
            complexDate = tempDate
        }
        
        // returns a SimpleDate object with the new year, month, and day components
        return SimpleDate(year: NSCalendar.current.component(.year, from: complexDate),
                          month: NSCalendar.current.component(.month, from: complexDate),
                          day: NSCalendar.current.component(.day, from: complexDate))
    }
    
    
    
    private func checkBirthday(for date: SimpleDate) -> Bool {
        let currentDate = Date()
        let calendar = NSCalendar.current
        
        // Current Year is unnecessary to check birthday
        let currentMonth = calendar.component(.month, from: currentDate)
        let currentDay = calendar.component(.day, from: currentDate)

        return (currentMonth, currentDay) == (date.month, date.day)
    }
    
    // plays sound depending on success or failure
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
