//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Akshat Jakotiah on 15/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int = 0 {
        didSet {
            if selectedCar >= starterCars.cars.count {
                selectedCar = 0
            }
        }
    }
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var accelerationPackage = false
    @State private var fuelPackage = false
    @State private var remainingFunds = 1000
    @State private var remainingTime = 30
    @State private var nextCarEnabled = true
    
    var exhaustPackageEnabled: Bool {
        return exhaustPackage ? true : remainingFunds >= 500 ? true : false
    }
    
    
    var tiresPackageEnabled: Bool {
        return tiresPackage ? true : remainingFunds >= 500 ? true : false
    }
    
    var accelerationPackageEnabled: Bool {
        return accelerationPackage ? true : remainingFunds >= 1000 ? true : false
    }
    
    var fuelPackageEnabled: Bool {
        return fuelPackage ? true : remainingFunds >= 500 ? true : false
    }
    
    let timer = Timer.TimerPublisher(interval: 1, runLoop: .main, mode: .common).autoconnect()
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 10
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 10
                    remainingFunds += 500
                }
                
            }
        )
        
        let tiresPackageBinding = Binding<Bool> (
            get: { self.tiresPackage },
            set: { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                    remainingFunds += 500
                }
                
            }
        )
        
        let accelerationPackageBinding = Binding<Bool> (
            get: { self.accelerationPackage },
            set: { newValue in
                self.accelerationPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 1.5
                    remainingFunds -= 1000
                } else {
                    starterCars.cars[selectedCar].acceleration += 1.5
                    remainingFunds += 1000
                }
                
            }
        )
        
        let fuelPackageBinding = Binding<Bool> (
            get: { self.fuelPackage },
            set: { newValue in
                self.fuelPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 2
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 2
                    remainingFunds += 500
                }
                
            }
        )
        VStack {
            Text("\(remainingTime)")
                .onReceive(timer) { _ in
                    if self.remainingTime > 0 {
                        self.remainingTime -= 1
                    }
                    if remainingTime == 0 {
                        exhaustPackage = false
                        tiresPackage = false
                        accelerationPackage = false
                        fuelPackage = false
                        remainingFunds = 0
                        nextCarEnabled = false
                        
                    }
                }
                .foregroundColor(.orange)
            
            Form {
                VStack(alignment: .leading, spacing: 15){
                    Text("\(starterCars.cars[selectedCar].displayStats())")
                    Button("Next Car", action: {
                        selectedCar += 1
                        resetDisplay()
                        
                    })
                    .disabled(!nextCarEnabled)
                }
                Section {
                    Toggle("Exhaust package (Cost: 500)", isOn: exhaustPackageBinding)
                        .disabled(!exhaustPackageEnabled)
                    Toggle("Tires package (Cost: 500)", isOn: tiresPackageBinding)
                        .disabled(!tiresPackageEnabled)
                    Toggle("Acceleration package (Cost: 1000)", isOn: accelerationPackageBinding)
                        .disabled(!accelerationPackageEnabled)
                    Toggle("Fuel package (Cost: 500)", isOn: fuelPackageBinding)
                        .disabled(!fuelPackageEnabled)
                    
                    
                }
            }
            Text("Remaining Funds: \(remainingFunds)")
                .foregroundColor(.orange)
                .baselineOffset(20)
            
            
        }
    }
        
    func resetDisplay(){
            exhaustPackage = false
            tiresPackage = false
            accelerationPackage = false
            fuelPackage = false
            remainingFunds = 1000
            starterCars = StarterCars()
            
        }
    
   
        
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    

//hello
