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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usersTableView.delegate = self
        usersTableView.dataSource = self
        usersTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UsersCell")
        setlayout()
    }
    
    func setlayout() {
        navigationItem.title = "Main"
        view.backgroundColor = .white
        view.addSubview(usersTableView)
        let guide = view.safeAreaLayoutGuide
        usersTableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        usersTableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        usersTableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        usersTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
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
    
}
