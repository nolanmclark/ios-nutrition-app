//
//  MealDetailViewController.swift
//  unsplashing
//
//  Created by Nolan Clark on 6/14/18.
//  Copyright © 2018 NC. All rights reserved.
//

import UIKit

class MealDetailViewController: UIViewController {
    
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var fats: UILabel!
    @IBOutlet weak var protein: UILabel!
    @IBOutlet weak var carbs: UILabel!
    
    var meal: Meal?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealName.text = meal?.mealName
        fats.text = meal?.fat
        protein.text = meal?.protein
        carbs.text = meal?.carbs
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
