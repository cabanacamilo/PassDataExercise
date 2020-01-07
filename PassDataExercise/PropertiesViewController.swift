//
//  PropertiesViewController.swift
//  PassDataExercise
//
//  Created by Camilo Cabana on 7/01/20.
//  Copyright © 2020 Camilo Cabana. All rights reserved.
//

import UIKit

class PropertiesViewController: UIViewController {
    
    var value = 0
    var addViewController: AddViewController?
    
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
        view.backgroundColor = .red
        setLayout()
        navigationItem.title = "Substract ViewController"
        substractButton.addTarget(self, action: #selector(substractValue), for: .touchUpInside)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        value = value - 1
        valueLabel.text = String(value)
        addViewController?.passDataFromProperties(value: value)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        valueLabel.text = String(value)
    }
    

}
