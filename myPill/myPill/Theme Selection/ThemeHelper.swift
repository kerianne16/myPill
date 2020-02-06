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
/*
    struct PropertyKeys {
        static let dark = "Dark"
        static let pink = "Pink"
        static let white = "White"
    }*/
     
// needs to go into add pill view controller

// func setTheme() {
//    guard let themePreference = themeHelper?.themePreferenceKey else { return }
//    switch themePreference {
//    case ThemeHelper.PropertyKeys.dark:
//        view.backgroundColor = .darkGray
//    case ThemeHelper.PropertyKeys.pink:
//        view.backgroundColor =
//        .pink
//    default:
//        view.backgroundColor = .white
//    }
//}


// needs to go into table cell view controller?
//private func setTheme() {
//   guard let themePreference = themeHelper.themePreferenceKey else { return }
//   switch themePreference {
//   case ThemeHelper.PropertyKeys.dark:
//       collectionView.backgroundColor = .darkGray
//case ThemeHelper.PropertyKeys.pink:
//collectionView.backgroundColor = .pink
//   default:
//       collectionView.backgroundColor = .white
//   }
//}



