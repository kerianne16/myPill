//
//  ThemeHelper.swift
//  myPill
//
//  Created by beth on 2/4/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

import Foundation


class ThemeHelper {

    var themePreferenceKey: String? {
        return UserDefaults.standard.string(forKey: .themePreference)
}
    init() {
        if themePreferenceKey == nil {
            setThemePreferenceToWhite()
        }
    }

    struct PropertyKeys {
        static let dark = "Dark"
        static let pink = "Pink"
        static let white = "White"
    }
    func setThemePreferenceToWhite() {
            UserDefaults.standard.set(PropertyKeys.white, forKey: .themePreference)
    }
    func setThemePreferenceToDark() {
        UserDefaults.standard.set(PropertyKeys.dark, forKey: .themePreference)
    }
    func setThemePreferenceToPink() {
        UserDefaults.standard.set(PropertyKeys.pink, forKey: .themePreference)
    }
}

extension String {
    static var themePreference = "themePreference"
}


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



