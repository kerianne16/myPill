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
    @IBOutlet weak var dateLabel: UILabel!
    
    var birthControl: BirthControl? {
        didSet {
            updateViews()
        }
    }
    private func updateViews() {
        guard let birthControl = birthControl
            else { return }
        birthControlLabel.text = birthControl.name
        dateLabel.text = dateFormatter(date: birthControl.date)
    }
    
    func dateFormatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-HH:ss"
        return dateFormatter.string(from: date)
    }
    
}
