//
//  ThemeSettingsViewController.swift
//  myPill
//
//  Created by beth on 2/4/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

import UIKit

class ThemeSettingsViewController: UIViewController {

    @IBOutlet weak var pinkSwitch: UISwitch!
    @IBOutlet weak var whiteSwitch: UISwitch!
    @IBOutlet weak var darkSwitch: UISwitch!
   
   override func viewDidLoad() {
        updateViews()
    }
    @IBAction func selectWhiteTheme(_ sender: Any) {
        themeHelper.setThemePreferenceToWhite()
        pinkSwitch.isOn = false
        darkSwitch.isOn = false
        dismiss(animated: true, completion: nil)

    }
    
        @IBAction func selectDarkTheme(_ sender: Any) {
            themeHelper.setThemePreferenceToDark()
            whiteSwitch.isOn = false
            pinkSwitch.isOn = false
            dismiss(animated: true, completion: nil)
        }
        
        
        @IBAction func selectPinkTheme(_ sender: Any) {
            themeHelper.setThemePreferenceToPink()
            whiteSwitch.isOn = false
            darkSwitch.isOn = false
            dismiss(animated: true, completion: nil)
        }
    func updateViews() {
        switch themeHelper.themePreference {
            case "White":
                whiteSwitch.isOn = true
            case "Dark":
                darkSwitch.isOn = true
            case "Pink":
                pinkSwitch.isOn = true
            default:
               break
            }
        
    }
    var themeHelper: ThemeHelper = ThemeHelper()
}
