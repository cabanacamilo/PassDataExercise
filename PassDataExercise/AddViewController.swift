//
//  ViewController.swift
//  PassDataExercise
//
//  Created by Camilo Cabana on 4/01/20.
//  Copyright © 2020 Camilo Cabana. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    let propertiesViewController = PropertiesViewController()
    
    let valueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var substractButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(title: "Sub", style: UIBarButtonItem.Style.plain, target: self, action: #selector(goToPrint))
        return barButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        propertiesViewController.addViewController = self
        navigationItem.title = "Add ViewController"
        navigationItem.rightBarButtonItem = substractButton
        addButton.addTarget(self, action: #selector(addValue), for: .touchUpInside)
    }
    
    func setLayout() {
        view.backgroundColor = .systemBackground
        view.addSubview(valueLabel)
        view.addSubview(addButton)
        valueLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        valueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addButton.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 10).isActive = true
    }
    
    @objc func addValue(_ sender: UIButton) {
        let tabBar = tabBarController as! TabBarViewController
        tabBar.value = tabBar.value + 1
        valueLabel.text = String(tabBar.value)
    }
    
    @objc func goToPrint(_ sender: UIBarButtonItem) {
        let tabBar = tabBarController as! TabBarViewController
        propertiesViewController.value = tabBar.value
        navigationController?.pushViewController(propertiesViewController, animated: true)
    }
    
    func passDataFromProperties(value: Int) {
        let tabBar = tabBarController as! TabBarViewController
        tabBar.value = value
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let tabBar = tabBarController as! TabBarViewController
        valueLabel.text = String(tabBar.value)
    }

}

