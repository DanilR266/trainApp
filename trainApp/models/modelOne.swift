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
    var lastTen = [String]()
    var defaults = UserDefaults.standard
    func setW(weightNow: String) {
        defaults.set(weightNow, forKey: "Weight")
        lastTen.append(weightNow)
//        lazy var lastTenSet = Set<String>(lastTen)
//        lastTen = Array(lastTenSet)
    }
    func getW() -> String{
        if let stringOne = defaults.string(forKey: "Weight") {
            print(lastTen)
            return stringOne
        }
        return ""
    }
}
