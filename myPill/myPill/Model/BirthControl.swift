//
//  BirthControl.swift
//  myPill
//
//  Created by Keri Levesque on 2/3/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

import UIKit

class BirthControl {
    
    var name: String
    var hasTaken: Bool
    
    init(name: String, hasTaken: Bool) {
        
        guard !name.isEmpty else {
            return nil
        }
        self.name = name
        self.hasTaken = hasTaken
    }
}


