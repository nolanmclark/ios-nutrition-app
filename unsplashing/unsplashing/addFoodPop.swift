//
//  addFoodPop.swift
//  unsplashing
//
//  Created by Nolan Clark on 6/28/17.
//  Copyright © 2017 NC. All rights reserved.
//

import UIKit

class addFoodPop: UIViewController {
    
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var proteinText: UITextField!
    @IBOutlet weak var carbLabel: UILabel!
    @IBOutlet weak var carbText: UITextField!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var fatText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        proteinText.text = textField.text
        carbText.text = textField.text
        fatText.text = textField.text
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let todayStats = segue.destination as! ViewController
        todayStats.carbs = Int(carbText.text!)!
        todayStats.prot = Int(proteinText.text!)!
        todayStats.fats = Int(fatText.text!)!
        
        /* Addition Needs to be implemented
         
        var currentCarbs: Int!, currentProtein: Int!, currentFats: Int!
        if (Int(todayStats.totalCarb.text!) == nil) {
            todayStats.carbs = Int(carbText.text!)!
            todayStats.prot = Int(proteinText.text!)!
            todayStats.fats = Int(fatText.text!)!
        } else {
            currentCarbs = Int(todayStats.totalCarb.text!)
            currentProtein = Int(todayStats.totalProtein.text!)
            currentFats = Int(todayStats.totalFat.text!)
            
            todayStats.carbs = currentCarbs! + (Int(carbText.text!))!
            todayStats.prot = currentProtein! + Int(proteinText.text!)!
            todayStats.fats = currentFats! + Int(fatText.text!)! */
    }
    
    //MARK: Actions
    @IBAction func addFoodItem(_ sender: UIButton) {
        if proteinText.text != "" || carbText.text != "" || fatText.text != "" {
            performSegue(withIdentifier: "addedFood", sender: self)
        } else {
            //INVALID FOOD OR INVALID ENTRY
        }
    }

}
