//
//  Errors.swift
//  AmusementParkPart1
//
//  Created by Joseph Kim on 1/7/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import Foundation

enum Errors: Error {
    case InvalidDateFormat(message: String)
    case IncompleteInformation(message: String)
    case InvalidChildAge(message: String)
    case SoundNotFound(message: String)
    case DoubleSwipeError(message: String)
    case PassIndexOutOfRange(message: String)
}
