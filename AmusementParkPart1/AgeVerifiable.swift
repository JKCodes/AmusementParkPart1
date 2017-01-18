//
//  AgeVerifiable.swift
//  AmusementParkPart1
//
//  Created by Joseph Kim on 1/6/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import Foundation

// For verifying age.  Right now, only child pass utilize this
protocol AgeVerifiable {
    var today: SimpleDate { get }
    func isValidChild(for dateString: String) throws -> Bool
}

extension AgeVerifiable {
    var today: SimpleDate {
        
        let currentDate = Date()
        // sets today's date as NSCalendar
        let calendar = NSCalendar.current
        
        // extracts year, month, and day from the above calendar
        let currentYear = calendar.component(.year, from: currentDate)
        let currentMonth = calendar.component(.month, from: currentDate)
        let currentDay = calendar.component(.day, from: currentDate)
        
        return SimpleDate(year: currentYear, month: currentMonth, day: currentDay)
    }
    
    func isValidChild(for dateString: String) throws -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        
        let childDate = SimpleDate(year: today.year - 5, month: today.month, day: today.day)
        let maximumAllowedDate = dateFormatter.date(from: childDate.toString())
        let birthDate = dateFormatter.date(from: dateString)
        
        
        // throws an error if age requirement is not met
        guard let testDate = maximumAllowedDate, let birthday = birthDate, testDate.timeIntervalSince(birthday) < 0 else {
            throw Errors.InvalidChildAge(message: "Child's age is greater than or equal to FIVE.  Please double check the age, or use classic guest form")
        }
        
        // if both of the above guard statements pass, then the age must be valid
        return true
    }
}
