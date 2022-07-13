//
//  NavBarController.swift
//  WorkoutApp
//
//  Created by Данила on 13.07.2022.
//

import UIKit

final class NavBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: Resources.Colors.darkGray,
            .font: Resources.Fonts.helvetica(with: 34)
        ]
    }
}
