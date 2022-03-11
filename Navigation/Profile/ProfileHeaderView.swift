//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Алексей Уланов on 03.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    // создаем элеметы view
    var avatarImege = UIImageView()
    var nameLabel = UILabel()
    var statusLabel = UILabel()
    var statusInputText = UITextField()
    var showStatusButton = UIButton()
    
    private var statusText = String()
    
    // задаем свойства элементам view
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // аватарка
        avatarImege.translatesAutoresizingMaskIntoConstraints = false
        avatarImege.image = UIImage(named: "avatar")
        avatarImege.clipsToBounds = true
        avatarImege.layer.cornerRadius = 60
        avatarImege.layer.borderWidth = 3
        avatarImege.layer.borderColor = UIColor.white.cgColor
        self.addSubview(avatarImege)
        
        // имя пользователя
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Name"
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameLabel.textColor = .black
        self.addSubview(nameLabel)
        
        // статус пользователя
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "Status"
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        statusLabel.textColor = .gray
        self.addSubview(statusLabel)
        
        // поле ввода статуса
        statusInputText.translatesAutoresizingMaskIntoConstraints = false
        statusInputText.placeholder = "Enter text"
        statusInputText.textColor = .black
        statusInputText.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusInputText.backgroundColor = .white
        statusInputText.layer.cornerRadius = 12
        statusInputText.layer.borderWidth = 1
        statusInputText.layer.borderColor = UIColor.black.cgColor
        statusInputText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: statusInputText.frame.height))
        statusInputText.leftViewMode = .always
        statusInputText.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        self.addSubview(statusInputText)
        
        // кнопка ввода статуса
        showStatusButton.translatesAutoresizingMaskIntoConstraints = false
        showStatusButton.setTitle("Show status", for: .normal)
        showStatusButton.backgroundColor = .systemBlue
        showStatusButton.titleLabel?.textColor = .white
        showStatusButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        showStatusButton.layer.cornerRadius = 4
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowOpacity = 0.7
        showStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        self.addSubview(showStatusButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //расставляем элеметы view
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [
            // аватарка
            avatarImege.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            avatarImege.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImege.widthAnchor.constraint(equalToConstant: 120),
            avatarImege.heightAnchor.constraint(equalToConstant: 120),
            
            // имя пользователя
            nameLabel.leftAnchor.constraint(equalTo: avatarImege.rightAnchor, constant: 16),
            nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            // статус пользователя
            statusLabel.leftAnchor.constraint(equalTo: avatarImege.rightAnchor, constant: 16),
            statusLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            statusLabel.heightAnchor.constraint(equalToConstant: 20),
            
            // поле ввода статуса
            statusInputText.leftAnchor.constraint(equalTo: avatarImege.rightAnchor, constant: 16),
            statusInputText.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            statusInputText.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -16),
            statusInputText.heightAnchor.constraint(equalToConstant: 40),
                        
            // кнопка ввода статуса
            showStatusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            showStatusButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            showStatusButton.topAnchor.constraint(equalTo: avatarImege.bottomAnchor, constant: 16),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50),
        ]
        .forEach { $0.isActive = true }
    }
    
    // логика showStatusButton
    @objc func buttonPressed() {
        statusLabel.text = statusText
        statusInputText.text = ""
        statusText = ""
        statusInputText.resignFirstResponder()
    }
    
    // логика statusInputText
    @objc func statusTextChanged(_ textField: UITextField) {
        if let i = textField.text {
            statusText = i
        }
    }
}
