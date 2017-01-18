//
//  AccessSound.swift
//  AmusementParkPart1
//
//  Created by Joseph Kim on 1/7/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import Foundation
import AudioToolbox

// Plays sound when passes are swiped
enum AccessSound: String {
    case granted = "AccessGranted"
    case denied = "AccessDenied"
}

extension AccessSound {
    // sets up sound for the specified name. Throws error if the file is deleted somehow
    static func playSound(for name: AccessSound) throws -> SystemSoundID {
        var soundId: SystemSoundID = 0
        guard let path = Bundle.main.path(forResource: name.rawValue, ofType: "wav") else {
            throw Errors.SoundNotFound(message: "Specified sound file not found!!")
        }
        let url = URL(fileURLWithPath: path)
        AudioServicesCreateSystemSoundID(url as CFURL, &soundId)
        return soundId
    }
}
