//
//  TabBarController.swift
//  WorkoutApp
//
//  Created by Данила on 12.07.2022.
//

import UIKit

enum Tabs: Int {
    case overview
    case session
    case progress
    case settings
}


final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        tabBar.tintColor = Resources.Colors.active
        tabBar.barTintColor = Resources.Colors.inactive
        tabBar.backgroundColor = .gray
        
        tabBar.layer.borderWidth = 2
        
        let overviewController = ViewController()
        let settingsController = SecondScreen()
        
        let overviewNavController = UINavigationController(rootViewController: overviewController)
        let settingsNavController = UINavigationController(rootViewController: settingsController)
        
        overviewNavController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.overview, image: nil, tag: Tabs.overview.rawValue)
        settingsNavController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.settings, image: nil, tag: Tabs.session.rawValue)
        
        
        setViewControllers([
            overviewNavController,
            settingsNavController
        ], animated: false)
        
        
    }
}
