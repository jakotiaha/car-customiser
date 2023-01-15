//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Akshat Jakotiah on 15/01/2023.
//

import XCTest

final class CarCustomiserTests: XCTestCase {


    func testNewCarGivesMeACarWithAllAttributesSet() {
        
        let car = Car(make: "Mazda", model: "mx5", topSpeed: 125, acceleration: 7.7, handling: 5)
        //assert
        XCTAssertEqual(car.make, "Mazda")
        XCTAssertEqual(car.model, "mx5")
        XCTAssertEqual(car.topSpeed, 125)
        XCTAssertEqual(car.acceleration, 7.7)
        XCTAssertEqual(car.handling, 5)
    }
}
