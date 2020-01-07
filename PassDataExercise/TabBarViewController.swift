//
//  TabBarViewController.swift
//  PassDataExercise
//
//  Created by Camilo Cabana on 7/01/20.
//  Copyright © 2020 Camilo Cabana. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    var value = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    func setTabBar() {
        let mainViewController = UINavigationController(rootViewController: AddViewController())
        mainViewController.tabBarItem.title = "Add"
        mainViewController.tabBarItem.image = UIImage(systemName: "plus")
        let secundaryViewController = UINavigationController(rootViewController: SubstractViewController())
        secundaryViewController.tabBarItem.title = "Substrat"
        secundaryViewController.tabBarItem.image = UIImage(systemName: "minus")
        viewControllers = [mainViewController, secundaryViewController]
    }

}
