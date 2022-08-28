//
//  File.swift
//  Navigation
//
//  Created by Алексей Уланов on 28.08.2022.
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
