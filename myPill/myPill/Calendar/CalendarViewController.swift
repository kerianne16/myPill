//
//  CalendarViewController.swift
//  myPill
//
//  Created by beth on 2/3/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var Calender: UICollectionView!
    
    @IBOutlet weak var MonthLabel: UILabel!
    
    let Months = ["January", "Febuary", "March", "April","May","June","July","August","September", "October", "November", "December"]
    
    let DaysOfMonth = ["Monday", "Tuesday", "Wednesday", "Thursday","Friday", "Saturday","Sunday"]
    
    var DaysInMonths = [31,28,31,30,31,30,31,31,30,31,30,31]
    
    var currentMonth = String()
    
    var NumberOfEmptyBox = Int()
    
    var NextNumberOfEmptyBox = Int()
    
    var PreviousNumberOfEmptyBox = 0
    
    var Direction = 0
    
    var PositionIndex = 0
    
    var LeapYearCounter = 2
    
    var dayCounter = 0
    
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        currentMonth = Months[month]
        MonthLabel.text = "\(currentMonth) \(year)"
        
        if weekday == 0 {
            weekday = 7
        }
        GetStartDatePosition()
     }
     
    
    func GetStartDatePosition() {
        
        switch Direction {
        case 0:
            NumberOfEmptyBox = weekday
            dayCounter = day
            while dayCounter>0 {
                NumberOfEmptyBox = NumberOfEmptyBox - 1
                dayCounter = dayCounter - 1
                if NumberOfEmptyBox == 0 {
                    NumberOfEmptyBox = 7
                }
            }
            if NumberOfEmptyBox == 7 {
                NumberOfEmptyBox = 0
            }
            
            PositionIndex = NumberOfEmptyBox
        case 1...:
            NextNumberOfEmptyBox = (PositionIndex + DaysInMonths[month])%7
            PositionIndex = NextNumberOfEmptyBox
            
        case -1:
            PreviousNumberOfEmptyBox = (7 - (DaysInMonths[month] - PositionIndex)%7)
            if PreviousNumberOfEmptyBox == 7 {
                PreviousNumberOfEmptyBox = 0
            }
            PositionIndex = PreviousNumberOfEmptyBox
        default:
            fatalError()
         }
    }

    
    @IBAction func Next(_ sender: Any) {
        switch currentMonth {
        case "December":
            month = 0
            year += 1
            Direction = 1
            if LeapYearCounter < 5 {
                LeapYearCounter += 1
            }
            
            if LeapYearCounter == 4 {
                DaysInMonths[1] = 29
            }
            
            if LeapYearCounter == 5 {
                LeapYearCounter = 1
                DaysInMonths[1] = 28
            }
            
            GetStartDatePosition()
            
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
             Calender.reloadData()
        default:
            month += 1
            Direction = 1
            GetStartDatePosition()
            currentMonth = Months[month]
            
            MonthLabel.text = "\(currentMonth) \(year)"
             Calender.reloadData()
        }
    }
    
    
    @IBAction func Back(_ sender: Any) {
        switch currentMonth {
        case "January":
             month = 11
             year -= 1
             Direction = -1
             
             if LeapYearCounter < 5 {
                            LeapYearCounter += 1
                        }
                        
                        if LeapYearCounter == 4 {
                            DaysInMonths[1] = 29
                        }
                        
                        if LeapYearCounter == 5 {
                            LeapYearCounter = 1
                            DaysInMonths[1] = 28
                        }
             
             GetStartDatePosition()
             currentMonth = Months[month]

            MonthLabel.text = "\(currentMonth) \(year)"
             Calender.reloadData()
            
        default:
            month -= 1
            Direction = -1
            
            GetStartDatePosition()
            currentMonth = Months[month]
            
            
            MonthLabel.text = "\(currentMonth) \(year)"
            Calender.reloadData()
        }
    }
    
    
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch Direction {
        case 0:
            return DaysInMonths[month] + NumberOfEmptyBox
        case 1...:
            return DaysInMonths[month] + NextNumberOfEmptyBox
        case -1:
            return DaysInMonths[month] + PreviousNumberOfEmptyBox
        default:
            fatalError()
        }
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DateCollectionViewCell
        cell.backgroundColor = UIColor.clear
        
        if cell.isHidden{
            cell.isHidden = false
        }
        
        switch Direction {
        case 0...:
            cell.DateLabel.text = "\(indexPath.row + 1 - NumberOfEmptyBox)"
        case 1:
             cell.DateLabel.text = "\(indexPath.row + 1 - NextNumberOfEmptyBox)"
        case -1:
             cell.DateLabel.text = "\(indexPath.row + 1 - PreviousNumberOfEmptyBox)"
        default:
            fatalError()
        }
        if Int(cell.DateLabel.text!)! < 1 {
            cell.isHidden = true
        }
        return cell
     }
}
