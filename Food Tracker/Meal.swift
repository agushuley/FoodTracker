//
//  Meal.swift
//  Food Tracker
//
//  Created by Andriy Gushuley on 24/07/15.
//  Copyright © 2015 gushuley os. All rights reserved.
//

import UIKit

class Meal {
    // MARK: Properties
    
    let name: String
    let photo: UIImage?
    let rating: Int

    // MARK: Constructor

    required init?(name: String, photo: UIImage?, rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
    
}
