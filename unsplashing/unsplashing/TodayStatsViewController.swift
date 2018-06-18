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


class TodayStatsViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    @IBOutlet weak var Header: UILabel!
    @IBOutlet weak var totalCarb: UILabel!
    @IBOutlet weak var totalFat: UILabel!
    @IBOutlet weak var totalCalories: UILabel!
    @IBOutlet weak var totalProtein: UILabel!
    @IBOutlet weak var roundedCornerButton: UIButton!
    @IBOutlet weak var mealDetailsTable: UITableView!
    
    
    var mealCarbs = String()
    var mealProtein = String()
    var mealFats =  String()
    var mealCalories = String()
    
    var carbs = Int()
    var prot = Int()
    var fats = Int()
    var mealName = String()

    var timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none)
    
    var meals = [Meal]();
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Meal Cell", for: indexPath) as! MealViewCell
        let meal = self.meals[indexPath.row]
        cell.mealData = meal
        cell.mealName.text = meal.mealName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMeal = self.meals[indexPath.row]
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mealVC = Storyboard.instantiateViewController(withIdentifier: "MealDetailViewController") as! MealDetailViewController
        mealVC.meal = selectedMeal
        
        self.navigationController?.pushViewController(mealVC, animated: true);
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            self.meals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            // TODO: Remove amount of macros/cals from total
        }
    }

    @IBAction func showPopover(_ sender: UIButton) {
        performSegue(withIdentifier: "addFoodPop", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addFoodPop" {
            let addFood = segue.destination as! addFoodPop
            addFood.currentCarbs = Int(totalCarb.text!)!
            addFood.currentProtein = Int(totalProtein.text!)!
            addFood.currentFats = Int(totalFat.text!)!
        }
    }


    override func viewDidAppear(_ animated: Bool) {
        if(mealName != "") {
            var mealFatCals: Int = 0
            var mealCarbCals: Int = 0
            var mealProtCals: Int = 0
            var mealTotalCalories: String = ""
            
            mealFatCals = 9 * (Int(mealFats))!
            mealCarbCals = 4 * (Int(mealCarbs))!
            mealProtCals = 4 * (Int(mealProtein))!
            mealTotalCalories = String(mealFatCals + mealCarbCals + mealProtCals)

            let mealDetails = Meal(mealName: mealName, protein: mealProtein, carbs: mealCarbs, fat: mealFats, calories: mealTotalCalories)
            self.meals.append(mealDetails)
            self.mealDetailsTable.beginUpdates()
            self.mealDetailsTable.insertRows(at: [IndexPath(row: self.meals.count-1, section: 0)], with: .automatic)
            self.mealDetailsTable.endUpdates()
        }
        
        mealName = ""
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

