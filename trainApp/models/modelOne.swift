//
//  modelOne.swift
//  trainApp
//
//  Created by Данила on 26.04.2022.
//

import Foundation
import Metal


enum Fields: CaseIterable {
    case weight
    case food
    case sevingSize
    case calories
}


enum Buttons: CaseIterable {
    case plus
    case minus
    case insert
    case water 
}

class Weight {
//    var weightNow = ViewController().getWeight()
    var date = NSDate()
    var formatter = DateFormatter()
    var lastTen = [String]()
    var defaults = UserDefaults.standard
    var defaultsArray = UserDefaults.standard
    func setW(weightNow: String) {
        print(weightNow, "Set weigth")
        formatter.dateFormat = "dd.MM.YYYY"
        let date2 = formatter.string(from: date as Date)
        let date3 = String(date2)
        defaults.set(weightNow, forKey: "Weight")
       
        
        let lastWeight = weightNow + " - " + date3
        if lastTen.count > 0 && lastTen.count < 10 {
            if weightNow != String(lastTen[lastTen.count-1]) {
                lastTen.append(lastWeight)
            }
        }
        else {
            if lastTen.count == 0 {
                lastTen.append(lastWeight)
            }
            if lastTen.count == 10 {
                for i in 0...8 {
                        lastTen[i] = lastTen[i+1]
                }
                lastTen[9] = lastWeight
            }
        }
        defaultsArray.set(lastTen, forKey: "lastTen")

    }
    func getW() -> String{
        if let stringOne = defaults.string(forKey: "Weight") {
            print(stringOne, "Get weigth")
            return stringOne
        }
        return ""
    }
    func getLastTen() -> Array<Any> {
        if let arrayOne = defaultsArray.array(forKey: "lastTen") {
            return arrayOne
        }
        return [" ", " "]
    }
}

class Goal {
    var defaults = UserDefaults.standard
    func setGoals(goal: String) {
        defaults.set(goal, forKey: "Goal")
    }
    func getGoals() -> String {
        if let stringOne = defaults.string(forKey: "Goal") {
            return stringOne
        }
        return ""
    }
}

class Glass {
    var defaults = UserDefaults.standard
    func setGlass(glass: Int) {
        defaults.set(String(glass), forKey: "Glass")
    }
    func getGlass() -> String {
        if let stringOne = defaults.string(forKey: "Glass") {
            return stringOne
        }
        return "0"
    }
}

class Calories {
    var defaults = UserDefaults.standard
    func setCalories(calories: String) {
        defaults.set(calories, forKey: "Calories")
    }
    func getCalories() -> String {
        if let stringOne = defaults.string(forKey: "Calories") {
            return stringOne
        }
        return ""
    }
}
