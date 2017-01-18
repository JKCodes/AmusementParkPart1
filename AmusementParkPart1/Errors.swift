//
//  Errors.swift
//  AmusementParkPart1
//
//  Created by Joseph Kim on 1/7/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import Foundation

// Different Errors used in the program
// Some are really here for extreme conditions
// PassIndexOutOfRange and SoundNotFound should really never happen if programmed correctly
enum Errors: Error {
    case InvalidDateFormat(message: String)
    case IncompleteInformation(message: String)
    case InvalidChildAge(message: String)
    case SoundNotFound(message: String)
    case DoubleSwipeError(message: String)
    case PassIndexOutOfRange(message: String)
}
