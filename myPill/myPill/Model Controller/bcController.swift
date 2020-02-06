//
//  bcController.swift
//  myPill
//
//  Created by Keri Levesque on 2/4/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

import Foundation


class BirthController {
    
    var birthControl = [BirthControl]()
    
    func createBirthControl(name: String, date: Date) {
        let newBC = BirthControl(name: name, date: date)
        birthControl.append(newBC)
    }        
}
