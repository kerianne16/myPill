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
 var birthControls = [BirthControl]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   print(birthControl)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return birthControls.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BCCell", for: indexPath) as? BCTableViewCell else { return UITableViewCell() }

        let bc = birthControls[indexPath.row]
        cell.birthcontrolz = bc

        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddBcSegue" {
            if let vc = segue.destination as? ViewController {
                vc.delegate = self
            }
        }
    }
}
extension BCTableViewController: AddBCDelegate {
    func bcWasAdded(_ bc: BirthControl) {
        birthControls.append(bc)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
