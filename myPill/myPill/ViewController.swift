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
class ViewController: UIViewController, UITextFieldDelegate {
    //MARK: Properties
    @IBOutlet weak var bcNameTextfield: UITextField!
    @IBOutlet weak var bcLabel: UILabel!
    
    var delegate: AddBCDelegate?
    var bcController: BirthController?

    override func viewDidLoad() {
        super.viewDidLoad()
    
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
        bcController?.createBirthControl(name: name)
       
      //  delegate?.bcWasAdded(bc)
     }
}

