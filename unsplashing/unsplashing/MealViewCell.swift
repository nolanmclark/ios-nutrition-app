//
//  MealViewCell.swift
//  unsplashing
//
//  Created by Nolan Clark on 6/14/18.
//  Copyright © 2018 NC. All rights reserved.
//

import UIKit

class MealViewCell: UITableViewCell {
    
    @IBOutlet weak var mealName: UILabel!
    
    var mealData: Meal?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mealName.text = mealData?.mealName
    }
}
