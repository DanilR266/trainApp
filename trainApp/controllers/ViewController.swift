//
//  ViewController.swift
//  trainApp
//
//  Created by Данила on 26.04.2022.
//

import UIKit

class ViewController: UIViewController {
    lazy var viewFrame = WeightField()
    lazy var field = WeightField()
    lazy var buttonMinus = Button()
    lazy var buttonPlus = Button()
    lazy var labelText = LabelWeight()
    lazy var caloriesText = LabelWeight()
    lazy var foodField = CaloriesField()
    lazy var servingField = CaloriesField()
    lazy var perServe = CaloriesField()
    lazy var labelFood = LabelCalories()
    lazy var labelServing = LabelCalories()
    lazy var labelPerServe = LabelCalories()
    lazy var buttonDone = ButtonDone()
    lazy var waterText = LabelWeight()
    lazy var subLabelWater = LabelCalories()
    lazy var buttonWater = ButtonDone()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonMinus.image = "-"
        buttonPlus.image = "+"
        buttonMinus.button.center.x = field.weightField.center.x - 120
        buttonMinus.button.center.y = field.weightField.center.y
        buttonPlus.button.center.x = field.weightField.center.x + 120
        buttonPlus.button.center.y = field.weightField.center.y
        
        labelText.label.center.x = field.weightField.center.x
        labelText.label.text = "Your weight today"
        labelText.label.frame.origin.y = 68.0
        
        caloriesText.label.text = "Calories"
        caloriesText.label.textAlignment = .left
        caloriesText.label.frame = CGRect(x: 26.0, y: 217.0, width: 103, height: 29)
        
        labelFood.label.text = "Food"
        labelServing.label.text = "Serving size, g"
        labelPerServe.label.text = "Per serve, kcal"
        servingField.calField.keyboardType = .numberPad
        perServe.calField.keyboardType = .numberPad
        
        waterText.label.text = "Water"
        waterText.label.translatesAutoresizingMaskIntoConstraints = false
        subLabelWater.label.text = "Tap to add a glass"
        
