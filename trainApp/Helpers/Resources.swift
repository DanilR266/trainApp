//
//  Resources.swift
//  WorkoutApp
//
//  Created by Данила on 12.07.2022.
//

import UIKit

enum Resources {
    enum Colors {
        static var active = UIColor(hexString: "#000000")
        static var inactive = UIColor(hexString: "#000000")
        static var darkGray = UIColor(hexString: "#545C77")

    }
    
    enum Strings {
        enum TabBar {
            static var overview = "Change"
            static var settings = "Main"
        }
    }
    
    enum Fonts {
        static func helvetica(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
