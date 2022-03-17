//
//  InfoViewController.swift
//  Navigation
//
//  Created by Алексей Уланов on 01.03.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        
        let lable = UILabel(frame: CGRect(x: UIScreen.main.bounds.width/2-50, y: 20, width: 100, height: 50))
        lable.text = "Info List"
        lable.textColor = .white
        lable.textAlignment = .center
        
        view.addSubview(lable)
        
        let buttonPressMe = UIButton(frame: CGRect(x: UIScreen.main.bounds.width/2-50, y: UIScreen.main.bounds.height/2-25, width: 100, height: 50))
        buttonPressMe.backgroundColor = .lightGray
        buttonPressMe.setTitle("Press me!", for: .normal)
        buttonPressMe.addTarget(self, action: #selector(showAllert), for: .touchUpInside)
        
        view.addSubview(buttonPressMe)
    }
    
    @objc func showAllert() {
        
        let alertVC = UIAlertController(title: "Info", message: "Some text", preferredStyle: .alert)
                
        let alertActionOk = UIAlertAction(title: "OK", style: .default, handler: showPressedButton)
        let alertActionClose = UIAlertAction(title: "Clouse", style: .default, handler: showPressedButton)
        
        func showPressedButton (alert: UIAlertAction) {
            if let i = alert.title {
                print(i)
               }
        }
        
        alertVC.addAction(alertActionOk)
        alertVC.addAction(alertActionClose)

        self.present(alertVC, animated: true, completion: nil)
    }
}
