//
//  addFoodPop.swift
//  unsplashing
//
//  Created by Nolan Clark on 6/28/17.
//  Copyright © 2017 NC. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate{
    func foodAdded(controller:addFoodPop)
}

class addFoodPop: UIViewController {
    
    var delegate: ViewControllerDelegate? = nil
    
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var mealName: UITextField!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var proteinText: UITextField!
    @IBOutlet weak var carbLabel: UILabel!
    @IBOutlet weak var carbText: UITextField!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var fatText: UITextField!
    
    @IBOutlet weak var gradBack: UIView!
    @IBOutlet weak var gradButton: UIButton!
    var currentProtein = Int()
    var currentCarbs = Int()
    var currentFats = Int()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Meal"
        
        mealName.text = ""
        proteinText.text = ""
        carbText.text = ""
        fatText.text = ""
        
        // Do any additional setup after loading the view.
        let gradientLayer = CAGradientLayer.init()
        fatText.keyboardType = UIKeyboardType.numberPad
        carbText.keyboardType = UIKeyboardType.numberPad
        proteinText.keyboardType = UIKeyboardType.numberPad
        mealName.keyboardType = UIKeyboardType.alphabet
        
        gradientLayer.colors = [UIColor.white.cgColor,
                                UIColor.red.cgColor,
                                UIColor.white.cgColor]
        
        gradientLayer.transform = CATransform3DMakeRotation(CGFloat.pi / 2, 0, 0, 2)
        gradientLayer.frame = CGRect.init(
            x: gradButton.frame.minX - 40,
            y: gradButton.frame.minY - 40,
            width: gradButton.frame.width + 80,
            height: gradButton.frame.height + 80
        )
        gradientLayer.masksToBounds = true
        let shadowLayer = CALayer.init()
        shadowLayer.frame = gradientLayer.bounds
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOpacity = 0.06
        shadowLayer.shadowRadius = 40
        shadowLayer.shadowPath = CGPath.init(rect: shadowLayer.bounds, transform: nil)
        gradientLayer.mask = shadowLayer
        gradBack.layer.insertSublayer(gradientLayer, below: gradButton.layer)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addFoodPop.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(mealName.text != "") {
            mealName.text = "";
        }
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
        mealName.text = textField.text
    }
    
    func createAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: Actions
    @IBAction func addFoodItem(sender: UIButton) {
        
            let todayStats = self.navigationController?.viewControllers[0] as! TodayStatsViewController
            if carbText.text != "" && proteinText.text != "" && fatText.text != "" && mealName.text != ""
            {
                todayStats.mealCarbs = carbText.text!;
                todayStats.mealProtein = proteinText.text!;
                todayStats.mealFats = fatText.text!;
                
                
                
                // TODO: NEED TO CHECK FOR letters/numeric
                todayStats.carbs = currentCarbs + Int(carbText.text!)!
                todayStats.prot = currentProtein + Int(proteinText.text!)!
                todayStats.fats = currentFats + Int(fatText.text!)!
                todayStats.mealName = (mealName.text)!
                self.navigationController?.popViewController(animated: true)
            } else {
                createAlert(title: "Invalid Submission", message: "Fill out all elements of form")
            }
        }

}
