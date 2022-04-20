//
//  CheckoutViewController.swift
//  BrAw
//
//  Created by Rachel Rafik on 3/16/22.
//

import UIKit

class CheckoutViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var seriesImage: [String] = ["1", "5", "10", "25", "oneDollar", "fiveDollar", "tenDollar", "twentyDollar"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func whenPennyPressed(_ sender: Any) {
    }
    
    @IBAction func whenNickelPressed(_ sender: Any) {
    }
    @IBAction func whenDimePressed(_ sender: Any) {
    }
    @IBAction func whenQuarterPressed(_ sender: Any) {
    }
    @IBAction func whenOnePressed(_ sender: Any) {
    }
    @IBAction func whenFivePressed(_ sender: Any) {
    }
    @IBAction func whenTenPressed(_ sender: Any) {
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }

}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


