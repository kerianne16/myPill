//
//  ViewController.swift
//  myPill
//
//  Created by Keri Levesque on 2/2/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //MARK: Properties
    @IBOutlet weak var bcNameTextfield: UITextField!
    @IBOutlet weak var bcLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        bcNameTextfield.delegate = self
    }

    //MARK: UITextFieldDelegate
    
      func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          // Hide the keyboard.
          bcNameTextfield.resignFirstResponder()
          return true
      }
      
      func textFieldDidEndEditing(_ textField: UITextField) {
          bcLabel.text = textField.text
      }
    //MARK: Actions
     @IBAction func addButton(_ sender: UIButton) {
        bcLabel.text = "Default Text"
     }
    

}