        buttonDone.image = "button"
        buttonWater.image = "water"
        
        
    


        
        mainView(view: view)
        buttonMinus.button.addTarget(nil, action: #selector(buttonMinusPressed(_:)), for: .touchUpInside)
        buttonPlus.button.addTarget(nil, action: #selector(buttonPlusPressed(_:)), for: .touchUpInside)
        view.addSubview(field.weightField)
        view.addSubview(buttonMinus.button)
        view.addSubview(buttonPlus.button)
        view.addSubview(labelText.label)
        view.addSubview(caloriesText.label)
        view.addSubview(foodField.calField)
        view.addSubview(servingField.calField)
        view.addSubview(perServe.calField)
        view.addSubview(labelFood.label)
        view.addSubview(labelServing.label)
        view.addSubview(labelPerServe.label)
        view.addSubview(buttonDone.button)
        view.addSubview(waterText.label)
        view.addSubview(subLabelWater.label)
        view.addSubview(buttonWater.button)
        
        labelsFields()
        setUpButtonDone()
        setUpFields(buttonDone.button, waterText.label, 110, 78, 29, 26)
        setUpFields(waterText.label, subLabelWater.label, 40, 130, 17, 30)
        setUpBtnWater()
        
        
        
//        setUpFields(caloriesText.label, foodField.calField, 40)
//        setUpFields(foodField.calField, servingField.calField, 40)
//        setUpFields(foodField.calField, perServe.calField, 40)
    }

    
    private func mainView(view: UIView) {
        let vectorWhite = UIImage(named: "Vector1")
        let bgImage = UIImageView(image: vectorWhite)
        let vectorBlue = UIImage(named: "Vector2")
        let bgImage2 = UIImageView(image: vectorBlue)
        bgImage2.translatesAutoresizingMaskIntoConstraints = false
        bgImage.translatesAutoresizingMaskIntoConstraints = false

//        bgImage.transform = bgImage.transform.rotated(by: .pi*7 / 4)
//        bgImage2.transform = bgImage2.transform.rotated(by: .pi*7 / 4)
        view.addSubview(bgImage)
        view.addSubview(bgImage2)
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        
        
        setUpVectors(bgImage, topPadding: viewFrame.height/2 - viewFrame.height/6.8 - 35)
        print(viewFrame.height)
        setUpVectors(bgImage2, topPadding: viewFrame.height/2 - viewFrame.height/6.8)

    }
    
    @objc func buttonMinusPressed(_ sender: UIButton){
        var intText = Decimal()
        if var text = field.weightField.text {
            text = text.replacingOccurrences(of: ",", with: ".", options: .literal, range: nil)
            intText = Decimal(string: text) ?? 0
        }
        (intText > 0) ? (intText -= 0.1) : (intText = 0)
        var finalStr = "\(intText)"
        finalStr = finalStr.replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
        field.weightField.text = finalStr
//        UIButton.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {self.buttonAnimation()})
        
    }
    
    
    @objc func buttonPlusPressed(_ sender: UIButton){
        var intText = Decimal()
        
        if var text = field.weightField.text {
            text = text.replacingOccurrences(of: ",", with: ".")
            intText = Decimal(string: text) ?? 0
        }
        intText += 0.1
        var finalStr = "\(intText)"
        finalStr = finalStr.replacingOccurrences(of: ".", with: ",")
        field.weightField.text = finalStr
//        UIButton.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {self.buttonAnimation()})
    }
    
    
    
    private func buttonAnimation() -> Void {
        buttonMinus.button.transform = buttonMinus.button.transform.rotated(by: .pi)
    }
    
    private func setUpFields(_ previousField: AnyObject, _ field: AnyObject, _ padding: CGFloat, _ width: CGFloat, _ height: CGFloat, _ paddinfLeft: CGFloat) {
        field.leftAnchor.constraint(equalTo: view.leftAnchor, constant: paddinfLeft).isActive = true
        field.widthAnchor.constraint(equalToConstant: width).isActive = true
        field.heightAnchor.constraint(equalToConstant: height).isActive = true
        field.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = false
        field.topAnchor.constraint(equalTo: previousField.topAnchor, constant: padding).isActive = true
    }
    
    private func setUpButtonDone() {
        buttonDone.button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonDone.button.heightAnchor.constraint(equalToConstant: viewFrame.height/7.2-10).isActive = true
        buttonDone.button.widthAnchor.constraint(equalToConstant: viewFrame.height/7.2-10).isActive = true
        buttonDone.button.topAnchor.constraint(equalTo: perServe.calField.topAnchor, constant: 58).isActive = true
        
    }
    
    private func setUpBtnWater() {
        buttonWater.button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonWater.button.heightAnchor.constraint(equalToConstant: viewFrame.width/3.4).isActive = true
        buttonWater.button.widthAnchor.constraint(equalToConstant: viewFrame.width/3.4).isActive = true
        buttonWater.button.topAnchor.constraint(equalTo: subLabelWater.label.topAnchor, constant: 44).isActive = true
    }
    
    private func setUpVectors(_ viewNow: AnyObject, topPadding: CGFloat) {
        viewNow.widthAnchor.constraint(equalToConstant: viewFrame.width).isActive = true
        viewNow.heightAnchor.constraint(equalToConstant: viewFrame.height/6.8).isActive = true
        viewNow.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewNow.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        viewNow.topAnchor?.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: topPadding).isActive = true
//        viewNow.leadingAnchor?.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 90).isActive = true
    }
    
    private func labelsFields() {
        setUpFields(caloriesText.label, labelFood.label, view.frame.width/25 + 30, 37, 17, 36)
        setUpFields(labelFood.label, foodField.calField, 25, viewFrame.width/1.15, viewFrame.height/21.3, 26)
        setUpFields(foodField.calField, labelServing.label, 58, 104, 17, 36)
        setUpFields(labelServing.label, servingField.calField, 25, viewFrame.width/1.15, viewFrame.height/21.3, 26)
        setUpFields(servingField.calField, labelPerServe.label, 58, 104, 17, 36)
        setUpFields(labelPerServe.label, perServe.calField, 25, viewFrame.width/1.15, viewFrame.height/21.3, 26)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


