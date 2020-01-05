//
//  ViewController.swift
//  PassDataExercise
//
//  Created by Camilo Cabana on 4/01/20.
//  Copyright © 2020 Camilo Cabana. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, PassDataDelegate {
    
    func passData(data: String) {
        print("my data")
    }
    
    
    let secundaryViewController = SecundaryViewController()
    var users = [String]()
    
    let dataLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .label
        label.text = "Hello"
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
        button.backgroundColor = .red
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
    
    let showButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show Data", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setlayout()
//        properties
        secundaryViewController.mainViewController = self
//        delegate
        secundaryViewController.delegate = self
        navigationItem.title = "Main ViewController"
        passDataButton.addTarget(self, action: #selector(passDataWithProperties), for: .touchUpInside)
        showButton.addTarget(self, action: #selector(showAll), for: .touchUpInside)
    }
    
    func setlayout() {
        view.addSubview(passDataStackView)
        view.addSubview(dataLabel)
        view.addSubview(showButton)
        let guide = view.safeAreaLayoutGuide
        passDataStackView.addArrangedSubview(passDataTextField)
        passDataStackView.addArrangedSubview(passDataButton)
        passDataStackView.topAnchor.constraint(equalTo: dataLabel.bottomAnchor, constant: 20).isActive = true
        passDataStackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10).isActive = true
        passDataStackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10).isActive = true
        dataLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20).isActive = true
        dataLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        showButton.topAnchor.constraint(equalTo: passDataStackView.bottomAnchor, constant: 20).isActive = true
        showButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10).isActive = true
        showButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10).isActive = true
    }
    
    @objc func passDataWithProperties(_ sender: UIButton) {
        if passDataTextField.text != "" {
            secundaryViewController.myData = passDataTextField.text!
            passDataTextField.text = ""
            navigationController?.pushViewController(secundaryViewController, animated: true)
        } else {
            let alert = UIAlertController(title: "Hello!!", message: "Write something please", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
    
    @objc func showAll(_ sender: UIButton) {
        print(users)
    }
    
    func onUserAction(data: String){
        users.append(data)
        print(users)
    }

}

protocol PassDataDelegate {
    func passData(data: String)
}

