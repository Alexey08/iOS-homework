//
//  GeneralSettings.swift
//  Navigation
//
//  Created by Алексей Уланов on 03.04.2022.
//

import UIKit

extension UIViewController {
    
    // Функция скрытия клавиатуры
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIView {
    
    // Индификатор файла
    static let indenifier = String(describing: self)
}
