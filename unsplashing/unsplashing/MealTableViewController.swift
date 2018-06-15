//
//  MealTableViewController.swift
//  unsplashing
//
//  Created by Nolan Clark on 6/14/18.
//  Copyright © 2018 NC. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    var meals = [Meal]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = tableView.rowHeight;
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return meals.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Meal Cell", for: indexPath) as! MealViewCell
//        let meal = self.meals[indexPath.row]
//        
//        cell.mealData = meal
//        
//        return cell
//    }
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedMeal = self.meals[indexPath.row]
//        
//        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mealVC = Storyboard.instantiateViewController(withIdentifier: "MealDetailViewController") as! MealDetailViewController
//        mealVC.meal = selectedMeal
//        
//        self.navigationController?.pushViewController(mealVC, animated: true);
//    }


}
