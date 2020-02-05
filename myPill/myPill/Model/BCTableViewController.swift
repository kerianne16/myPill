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
        dateFormatter.locale = locale
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
    //  cell for date picker
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddBcSegue" {
            if let vc = segue.destination as? AddViewController {
                vc.bcController = birthController
            }
        }
    }
}

