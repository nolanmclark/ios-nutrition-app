//  Main View Controller
//
//  ViewController.swift
//
//  Nutrition App
//
//  Created by Nolan Clark on 6/26/17.
//  Copyright © 2017 NC. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    @IBOutlet weak var Header: UILabel!
    @IBOutlet weak var totalCarb: UILabel!
    @IBOutlet weak var totalFat: UILabel!
    @IBOutlet weak var totalCalories: UILabel!
    @IBOutlet weak var totalProtein: UILabel!
    @IBOutlet weak var roundedCornerButton: UIButton!
    @IBOutlet weak var mealDetailsTable: UITableView!
    
    var carbs = Int()
    var prot = Int()
    var fats = Int()
    var mealName = String()

    var timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none)
    
    var list = [String]();
    
    public func tableView(_ mealDetailsTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(list.count);
    }
    
    public func tableView(_ mealDetailsTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }

    @IBAction func showPopover(_ sender: UIButton) {
        performSegue(withIdentifier: "addFoodPop", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addFood = segue.destination as! addFoodPop
        addFood.currentCarbs = Int(totalCarb.text!)!
        addFood.currentProtein = Int(totalProtein.text!)!
        addFood.currentFats = Int(totalFat.text!)!
    }

    override func viewDidAppear(_ animated: Bool) {
        if(mealName != "") {
            self.list.append(String(mealName))
            self.mealDetailsTable.beginUpdates()
            self.mealDetailsTable.insertRows(at: [IndexPath(row: self.list.count-1, section: 0)], with: .automatic)
            self.mealDetailsTable.endUpdates()
        }
        totalCarb.text = "\(carbs)"
        totalProtein.text = "\(prot)"
        totalFat.text = "\(fats)"
        totalCalories.text = String((9 * fats) + (4 * carbs) + (4 * prot))
    }
    
    func resetStats() {
        totalCarb.text = ""
        totalProtein.text = ""
        totalFat.text = ""
        totalCalories.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Today - \(self.timestamp)"
    }
    
}

