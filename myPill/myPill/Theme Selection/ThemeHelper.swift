//
//  ThemeHelper.swift
//  myPill
//
//  Created by beth on 2/4/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

import Foundation


class ThemeHelper {
   
    func setThemePreferenceToWhite() {
              UserDefaults.standard.set("White", forKey: themePreferenceKey)
      }
      func setThemePreferenceToDark() {
          UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
      }
      func setThemePreferenceToPink() {
          UserDefaults.standard.set("Pink", forKey: themePreferenceKey)
      }
    
       var themePreference: String? {
           return UserDefaults.standard.string(forKey: themePreferenceKey)
       }
       
   init() {
        guard themePreference == nil  else { return }
            setThemePreferenceToWhite()
        }
     
    private let themePreferenceKey = "themePreference"
    }
 

