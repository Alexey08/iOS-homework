//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Алексей Уланов on 03.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    // создаем элеметы view
        
    // аватарка
    let avatarImege: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "avatar")
        image.clipsToBounds = true
        image.layer.cornerRadius = 60
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        return image
    }()
    
    // имя пользователя
    let nameLabel: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Ivan Ivanov"
        lable.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lable.textColor = .black
        return lable
    }()
    
    // статус пользователя
    let statusLabel: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Status"
        lable.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        lable.textColor = .gray
        return lable
    }()

    // поле ввода статуса
    let statusInputText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Enter text"
        text.textColor = .black
        text.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        text.backgroundColor = .white
        text.layer.cornerRadius = 12
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.black.cgColor
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: text.frame.height))
        text.leftViewMode = .always
        text.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return text
    }()
    
    // кнопка ввода статуса
    let showStatusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private var statusText = String()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // добавляем элементы view
        self.addSubview(avatarImege)
        self.addSubview(nameLabel)
        self.addSubview(statusLabel)
        self.addSubview(statusInputText)
        self.addSubview(showStatusButton)
        
        //расставляем элеметы view
        NSLayoutConstraint.activate([
            // аватарка
            avatarImege.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImege.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImege.widthAnchor.constraint(equalToConstant: 120),
            avatarImege.heightAnchor.constraint(equalToConstant: 120),
            
            // имя пользователя
            nameLabel.leadingAnchor.constraint(equalTo: avatarImege.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            // статус пользователя
            statusLabel.leadingAnchor.constraint(equalTo: avatarImege.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            statusLabel.heightAnchor.constraint(equalToConstant: 20),
            
            // поле ввода статуса
            statusInputText.leadingAnchor.constraint(equalTo: avatarImege.trailingAnchor, constant: 16),
            statusInputText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusInputText.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -16),
            statusInputText.heightAnchor.constraint(equalToConstant: 40),
                        
            // кнопка ввода статуса
            showStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            showStatusButton.topAnchor.constraint(equalTo: avatarImege.bottomAnchor, constant: 16),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
