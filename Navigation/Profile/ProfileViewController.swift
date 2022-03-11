//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Алексей Уланов on 01.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
          
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        title = "Profile"
        
        self.view.addSubview(profileHeaderView)

    }
    
    override func viewWillLayoutSubviews() {
        
        self.profileHeaderView.frame = self.view.frame
        
    }
}
