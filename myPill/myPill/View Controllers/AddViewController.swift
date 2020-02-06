//
//  ViewController.swift
//  myPill
//
//  Created by Keri Levesque on 2/2/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

import UIKit
protocol AddBCDelegate {
    func bcWasAdded(_ bc: BirthControl)
}
class AddViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    @IBOutlet weak var bcNameTextfield: UITextField!
    @IBOutlet weak var bcLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!

    var delegate: AddBCDelegate?
    var bcController: BirthController?

    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
    
    }

    //MARK: UITextFieldDelegate
    
      func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          // Hide the keyboard.
          bcNameTextfield.resignFirstResponder()
          return true
      }
      
    //MARK: Actions
    
     @IBAction func addButton(_ sender: UIButton) {
        guard let name = bcNameTextfield.text, !name.isEmpty else { return }
      
        bcController?.createBirthControl(name: name, date: datePicker.date)
        navigationController?.popViewController(animated: true)
     }
  func setTheme() {
   
     guard let themePreference = themeHelper.themePreference else { return }
     var backgroundColor: UIColor!
     
     switch themePreference {
         
    case "Dark":
        backgroundColor = .darkGray
    case "Pink":
     backgroundColor =  UIColor(hue: 0.8472, saturation: 0.31, brightness: 0.92, alpha: 1.0)
     default:
     backgroundColor = .white
     }
     
     view.backgroundColor = backgroundColor
 }

    let themeHelper = ThemeHelper()
}

