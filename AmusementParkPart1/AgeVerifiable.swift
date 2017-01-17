//
//  AgeVerifiable.swift
//  AmusementParkPart1
//
//  Created by Joseph Kim on 1/6/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import Foundation


protocol AgeVerifiable {
    var today: SimpleDate { get }
    var dateFormatter: DateFormatter { get }
    func isValidChild(for date: SimpleDate) throws -> Bool
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
    
    var dateFormatter: DateFormatter {
        // sets up the dateFormatter with date requirement
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        return formatter
    }
    
    func isValidChild(for date: SimpleDate) throws -> Bool {
        let childDate = SimpleDate(year: today.year - 5, month: today.month, day: today.day)
        let maximumAllowedDate = dateFormatter.date(from: childDate.toString())
        
        guard let birthday = dateFormatter.date(from: date.toString()) else {
            throw Errors.InvalidDateFormat(message: "Please enter date in the following format: \"MM-dd-yyyy\"")
        }
        
        // This normally shouldn't throw an error in real life, but since the project description asks to throw an error.. here it is!
        guard let testDate = maximumAllowedDate, testDate.timeIntervalSince(birthday) > 0 else {
            throw Errors.InvalidChildAge(message: "Child's age is greater than 5 years old.  Please double check the age or use the classic guest tab")
        }
        
        // if both of the above guard statements pass, then the age must be valid
        return true
    }
}
