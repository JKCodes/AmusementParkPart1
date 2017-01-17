//
//  Pass.swift
//  AmusementParkPart1
//
//  Created by Joseph Kim on 1/7/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import Foundation

protocol Pass: Entrant {
    var entrant: Entrant { get }
    var passId: Int { get }
    var entrantInformation: [String: String] { get set }
    func canAccess(area: Area) -> Bool
}
