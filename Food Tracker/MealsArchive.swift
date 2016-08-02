//
//  MealsArchive.swift
//  Food Tracker
//
//  Created by Andriy Gushuley on 26/07/15.
//  Copyright © 2015 gushuley os. All rights reserved.
//

import Foundation

public class MealsArchive {
    static private let DocumentsDirectory = FileManager().urlsForDirectory(.documentDirectory, inDomains: .userDomainMask).first!
    static private let ArchiveURL = try! DocumentsDirectory.appendingPathComponent("meals")
    
    static func loadMeals() -> [Meal] {
        return NSKeyedUnarchiver.unarchiveObject(withFile: ArchiveURL.path!) as? [Meal] ?? []
    }
    
    static func saveMeals(_ meals: [Meal]) -> Bool {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(meals, toFile: ArchiveURL.path!)
        
        return isSuccessfulSave
    }
}
