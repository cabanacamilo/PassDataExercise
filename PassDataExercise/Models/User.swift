//
//  User.swift
//  PassDataExercise
//
//  Created by Camilo Cabana on 21/01/20.
//  Copyright © 2020 Camilo Cabana. All rights reserved.
//

import Foundation

struct User {
    var name: String
    var phoneNumber: String
    var address: String
}

class dataBase {
    
    let users: [User] = {
        return [User(name: "Camilo", phoneNumber: "0870991104", address: "1-2-3 test"), User(name: "Minami", phoneNumber: "08011223344", address: "2-1-1 test")]
    }()
}
