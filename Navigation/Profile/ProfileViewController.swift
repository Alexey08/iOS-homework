//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Алексей Уланов on 01.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.indenifier)
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: PostTableViewCell.indenifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
                
        addConstraint()
        
        // для скрытия клавиатуры
        hideKeyboardWhenTappedAround()
    }
    
    private func addConstraint() {
        
        NSLayoutConstraint.activate([
            // закрепляем tableView
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    // Код с прошлого ДЗ
    /*
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
        
        // для скрытия клавиатуры
        self.hideKeyboardWhenTappedAround()
        
        // добавляем profileHeaderView
        self.view.addSubview(profileHeaderView)
        
        // добавляем кнопку
        self.view.addSubview(clickButton)
        
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // закрепляем profileHeaderView
            profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            // закрепляем кнопку
            clickButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            clickButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            clickButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            clickButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        

    }
    
    @objc func pressMe () {
        let alertVC = UIAlertController(title: "Info", message: "Button pressed", preferredStyle: .alert)
        let alertActionOk = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVC.addAction(alertActionOk)

        self.present(alertVC, animated: true, completion: nil)
    }
     */
}

extension ProfileViewController: UITableViewDataSource {
           
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.indenifier, for: indexPath) as! PostTableViewCell
        cell.setupCell(post: postArray[indexPath.row])
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileHeaderView()
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        220
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
