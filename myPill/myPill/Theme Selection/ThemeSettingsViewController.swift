//
//  ThemeSettingsViewController.swift
//  myPill
//
//  Created by beth on 2/4/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

import UIKit

class ThemeSettingsViewController: UIViewController {

     var themeHelper: ThemeHelper?
        
        override func viewDidLoad() {
               super.viewDidLoad()

               // Do any additional setup after loading the view.
           }
        
        @IBAction func selectWhiteTheme(_ sender: Any) {
        UserDefaults.standard.set(ThemeHelper.PropertyKeys.white, forKey: .themePreference)
        themeHelper?.setThemePreferenceToWhite()
        dismiss(animated: true, completion: nil)
            
    }
        @IBAction func selectDarkTheme(_ sender: Any) {
            UserDefaults.standard.set(ThemeHelper.PropertyKeys.dark, forKey: .themePreference)
            themeHelper?.setThemePreferenceToDark()
            dismiss(animated: true, completion: nil)
        }
        
        
        @IBAction func selectPinkTheme(_ sender: Any) {
            UserDefaults.standard.set(ThemeHelper.PropertyKeys.pink, forKey: .themePreference)
            themeHelper?.setThemePreferenceToPink()
            dismiss(animated: true, completion: nil)
        }
    }
