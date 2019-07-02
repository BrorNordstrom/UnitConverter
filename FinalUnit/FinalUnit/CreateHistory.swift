//
//  CreateHistory.swift
//  FinalUnit
//
//  Created by Bror Andreas Nordstrom on 15/03/2019.
//  Copyright © 2019 Bror Andreas Nordstrom. All rights reserved.
//

import UIKit

struct User_Default{
    static let weight = "weight"
   static let temperature = "Temperature"
   static let volume = "Volume"
    static let length = "Length"
    static let speed = "Speed"
}

class CreateHistory: NSObject {
    
    var weightHistory = [[String:String]]()
    var temperatureHistory = [[String:String]]()
    var volumeHistory = [[String:String]]()
    var lengthHistory = [[String:String]]()
    var speedHistory = [[String:String]]()
    
    // creating weight History
    
    func createWeightHistory(kgValue:String, gramsValue: String, ouncesValue: String, poundsValue: String, stoneValue: String, poundValue: String) {
        
        if let array = UserDefaults.standard.value(forKey: User_Default.weight) as? [[String:String]] {
            weightHistory = array
            
        }
    //Weight calculations are stored in a JSON format and is then stored in an array of objects
        let weight = ["Kilograms":kgValue, "Grams":gramsValue, "Ounces":ouncesValue, "Pounds":poundsValue, "Stone":stoneValue, "Pound":poundValue]
        // making sure weight cant be more than 5
        if self.weightHistory.count >= 5 {
            
            // removes the first once more than 5 has been entered
            weightHistory.remove(at: 0)
        }
        //The Object is then appended to the array of objects
        weightHistory.append(weight)
        //The array is then appended to UserDefaults
        UserDefaults.standard.set(weightHistory, forKey: User_Default.weight)
        
    }
    
    // function to create temperature history
    
    func createTemperatureHistory(celsiusValue:String, fahrenheitValue:String, kelvinValue:String) {
        if let array = UserDefaults.standard.value(forKey: User_Default.temperature) as? [[String:String]] {
            temperatureHistory = array
        }
        
        let temperature = ["Celsius":celsiusValue, "Fahrenheit": fahrenheitValue, "Kelvin": kelvinValue]
        //Once a JSON object is created, The array removes the oldest entry before appending the new value to the array
        if self.temperatureHistory.count >= 5 {
            temperatureHistory.remove(at: 0)
        }
        temperatureHistory.append(temperature)
        UserDefaults.standard.set(temperatureHistory, forKey: User_Default.temperature)
    }
    
    // function to create Volume History
    
    func createVolumeHistory(gallonValue:String, litreValue:String, ukPintValue:String, fluidOunceValue:String, mLitreValue:String){
        
        if let array = UserDefaults.standard.value(forKey: User_Default.volume) as? [[String:String]] {
            volumeHistory = array
            
    }
        let volume = ["Gallon":gallonValue, "Litre":litreValue, "Uk Pint":ukPintValue, "Fluid Ounce":fluidOunceValue, "Millilitre":mLitreValue]
        // making sure weight cant be more than 5
        if self.volumeHistory.count >= 5 {
            
            // removes the first one more than 5 has been entered
            volumeHistory.remove(at: 0)
    
        }
        volumeHistory.append(volume)
        UserDefaults.standard.set(volumeHistory, forKey: User_Default.volume)
}
    
    // functions to create Length history
    
    func createLengthHistory(metreValue:String, mileValue:String, cmValue:String, mmValue:String, yardValue:String, inchValue:String){
        
        if let array = UserDefaults.standard.value(forKey: User_Default.length) as? [[String:String]] {
            lengthHistory = array
            
        }
        let length = ["Metre":metreValue, "Mile":mileValue, "Cm":cmValue, "Mm":mmValue, "Yard":yardValue, "Inch":inchValue]
        // making sure weight cant be more than 5
        if self.lengthHistory.count >= 5 {
            
            // removes the first once more than 5 has been entered
            lengthHistory.remove(at: 0)
            
        }
        lengthHistory.append(length)
        UserDefaults.standard.set(lengthHistory, forKey: User_Default.length)
    }
    
    // function to create speed history
    
    func createSpeedHistory(mSecondsValue:String, kmHValue:String, milesHourValue:String, nauticalMphValue:String){
        
        if let array = UserDefaults.standard.value(forKey: User_Default.speed) as? [[String:String]] {
            speedHistory = array
            
        }
        let speed = ["Metres/s":mSecondsValue, "Km/h":kmHValue, "Miles/h":milesHourValue, "Nautical Miles/h":nauticalMphValue]
        // making sure weight cant be more than 5
        if self.speedHistory.count >= 5 {
            
            // removes the first once more than 5 has been entered
            speedHistory.remove(at: 0)
            
        }
        speedHistory.append(speed)
        //The array is appended to User defaults and is assigned a key that can be referred to when loading the stored values
        UserDefaults.standard.set(speedHistory, forKey: User_Default.speed)
    }
}
