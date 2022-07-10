//
//  PostViewController.swift
//  Navigation
//
//  Created by Алексей Уланов on 01.03.2022.
//

import UIKit

struct FeedPost {
    var title: String?
}

class PostViewController: UIViewController {
    
    var post = FeedPost()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        
        if let i = post.title {
            title = i
        }
                
        let infoBarButtonItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(info))
            
        self.navigationItem.rightBarButtonItem = infoBarButtonItem
    }
    
    @objc func info() {
        let infoVC = InfoViewController()
        let infoNavC = UINavigationController(rootViewController: infoVC)
        
        self.present(infoNavC, animated: true, completion: nil)
    }
}
