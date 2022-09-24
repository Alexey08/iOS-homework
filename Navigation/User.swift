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
    
    init (name: String, avatar: String?, status: String?) {
        self.name = name
        self.avatar = avatar
        self.status = status
    }
}

public final class CurrentUserService: UserService {
    
    let userIvan = User(name: "Ivan", avatar: "user_Ivan", status: "Hello world")
    let userOleg = User(name: "Oleg", avatar: "user_Oleg", status: "I am biker")
    
    public func userSearch(name: String) -> User? {
        switch name {
        case "Ivan" :
            return userIvan
        case "Oleg" :
            return userOleg
        default :
            return nil
        }
    }
}

// Singleton
public class Checker {
    
    private let login = "Ivan"
    private let pswrd = "1234"
    
    static let shared = Checker()
    
    private init() {}
    
    func check (_ login: String, _ pswrd: String) -> Bool {
        guard login == self.login && pswrd == self.pswrd else { return false }
             return true
    }
}
