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
    @IBOutlet weak var totalProtein: UILabel!
    @IBOutlet weak var roundedCornerButton: UIButton!
    
    var carbs = Int()
    var prot = Int()
    var fats = Int()

    @IBAction func showPopover(_ sender: UIButton) {
        performSegue(withIdentifier: "addFoodPop", sender: self)
    }
    
    // not working
    func getCurrentProteins() -> Int {
        return Int(totalProtein.text!)!
    }
    
    func getCurrentCarbohydrates() -> Int {
        return Int(totalCarb.text!)!
    }
    
    func getCurrentFats() -> Int {
        return Int(totalFat.text!)!
    }
    
    func checkTotals() {
        //var curCarbs, curFats, curProt: Int
        if totalCarb.text! == "0" && totalProtein.text! == "0" && totalFat.text! == "0" {
            //CHECK IF USER ADDS NEW FOOD
            totalProtein.text = String(prot)
            totalCarb.text = String(carbs)
            totalFat.text = String(fats)
        } else {
            /*
            curCarbs = getCurrentCarbohydrates()
            curFats = getCurrentFats()
            curProt = getCurrentProteins()
            
            curCarbs += carbs
            curProt += prot
            curFats += fats
            
            totalProtein.text = String(curProt)
            totalCarb.text = String(curCarbs)
            totalFat.text = String(curFats)
             */
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        totalProtein.text = String(prot)
        totalCarb.text = String(carbs)
        totalFat.text = String(fats)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkTotals()
    }
    
}

