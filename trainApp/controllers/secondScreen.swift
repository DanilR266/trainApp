//
//  secondScreen.swift
//  trainApp
//
//  Created by Данила on 14.05.2022.
//

import Foundation
import UIKit


class secondScreen: UIViewController {
    lazy var viewFrame = WeightField()
    lazy var profile = Profile()
    lazy var fieldWeight = SecondScreenField()
    lazy var fieldGoal = SecondScreenField()
    lazy var fieldLast = SecondScreenField()
    lazy var fieldCalories = SecondScreenField()
    lazy var fieldGlasses = SecondScreenField()
    lazy var fieldMeals = SecondScreenField()
    
    lazy var labelWeight = SecondScreenLabel()
    lazy var labelGoal = SecondScreenLabel()
    lazy var labelLast = SecondScreenLabel()
    lazy var labelCalories = SecondScreenLabel()
    lazy var labelGlasses = SecondScreenLabel()
    lazy var labelMeals = SecondScreenLabel()
    
    lazy var labelFWeight = LabelField()
    lazy var labelFGoal = LabelField()
    lazy var labelFGlass = LabelField()
    lazy var labelFCalories = LabelField()
    lazy var labelFLastTen = LabelField()
    
    lazy var scroll = Scroll()
    
    let weightModel = Weight()
    let goalModel = Goal()
    let glassModel = Glass()
    let caloriesModel = Calories()
    let lastTen = Weight()
    
    let k = UILabel()
    
    

    
    override func viewDidLoad() {
        view.addSubview(profile.profile)

        fieldsOnView()
        labelsOnView()
        setUpLabelOnField()
        view.addSubview(scroll.scroll)
        setUpScroll()


        
    }
    
    private func setUpProfile() {
        profile.profile.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        profile.profile.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        profile.profile.widthAnchor.constraint(equalToConstant: viewFrame.width/5.7).isActive = true
        profile.profile.heightAnchor.constraint(equalToConstant: viewFrame.width/5.7).isActive = true
    }
    
    private func viewLogo(view: UIView) {
        let bglogo = UIImage(named: "logo")
        let logo = UIImageView(image: bglogo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logo)
        logo.widthAnchor.constraint(equalToConstant: viewFrame.width/3.53).isActive = true
        logo.heightAnchor.constraint(equalToConstant: viewFrame.height/19.56).isActive = true
        logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 85).isActive = true
        logo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
    }
    
    private func setUpFields(field: AnyObject, previous: AnyObject, width: CGFloat, height: CGFloat, topConstant: CGFloat, padding: CGFloat) {
        field.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: topConstant).isActive = true
        field.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding).isActive = true
        field.widthAnchor.constraint(equalToConstant: width).isActive = true
        field.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    private func fieldsOnView() {
        view.addSubview(fieldWeight.field)
        view.addSubview(fieldGoal.field)
        view.addSubview(fieldLast.field)
        view.addSubview(fieldGlasses.field)
        view.addSubview(fieldCalories.field)
        view.addSubview(fieldMeals.field)
        viewLogo(view: view)
        setUpFields(field: fieldWeight.field, previous: profile.profile, width: 130, height: 66, topConstant: 86, padding: 30)
        setUpFields(field: fieldGoal.field, previous: profile.profile, width: 130, height: 66, topConstant: 86, padding: viewFrame.width - 160)
        setUpFields(field: fieldLast.field, previous: fieldGoal.field, width: viewFrame.width - 60, height: 105, topConstant: 60, padding: 30)
        setUpFields(field: fieldCalories.field, previous: fieldLast.field, width: 130, height: 66, topConstant: 60, padding: 30)
        setUpFields(field: fieldGlasses.field, previous: fieldLast.field, width: 130, height: 66, topConstant: 60, padding: viewFrame.width - 160)
        setUpProfile()
        setUpFields(field: fieldMeals.field, previous: fieldGlasses.field, width: viewFrame.width - 60, height: 105, topConstant: 60, padding: 30)
    }
    
    
    private func setUpLabels(label: AnyObject, previous: AnyObject) {
        label.bottomAnchor.constraint(equalTo: previous.topAnchor, constant: -10).isActive = true
        label.centerXAnchor.constraint(equalTo: previous.centerXAnchor).isActive = true
        
    }
    
    private func labelsOnView() {
        labelWeight.label.text = "Weight"
        view.addSubview(labelWeight.label)
        setUpLabels(label: labelWeight.label, previous: fieldWeight.field)
        labelGoal.label.text = "Goal"
        view.addSubview(labelGoal.label)
        setUpLabels(label: labelGoal.label, previous: fieldGoal.field)
        labelLast.label.text = "Last 10 changes"
        view.addSubview(labelLast.label)
        setUpLabels(label: labelLast.label, previous: fieldLast.field)
        labelCalories.label.text = "Calories"
        view.addSubview(labelCalories.label)
        setUpLabels(label: labelCalories.label, previous: fieldCalories.field)
        labelGlasses.label.text = "Glasses"
        view.addSubview(labelGlasses.label)
        setUpLabels(label: labelGlasses.label, previous: fieldGlasses.field)
        labelMeals.label.text = "Meals today, g"
        view.addSubview(labelMeals.label)
        setUpLabels(label: labelMeals.label, previous: fieldMeals.field)
    }
    
    private func setUpText(text: AnyObject, previous: AnyObject) {
        text.centerXAnchor.constraint(equalTo: previous.centerXAnchor).isActive = true
        text.centerYAnchor.constraint(equalTo: previous.centerYAnchor).isActive = true
    }
    
    private func setUpLabelOnField() {
        labelFWeight.label.text = weightModel.getW()
        view.addSubview(labelFWeight.label)
        setUpText(text: labelFWeight.label, previous: fieldWeight.field)
        if goalModel.getGoals() != "" {
            labelFGoal.label.text = goalModel.getGoals()
        }
        else {
            labelFGoal.label.text = "Not Set"
        }
        view.addSubview(labelFGoal.label)
        setUpText(text: labelFGoal.label, previous: fieldGoal.field)
        labelFGlass.label.text = glassModel.getGlass()
        view.addSubview(labelFGlass.label)
        setUpText(text: labelFGlass.label, previous: fieldGlasses.field)
        if caloriesModel.getCalories() != "" {
            labelFCalories.label.text = caloriesModel.getCalories()
        }
        else {
            labelFCalories.label.text = "Not Set"
        }
        view.addSubview(labelFCalories.label)
        setUpText(text: labelFCalories.label, previous: fieldCalories.field)
        let arrayLast = lastTen.getLastTen()
        labelFLastTen.label.text = "\((arrayLast[0] as! String))"
        labelFLastTen.label.numberOfLines = arrayLast.count
        print(arrayLast.count)
        view.addSubview(labelFLastTen.label)
        setUpText(text: labelFLastTen.label, previous: fieldLast.field)

    }
    
    private func setUpScroll() {
        scroll.scroll.centerXAnchor.constraint(equalTo: fieldLast.field.centerXAnchor).isActive = true
        scroll.scroll.centerYAnchor.constraint(equalTo: fieldLast.field.centerYAnchor).isActive = true
        scroll.scroll.widthAnchor.constraint(equalToConstant: viewFrame.width - 70).isActive = true
        scroll.scroll.heightAnchor.constraint(equalToConstant: 63).isActive = true
        scroll.scroll.contentSize = CGSize(width: 125, height: 1000)
    }
    
}
