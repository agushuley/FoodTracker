//
//  MealTableViewCell.swift
//  Food Tracker
//
//  Created by Andriy Gushuley on 24/07/15.
//  Copyright © 2015 gushuley os. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    // MARK: Properties

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ratingControl: RatingControl!
    @IBOutlet private weak var mealImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayMeal(meal: Meal) {
        nameLabel.text = meal.name
        mealImage.image = meal.photo
        ratingControl.rating = meal.rating
    }

}
