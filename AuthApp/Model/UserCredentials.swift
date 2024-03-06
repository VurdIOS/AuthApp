//
//  User.swift
//  AuthApp
//
//  Created by Камаль Атавалиев on 02.03.2024.
//

import Foundation
struct UserCredentials: Encodable {
    let username: String
    let email: String?
    let password: String
}
