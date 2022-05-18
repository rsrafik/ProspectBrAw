import UIKit

class ChangeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    @IBOutlet weak var pennyLabel: UILabel!
    @IBOutlet weak var nickelLabel: UILabel!
    @IBOutlet weak var dimeLabel: UILabel!
    @IBOutlet weak var quarterLabel: UILabel!
    @IBOutlet weak var oneDollarLabel: UILabel!
    @IBOutlet weak var fiveDollarLabel: UILabel!
    
    @IBOutlet weak var scroll: UILabel!
    var seriesImage: [String] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
    var amountDue = Double()
    var amountPaid = Double()
    @IBOutlet weak var changeDue: UILabel!
    var fullyPaid = true
    let alert = UIAlertController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        var change = amountPaid - amountDue
        change = abs(change)
        print(change)
        let myDouble = String(format: "%.2f", change)
        changeDue.text = "$\(myDouble)"
        
        iterate(i: change)
    }
    
    func iterate(i: Double)
    {
        var z = i
        
        if z >= 0
        {
            while z >= 0.01
            {
                while (z >= 5)
                {
                    z -= 5
                    seriesImage.append("fiveDollar")
                }
                while (z >= 1 && z < 5)
                {
                    z -= 1
                    seriesImage.append("oneDollar")
                }
                while (z >= 0.25 && z < 1)
                {
                    z -= 0.25
                    seriesImage.append("25")
                }
                while (z >= 0.09 && z < 0.25)
                {
                    z -= 0.10
                    seriesImage.append("10")
                    
                }
                while (z >= 0.05 && z < 0.09)
                {
                    z -= 0.05
                    seriesImage.append("5")
                }
                print(z)
                
            }
            fullyPaid = true
        } else {
            fullyPaid = false
        }
        
        if seriesImage.count > 2 {
            scroll.text = "SCROLL TO SEE ALL CHANGE"
        }
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        if fullyPaid == false
        {
            let alert = UIAlertController(title: "Not enough money", message: nil, preferredStyle: UIAlertController.Style.alert)
            
            let okay = UIAlertAction(title: "Try Again", style: .default)
            alert.addAction(okay)
            present(alert, animated: true, completion: nil)
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("will appear")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return seriesImage.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.image.image = UIImage(named: seriesImage[indexPath.row])
        return cell
    }

}





