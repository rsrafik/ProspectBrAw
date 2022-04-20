//
//  ViewController.swift
//  BrAw
//
//  Created by Rachel Rafik on 3/10/22.
//

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

    @IBAction func whenCoffeeImgPressed(_ sender: Any) {
        let newItem = "Coffee"
        items.append(newItem)
        tableView.reloadData()
        total.append(1.75)
        totalCounter.text = "$\(moneyOwed())"
        
    }
    
    @IBAction func whenTeaImgPressed(_ sender: Any) {
        let newItem = "Tea"
        items.append(newItem)
        tableView.reloadData()
        total.append(1.00)
        print(total)
        totalCounter.text = "$\(moneyOwed())"
    }
    
    @IBAction func whenFlavorPressed(_ sender: Any) {
        let newItem = "Flavor"
        items.append(newItem)
        tableView.reloadData()
        total.append(0.25)
        totalCounter.text = "$\(moneyOwed())"
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    @IBAction func whenClearPressed(_ sender: Any) {
        total.removeAll()
        totalCounter.text = "$0.00"
        items.removeAll()
        tableView.reloadData()
    }
    
}
