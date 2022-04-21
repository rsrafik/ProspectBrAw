//
//  ChangeViewController.swift
//  BrAw
//
//  Created by Rachel Rafik on 4/21/22.
//

import UIKit

class ChangeViewController: UIViewController {

    @IBOutlet weak var pennyLabel: UILabel!
    @IBOutlet weak var nickelLabel: UILabel!
    @IBOutlet weak var dimeLabel: UILabel!
    @IBOutlet weak var quarterLabel: UILabel!
    @IBOutlet weak var oneDollarLabel: UILabel!
    @IBOutlet weak var fiveDollarLabel: UILabel!
    
    var amountDue = Double()
    var amountPaid = Double()
    @IBOutlet weak var changeDue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let change = amountPaid - amountDue
        let myDouble = String(format: "%.2f", change)
        changeDue.text = "$\(myDouble)"
        
        iterate(i: change)
    }
    
    func iterate(i: Double)
    {
        var zero1 = 0
        var zero2 = 0
        var zero3 = 0
        var zero4 = 0
        var zero5 = 0
        var zero6 = 0
        
        var z = i
        
        if z >= 0
        {
            while z > 0.25
            {
                while (z >= 5)
                {
                    z -= 5
                    zero1 += 1
                    fiveDollarLabel.text = "\(zero1)"
                }
                while (z >= 1 && z < 5) {
                    z -= 1
                    zero2 += 1
                    oneDollarLabel.text = "\(zero2)"
                }
                while (z >= 0.25 && z < 1) {
                    z -= 0.25
                    zero3 += 1
                    quarterLabel.text = "\(zero3)"
                }
                while (z >= 0.1 && z < 0.25) {
                    oneDollarLabel.text = "\(zero4)"
                }
            }
        } else {
            
        }
    }
}

        
        
        
        
        
        
        
        
        
//        var change = amountPaid - amountDue
//        var zero1 = 0
//        var zero2 = 0
//        var zero3 = 0
//        while change > 0 {
//            while change >= 5 {
//                change -= 5
//                zero1 += 1
//                fiveDollarLabel.text = "\(zero1)"
//            }
//            while change >= 1 && change < 5 {
//                change -= 1
//                zero2 += 1
//                oneDollarLabel.text = "\(zero2)"
//            }
//            while change >= 0.25 && change < 1 {
//                change -= 0.25
//                zero3 += 1
//                quarterLabel.text = "\(zero3)"
//            }
//
//        }
//
//




