
import UIKit
import Foundation



class WeightField: UITextField {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    lazy var weightField = getWeightField()
    
    
    private func getWeightField() -> UITextField {
        let weightFieldStyle = UITextField()
        weightFieldStyle.frame = CGRect(x: 0, y: 126, width: width/2.4 - 2, height: height/13.5 - 2)
        weightFieldStyle.background = UIImage(named: "weight")
        weightFieldStyle.center.x = width / 2
        weightFieldStyle.textAlignment = .center
        weightFieldStyle.keyboardType = .numberPad
        weightFieldStyle.textColor = .gray
        weightFieldStyle.font = .systemFont(ofSize: 24, weight: .semibold)
        return weightFieldStyle
    }
}

class Button: UIButton {
    let padding = 20
    var image = String()
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    lazy var button = buttonStyle()
    
    private func buttonStyle() -> UIButton {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: image), for: .normal)
        button.frame = CGRect(x: 10.0, y: 10.0, width: width/5.2, height: height/11.25)
        
        
        return button
    }

}

class LabelWeight: UILabel {
    var textLabel = String()
    var posY = CGFloat()
    lazy var label = labelStyle()
    private func labelStyle() -> UILabel {
        let labelStyle = UILabel()
        labelStyle.text = textLabel
        labelStyle.font = .systemFont(ofSize: 24, weight: .bold)
        labelStyle.frame = CGRect(x: 0, y: posY, width: 235, height: 29)
        labelStyle.textColor = .black
        labelStyle.textAlignment = .center
        return labelStyle
    }
}

class CaloriesField: UITextField {
    
    lazy var calField = calories()
    private func calories() -> UITextField {
        let calField = UITextField()
        calField.translatesAutoresizingMaskIntoConstraints = false
        calField.background = UIImage(named: "weight")
        calField.textColor = .gray
        calField.font = .systemFont(ofSize: 14, weight: .medium)
        calField.returnKeyType = UIReturnKeyType.done
        return calField
    }
}

class LabelCalories: UILabel {
    lazy var label = labelStyle()
    private func labelStyle() -> UILabel {
        let labelStyle = UILabel()
        labelStyle.translatesAutoresizingMaskIntoConstraints = false
        labelStyle.font = .systemFont(ofSize: 14, weight: .medium)
        labelStyle.textColor = .black
        return labelStyle
    }
}


class ButtonDone: UIButton {
    lazy var button = buttonStyle()
    var image = String()
    private func buttonStyle() -> UIButton {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: image), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}

