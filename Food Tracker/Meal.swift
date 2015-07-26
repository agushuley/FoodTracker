//
//  Meal.swift
//  Food Tracker
//
//  Created by Andriy Gushuley on 24/07/15.
//  Copyright © 2015 gushuley os. All rights reserved.
//

import UIKit

class Meal: NSObject, NSCoding {
    // MARK: Properties
    
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    
    let name: String
    let photo: UIImage
    let rating: Int

    // MARK: Constructor

    required init?(name: String, photo: UIImage, rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
        
        super.init()
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as? String ?? ""
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as! UIImage
        let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
        
        self.init(name: name, photo: photo, rating: rating)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)
    }
    

    override var description: String {
        get {
            return "Meal: \(name), \(rating)*"
        }
    }
}
