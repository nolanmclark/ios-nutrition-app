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


class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    @IBOutlet weak var Header: UILabel!
    @IBOutlet weak var totalCarb: UILabel!
    @IBOutlet weak var totalFat: UILabel!
    @IBOutlet weak var totalCalories: UILabel!
    @IBOutlet weak var totalProtein: UILabel!
    @IBOutlet weak var roundedCornerButton: UIButton!
    
    var carbs = Int()
    var prot = Int()
    var fats = Int()

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
        totalCarb.text = "\(carbs)"
        totalProtein.text = "\(prot)"
        totalFat.text = "\(fats)"
        totalCalories.text = String((9 * fats) + (4 * carbs) + (4 * prot))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

