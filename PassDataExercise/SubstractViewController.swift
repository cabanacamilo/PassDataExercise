//
//  SecundaryViewController.swift
//  PassDataExercise
//
//  Created by Camilo Cabana on 4/01/20.
//  Copyright © 2020 Camilo Cabana. All rights reserved.
//

import UIKit

class SubstractViewController: UIViewController {
    
    let valueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let substractButton: UIButton = {
        let button = UIButton()
        button.setTitle("Substract", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        navigationItem.title = "Substract ViewController"
        substractButton.addTarget(self, action: #selector(substractValue), for: .touchUpInside)
    }
    
    func setLayout() {
        view.backgroundColor = .systemBackground
        view.addSubview(valueLabel)
        view.addSubview(substractButton)
        valueLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        valueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        substractButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        substractButton.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 10).isActive = true
    }
    
    @objc func substractValue(_ sender: UIButton) {
        let tabBar = tabBarController as! TabBarViewController
        tabBar.value = tabBar.value - 1
        valueLabel.text = String(tabBar.value)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let tabBar = tabBarController as! TabBarViewController
        valueLabel.text = String(tabBar.value)
    }

}
