//
//  CalendarVar.swift
//  myPill
//
//  Created by beth on 2/3/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

import Foundation


let date = Date()
let calendar = Calendar.current


let day = calendar.component(.day , from: date)
var weekday = calendar.component(.weekday , from: date) - 1
var month = calendar.component(.month , from: date) - 1
var year = calendar.component(.year , from: date)

