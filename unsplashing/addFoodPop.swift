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
    
    var currentProtein = Int()
    var currentCarbs = Int()
    var currentFats = Int()

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
        // Validate input, if form valid add to current data.
        if carbText.text != "" && proteinText.text != "" && fatText.text != "" {
            todayStats.carbs = currentCarbs + Int(carbText.text!)!
            todayStats.prot = currentProtein + Int(proteinText.text!)!
            todayStats.fats = currentFats + Int(fatText.text!)!
        } else {
            createAlert(title: "Invalid Submission", message: "Fill out all elements of form")
        }
    }
    
    func createAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
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
