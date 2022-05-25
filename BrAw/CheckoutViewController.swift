import UIKit

class CheckoutViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    
    var moneyUsed: [String] = []
    var amountDue = Double()
    var images: [String] = []
    
    @IBOutlet weak var totalPaid: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var totalPay: [Double] = []
    let alert = UIAlertController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

    @IBAction func whenPennyPressed(_ sender: Any)
    {
        pressed(i: 0.01)
        images.append("1")
        collectionView.reloadData()
    }
    
    @IBAction func whenNickelPressed(_ sender: Any)
    {
        pressed(i: 0.05)
        images.append("5")
        collectionView.reloadData()
    }
    
    @IBAction func whenDimePressed(_ sender: Any)
    {
        pressed(i: 0.10)
        images.append("10")
        collectionView.reloadData()
    }
    
    @IBAction func whenQuarterPressed(_ sender: Any)
    {
        pressed(i: 0.25)
        images.append("25")
        collectionView.reloadData()
    }
    
    @IBAction func whenOnePressed(_ sender: Any)
    {
        pressed(i: 1.00)
        images.append("oneDollar")
        collectionView.reloadData()
    }
    
    @IBAction func whenFivePressed(_ sender: Any)
    {
        pressed(i: 5.00)
        images.append("fiveDollar")
        collectionView.reloadData()
    }
    
    @IBAction func whenTenPressed(_ sender: Any) {
        pressed(i: 10.00)
        images.append("tenDollar")
        collectionView.reloadData()
    }
    
    @IBAction func whenTwentyPressed(_ sender: Any) {
        pressed(i: 20.00)
        images.append("twentyDollar")
        collectionView.reloadData()
    }
    
    
    func moneyOwed() -> String {
        let sum = totalPay.reduce(0,+)
        let myDouble = String(format: "%.2f", sum)
        return myDouble
    }
    
    @IBAction func clear(_ sender: Any)
    {
        totalPay.removeAll()
        totalPaid.text = "$0.00"
        images.removeAll()
        collectionView.reloadData()
    }
    
    func pressed(i: Double)
    {
        totalPay.append(i)
        totalPaid.text = "$\(moneyOwed())"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segue" {
            let sum = totalPay.reduce(0,+)
            let lvc = segue.destination as! ChangeViewController
            lvc.amountPaid = sum
            lvc.amountDue = amountDue
        }
    }
    
    @IBAction func segue(_ sender: Any) {
        if amountDue <= totalPay.reduce(0,+) {
        self.performSegue(withIdentifier: "segue", sender: self)
            
        } else if amountDue > totalPay.reduce(0,+) {
            let alert = UIAlertController(title: "Not enough money", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let okay = UIAlertAction(title: "Try Again", style: .default)
            alert.addAction(okay)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "theCell", for: indexPath) as! otherCollectionViewCell
        cell.image1.image = UIImage(named: images[indexPath.row])
        return cell
    }
    


}
