
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

class Profile: UIButton {
    lazy var profile = profileStyle()
    
    private func profileStyle() -> UIButton {
        let profile = UIButton()
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.layer.cornerRadius = 35
        profile.backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        return profile
    }
}

class SecondScreenLabel: UILabel {
    lazy var label = labelStyle()
    
    private func labelStyle() -> UILabel {
        let label = UILabel()
//        label.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}

class LabelField: UILabel {
    lazy var label = labelStyle()
    
    private func labelStyle() -> UILabel {
        let label = UILabel()
        label.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}

class SecondScreenField: UIView {
    lazy var field = fieldStyle()
    
    private func fieldStyle() -> UIView {
        let field = UIView(frame: CGRect(x: 200, y: 100, width: 100, height: 50))
        field.layer.cornerRadius = 20
        field.backgroundColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1)
        field.layer.borderWidth = 2
        field.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1).cgColor
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }
}

class Scroll: UIScrollView {
    lazy var scroll = scrollStyle()
    
    private func scrollStyle() -> UIScrollView {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1)
//        scroll.backgroundColor = .green
        return scroll
    }
}






