//
//  FeedViewController.swift
//  Navigation
//
//  Created by Алексей Уланов on 01.03.2022.
//

import UIKit

class FeedViewController: UIViewController {
        
    let postVC = PostViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPurple
        title = "Feed"
                
        let buttonPost = UIButton(frame: CGRect(x: UIScreen.main.bounds.width/2-100, y: UIScreen.main.bounds.height/2-50, width: 200, height: 100))
        buttonPost.backgroundColor = .lightGray
        buttonPost.setTitle("New Post", for: .normal)
        buttonPost.addTarget(self, action: #selector(tap), for: .touchUpInside)
        
        view.addSubview(buttonPost)
                
    }
    
    @objc func tap() {
        
        let post = Post(title: "New Post!")
        
        let postVC = PostViewController()
        postVC.post = post
        
        self.navigationController?.pushViewController(postVC, animated: true)
        
    }
    
}
