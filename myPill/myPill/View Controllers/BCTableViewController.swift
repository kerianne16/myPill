//
//  BCTableViewController.swift
//  myPill
//
//  Created by Keri Levesque on 2/3/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

import UIKit

class BCTableViewController: UITableViewController {
    
    @IBOutlet var bcTableView: UITableView!
    
    //MARK: Properties
    
    var dateFormatter = DateFormatter()
    let birthController = BirthController()
    let locale = NSLocale.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   print(birthControl)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return birthController.birthControl.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BCCell", for: indexPath) as? BCTableViewCell else { return UITableViewCell() }

        let bc = birthController.birthControl[indexPath.row]
        cell.birthControl = bc

        return cell
    }
                
     func setTheme() {
      
        guard let themePreference = themeHelper.themePreference else { return }
        var backgroundColor: UIColor!
        
        switch themePreference {
            
       case "Dark":
        backgroundColor = .darkGray 
       case "Pink":
        backgroundColor = .systemPink
        default:
        backgroundColor = .white
        }
        
        view.backgroundColor = backgroundColor
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
     
        case "AddBcSegue":
            if let vc = segue.destination as? AddViewController  {
                vc.bcController = birthController
            }
        case "ThemeSelector":
             guard let destinationVC = segue.destination as? ThemeSettingsViewController else { return }
            
             destinationVC.themeHelper = themeHelper
        default:
            break
        }
            
        }
 /*
     if segue.identifier == "AddBcSegue" {
               if let vc = segue.destination as? AddViewController {
                   vc.bcController = birthController
               } */
    

 let themeHelper = ThemeHelper()

}




