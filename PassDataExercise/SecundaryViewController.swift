//
//  SecundaryViewController.swift
//  PassDataExercise
//
//  Created by Camilo Cabana on 4/01/20.
//  Copyright © 2020 Camilo Cabana. All rights reserved.
//

import UIKit

class SecundaryViewController: UIViewController {
    
    var myData = String()
    var mainViewController: MainViewController?

    let dataLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .label
        label.text = "0 Members"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let passDataTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.placeholder = "Write any thing!!"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let passDataButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pass Data (Properties)", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let passDataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        navigationItem.title = "Secundary ViewController"
        dataLabel.text = myData
        passDataButton.addTarget(self, action: #selector(passDataWithProperties), for: .touchUpInside)
    }
    
    func setLayout() {
        view.addSubview(passDataStackView)
        view.addSubview(dataLabel)
        view.backgroundColor = .systemBackground
        let guide = view.safeAreaLayoutGuide
        passDataStackView.addArrangedSubview(passDataTextField)
        passDataStackView.addArrangedSubview(passDataButton)
        passDataStackView.topAnchor.constraint(equalTo: dataLabel.bottomAnchor, constant: 20).isActive = true
        passDataStackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10).isActive = true
        passDataStackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10).isActive = true
        dataLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20).isActive = true
        dataLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
    }
    
    @objc func passDataWithProperties(_ sender: UIButton) {
        if passDataTextField.text != "" {
            mainViewController?.onUserAction(data: passDataTextField.text!)
            passDataTextField.text = ""
        } else {
            let alert = UIAlertController(title: "Hello!!", message: "Write something please", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true)
        }
    }

}
