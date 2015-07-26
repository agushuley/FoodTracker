//
//  MealsArchive.swift
//  Food Tracker
//
//  Created by Andriy Gushuley on 26/07/15.
//  Copyright © 2015 gushuley os. All rights reserved.
//

import Foundation

class MealsArchive {
    static private let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static private let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    
    static func loadMeals() -> [Meal] {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(ArchiveURL.path!) as? [Meal] ?? []
    }
    
    static func saveMeals(meals: [Meal]) -> Bool {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(meals, toFile: ArchiveURL.path!)
        
        return isSuccessfulSave
    }
}