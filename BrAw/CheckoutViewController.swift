//
//  CheckoutViewController.swift
//  BrAw
//
//  Created by Rachel Rafik on 3/16/22.
//

import UIKit

class CheckoutViewController: UIViewController
{
    
    var moneyUsed: [String] = []
    @IBOutlet weak var totalPaid: UILabel!
    var totalPay: [Double] = []
    let moneyImages: [UIImage] = [
        UIImage(named: "1")!,
    UIImage(named: "5")!,
    UIImage(named: "10")!,
    UIImage(named: "25")!,
    UIImage(named: "oneDollar")!,
    UIImage(named: "fiveDollar")!,
    UIImage(named: "tenDollar")!,
    ]
    
    var stuff: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func whenPennyPressed(_ sender: Any) {
        totalPay.append(0.01)
        totalPaid.text = "$\(moneyOwed())"
    }
    
    @IBAction func whenNickelPressed(_ sender: Any) {
        totalPay.append(0.05)
        totalPaid.text = "$\(moneyOwed())"
    }
    
    @IBAction func whenDimePressed(_ sender: Any) {
        totalPay.append(0.10)
        totalPaid.text = "$\(moneyOwed())"
    }
    
    @IBAction func whenQuarterPressed(_ sender: Any) {
        totalPay.append(0.25)
        totalPaid.text = "$\(moneyOwed())"
    }
    
    @IBAction func whenOnePressed(_ sender: Any) {
        totalPay.append(1.00)
        totalPaid.text = "$\(moneyOwed())"
    }
    
    @IBAction func whenFivePressed(_ sender: Any) {
        totalPay.append(5.00)
        totalPaid.text = "$\(moneyOwed())"
    }
    
    @IBAction func whenTenPressed(_ sender: Any) {
        totalPay.append(10.00)
        totalPaid.text = "$\(moneyOwed())"
    }
    
    func moneyOwed() -> String {
        let sum = totalPay.reduce(0,+)
        let myDouble = String(format: "%.2f", sum)
        return myDouble
    }
    @IBAction func clear(_ sender: Any) {
        totalPay.removeAll()
        totalPaid.text = "$0.00"
    }


}
