//
//  Checker.swift
//  Navigation
//
//  Created by Алексей Уланов on 28.09.2022.
//

import Foundation

// Singleton

public class Checker {
    
    private let login = "Ivanov"
    private let password = "1234"
    
    static let shared = Checker()
    
    private init() {}
    
    func check (_ login: String, _ pswrd: String) -> Bool {
        guard login == self.login && pswrd == self.password else { return false }
        return true
     }
}
