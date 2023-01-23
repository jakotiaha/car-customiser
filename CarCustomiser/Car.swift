//
//  Car.swift
//  CarCustomiser
//
//  Created by Akshat Jakotiah on 15/01/2023.
//

import Foundation

struct Car {
    var make: String
    var model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func displayStats() -> String{
        return """
           Make: \(make)
           Model: \(model)
           Top speed: \(topSpeed)mph
           Acceleration(0-60): \(acceleration)s
           Handling: \(handling)
           """

    }
}

//hello

