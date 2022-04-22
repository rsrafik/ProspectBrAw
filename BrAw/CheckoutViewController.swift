import UIKit

class CheckoutViewController: UIViewController
{
    
    var moneyUsed: [String] = []
    var amountDue = Double()
    
    @IBOutlet weak var totalPaid: UILabel!
    var totalPay: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func whenPennyPressed(_ sender: Any) {
        pressed(i: 0.01)
    }
    
    @IBAction func whenNickelPressed(_ sender: Any) {
        pressed(i: 0.05)
    }
    
    @IBAction func whenDimePressed(_ sender: Any) {
        pressed(i: 0.10)
    }
    
    @IBAction func whenQuarterPressed(_ sender: Any) {
        pressed(i: 0.25)
    }
    
    @IBAction func whenOnePressed(_ sender: Any) {
        pressed(i: 1.00)
    }
    
    @IBAction func whenFivePressed(_ sender: Any) {
        pressed(i: 5.00)
    }
    
    @IBAction func whenTenPressed(_ sender: Any) {
        pressed(i: 10.00)
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
    
    func pressed(i: Double) {
        totalPay.append(i)
        totalPaid.text = "$\(moneyOwed())"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sum = totalPay.reduce(0,+)
        let lvc = segue.destination as! ChangeViewController
        lvc.amountPaid = sum
        lvc.amountDue = amountDue
    }


}
