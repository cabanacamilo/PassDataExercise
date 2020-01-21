//
//  SecundaryViewController.swift
//  PassDataExercise
//
//  Created by Camilo Cabana on 21/01/20.
//  Copyright © 2020 Camilo Cabana. All rights reserved.
//

import UIKit

class SecundaryViewController: UIViewController {
    
    var userIndex = IndexPath()
    var mainViewController: MainViewController?
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.borderStyle = .line
        return textField
    }()
    
    let addressTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.borderStyle = .line
        return textField
    }()
    
    let phoneTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.borderStyle = .line
        return textField
    }()
    
    let editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = mainViewController?.users[userIndex.row].name
        phoneTextField.text = mainViewController?.users[userIndex.row].phoneNumber
        addressTextField.text = mainViewController?.users[userIndex.row].address
        setLayout()
        editButton.addTarget(self, action: #selector(editInfo), for: .touchUpInside)
    }
    
    func setLayout() {
        navigationItem.title = "Secundary"
        view.backgroundColor = .white
        view.addSubview(infoStackView)
        infoStackView.addArrangedSubview(nameTextField)
        infoStackView.addArrangedSubview(phoneTextField)
        infoStackView.addArrangedSubview(addressTextField)
        infoStackView.addArrangedSubview(editButton)
        let guide = view.safeAreaLayoutGuide
        infoStackView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10).isActive = true
        infoStackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10).isActive = true
        infoStackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10).isActive = true
    }
    
    @objc func editInfo() {
        mainViewController?.users[userIndex.row].name = nameTextField.text ?? ""
        mainViewController?.users[userIndex.row].phoneNumber = phoneTextField.text ?? ""
        mainViewController?.users[userIndex.row].address = addressTextField.text ?? ""
        navigationController?.popViewController(animated: true)
        dismiss(animated: true) {
            self.mainViewController?.usersTableView.reloadData()
        }
    }
}
