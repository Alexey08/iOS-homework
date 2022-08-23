//
//  User.swift
//  Navigation
//
//  Created by Алексей Уланов on 03.08.2022.
//

import Foundation
import UIKit

public protocol UserService {
    
    func userSearch (name: String) -> User?
}

public final class User {
    
    var name: String
    var avatar: String?
    var status: String?
    
    init (name: String, avatar: String, status: String) {
        self.name = name
        self.avatar = avatar
        self.status = status
    }
}

public final class CurrentUserService: UserService {
    
    var user = User(name: "Ivan", avatar: "user_Ivanov", status: "Hello world")
    
    public func userSearch(name: String) -> User? {
        if name == user.name {
            return user
        } else {
            return User(name: "Test", avatar: "avatar", status: "Test")
        }
    }
}

public final class TestUserService: UserService {
    
    var user = User(name: "Oleg", avatar: "user_Oleg", status: "Motorcyclist")
    
    public func userSearch(name: String) -> User? {
        if name == user.name {
            return user
        } else {
            return User(name: "Test", avatar: "avatar", status: "Test")
        }
    }
}
