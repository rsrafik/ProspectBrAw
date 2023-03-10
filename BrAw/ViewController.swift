import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var totalCounter: UILabel!
    @IBOutlet var images: [UIImageView]!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var items:[String] = []
    
    var total:[Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func whenCoffeeImgPressed(_ sender: Any)
    {
        let newItem = "Hot Coffee/ Hot Chocolate/ Hot Tea"
        items.append(newItem)
        tableView.reloadData()
        total.append(1.00)
        totalCounter.text = "$\(moneyOwed())"
        
    }
    
    @IBAction func whenTeaImgPressed(_ sender: Any)
    {
        let newItem = "Iced Tea"
        items.append(newItem)
        tableView.reloadData()
        total.append(1.00)
        totalCounter.text = "$\(moneyOwed())"
    }
    
    @IBAction func whenFlavorPressed(_ sender: Any)
    {
        let newItem = "Iced Coffee"
        items.append(newItem)
        tableView.reloadData()
        total.append(2.00)
        totalCounter.text = "$\(moneyOwed())"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let sum = total.reduce(0,+)
        let lvc = segue.destination as! CheckoutViewController
        lvc.amountDue = sum
    }
    
    func moneyOwed() -> String {
        let sum = total.reduce(0,+)
        let myDouble = String(format: "%.2f", sum)
        return myDouble
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    @IBAction func whenClearPressed(_ sender: Any)
    {
        total.removeAll()
        totalCounter.text = "$0.00"
        items.removeAll()
        tableView.reloadData()
    }
    
}
