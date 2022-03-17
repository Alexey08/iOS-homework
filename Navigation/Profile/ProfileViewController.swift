//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Алексей Уланов on 01.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    
    let clickButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Press me", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.addTarget(self, action: #selector(pressMe), for: .touchUpInside)
        return button
    }()
          
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        title = "Profile"
        
        // добавляем profileHeaderView
        self.view.addSubview(profileHeaderView)
        
        // добавляем кнопку
        self.view.addSubview(clickButton)
        
        // закрепляем profileHeaderView
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        profileHeaderView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        // закрепляем кнопку
        clickButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        clickButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        clickButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        clickButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func pressMe () {
        let alertVC = UIAlertController(title: "Info", message: "Button pressed", preferredStyle: .alert)
        let alertActionOk = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVC.addAction(alertActionOk)

        self.present(alertVC, animated: true, completion: nil)
    }
}
