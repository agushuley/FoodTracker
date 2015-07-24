//
//  Food_TrackerTests.swift
//  Food TrackerTests
//
//  Created by Andriy Gushuley on 22/07/15.
//  Copyright © 2015 gushuley os. All rights reserved.
//

import XCTest
@testable import Food_Tracker

class Food_TrackerTests: XCTestCase {
    // MARK: FoodTracker Tests    
    
    // Tests to confirm that the Meal initializer returns when no name or a negative rating is provided.
    func testMealInitialization() {
        let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)

        let nilItem1 = Meal(name: "", photo: nil, rating: 5)
        XCTAssertNil(nilItem1)

        let nilItem2 = Meal(name: "-1 rating", photo: nil, rating: -1)
        XCTAssertNil(nilItem2)
    }
}
