//
//  LoginFactory.swift
//  Navigation
//
//  Created by Алексей Уланов on 28.09.2022.
//

import Foundation
 import UIKit


 //Factory
 protocol LoginFactory {

     func makeLoginInspector() -> LoginInspector
 }


 struct MyLoginFactory: LoginFactory {

      func makeLoginInspector() -> LoginInspector {
          let inspector = LoginInspector()
          return inspector
      }
 }

class LoginInspector: LoginViewControllerDelegate {

    func check(login: String, password: String) -> Bool {
        let cheker = Checker.shared
        return cheker.check(login, password)
    }
}
