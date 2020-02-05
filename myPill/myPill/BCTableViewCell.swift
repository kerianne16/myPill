//
//  BCTableViewCell.swift
//  myPill
//
//  Created by Keri Levesque on 2/3/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

import UIKit

class BCTableViewCell: UITableViewCell {

    @IBOutlet weak var birthControlLabel: UILabel!
    
    var birthcontrolz: BirthControl? {
        didSet {
            updateViews()
        }
    }
    private func updateViews() {
        guard let birthcontrol = birthcontrolz
            else { return }
        birthControlLabel.text = birthcontrol.name
    }
}
