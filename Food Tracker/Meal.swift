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
    let photo: UIImage?
    let rating: Int

    // MARK: Constructor

    required init?(name: String, photo: UIImage?, rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
        
        super.init()
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as? String ?? ""
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photoKey) as! UIImage?
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.ratingKey)
        
        self.init(name: name, photo: photo, rating: rating)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.nameKey)
        aCoder.encode(photo, forKey: PropertyKey.photoKey)
        aCoder.encode(rating, forKey: PropertyKey.ratingKey)
    }
    

    override var description: String {
        get {
            return "Meal: \(name), \(rating)*"
        }
    }
}
