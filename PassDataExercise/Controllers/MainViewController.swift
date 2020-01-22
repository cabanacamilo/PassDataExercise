//
//  MainViewController.swift
//  PassDataExercise
//
//  Created by Camilo Cabana on 21/01/20.
//  Copyright © 2020 Camilo Cabana. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var users = dataBase().users
    
    let usersTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var addButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(addUser))
        return barButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usersTableView.delegate = self
        usersTableView.dataSource = self
        usersTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UsersCell")
        setlayout()
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setlayout() {
        navigationItem.title = "Main"
        navigationItem.rightBarButtonItem = addButton
        view.backgroundColor = .white
        view.addSubview(usersTableView)
        let guide = view.safeAreaLayoutGuide
        usersTableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        usersTableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        usersTableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        usersTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersCell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secundaryViewController = SecundaryViewController()
        secundaryViewController.mainViewController = self
        secundaryViewController.userIndex = indexPath
        navigationController?.pushViewController(secundaryViewController, animated: true)
    }
    
    @objc func addUser() {
        let alert = UIAlertController(title: "New User", message: "please add a new User", preferredStyle: .alert)
        alert.addTextField { (name) in
            name.placeholder = "Name"
            name.textAlignment = .left
        }
        alert.addTextField { (phone) in
            phone.placeholder = "Phone Number"
            phone.textAlignment = .left
        }
        alert.addTextField { (address) in
            address.placeholder = "address"
            address.textAlignment = .left
        }
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
            guard let name = alert.textFields?[0].text else { return }
            guard let phone = alert.textFields?[1].text else { return }
            guard let address = alert.textFields?[2].text else { return }
            if name != "" {
                let newUser = User(name: name, phoneNumber: phone, address: address)
                self.users.append(newUser)
            
            }
            self.usersTableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
}
