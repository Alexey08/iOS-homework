//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Алексей Уланов on 30.05.2022.
//

import UIKit
import SnapKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    // для получения данных User
    private var user: User
    
    // для анимации аватарки
    private var statusText = String()
    private var avatarCenter = CGPoint()
    
    // создаем элеметы view
    
    // аватарка
    lazy var avatarImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: user.avatar ?? "avatar")
        image.backgroundColor = .systemGray6
        image.clipsToBounds = true
        image.layer.cornerRadius = 60
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnAvatar))
        image.addGestureRecognizer(recognizer)
        image.isUserInteractionEnabled = true
        return image
    }()
    
    // фон для открытой аватарки
    lazy var foneAvatarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        view.isHidden = true
        view.alpha = 0
        return view
    }()
    
    // кнопка для закрытия аватарки
    lazy var closeAvatarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .darkGray
        button.isHidden = true
        button.setImage(UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(closeAvatar), for: .touchUpInside)
        return button
    }()
    
    // имя пользователя
    lazy var nameLabel: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = user.name
        lable.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lable.textColor = .black
        return lable
    }()
    
    // статус пользователя
    lazy var statusLabel: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = user.status
        lable.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        lable.textColor = .gray
        return lable
    }()
    
    // поле ввода статуса
    lazy var statusInputText: UITextField = {
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
    lazy var showStatusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = UIColor(named: "ColorSet")
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    init(reuseIdentifier: String?, user: User) {
        
        self.user = user
        
        super.init(reuseIdentifier: reuseIdentifier)
        
        // добавляем элементы view
        self.addSubview(nameLabel)
        self.addSubview(statusLabel)
        self.addSubview(statusInputText)
        self.addSubview(showStatusButton)
        self.addSubview(foneAvatarView)
        self.addSubview(avatarImage)
        self.addSubview(closeAvatarButton)
        
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraint() {
        
        //расставляем элеметы view
        
        // аватарка
        avatarImage.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(16)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(16)
            make.size.equalTo(CGSize(width: 120, height: 120))
        }
        
        // имя пользователя
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(avatarImage.snp.trailing).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(27)
            make.height.equalTo(20)
        }
        
        // статус пользователя
        statusLabel.snp.makeConstraints { make in
            make.leading.equalTo(avatarImage.snp.trailing).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.height.equalTo(20)
        }
        
        // поле ввода статуса
        statusInputText.snp.makeConstraints { make in
            make.leading.equalTo(avatarImage.snp.trailing).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.bottom.equalTo(showStatusButton.snp.top).offset(-16)
            make.height.equalTo(40)
        }
        
        // кнопка ввода статуса
        showStatusButton.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.top.equalTo(avatarImage.snp.bottom).offset(16)
            make.height.equalTo(50)
        }
        
        
        // фон для аватарки
        foneAvatarView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        }
        
        // кнопка Х
        closeAvatarButton.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.trailing.equalTo(self.snp.trailing)
        }
    }
    
    // нажатие по аватарке
    @objc func tapOnAvatar() {
        UIView.animate(withDuration: 0.5,
                       animations: {
            self.avatarCenter = self.avatarImage.center
            self.avatarImage.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
            self.avatarImage.transform = CGAffineTransform(scaleX: self.contentView.frame.width / self.avatarImage.frame.width,
                                                           y: self.contentView.frame.width / self.avatarImage.frame.width)
            self.avatarImage.layer.cornerRadius = 0
            self.avatarImage.layer.borderWidth = 0
            self.foneAvatarView.isHidden = false
            self.foneAvatarView.alpha = 0.8
            self.contentView.layoutIfNeeded()
        },
                       completion: {_ in
            UIImageView.animate(withDuration: 0.3) {
                self.closeAvatarButton.isHidden = false
                self.closeAvatarButton.alpha = 1
            }
        })
    }
    
    // нажатие по кнопке "Х"
    @objc func closeAvatar() {
        UIImageView.animate(
            withDuration: 0.3,
            animations: {
                self.closeAvatarButton.alpha = 0
                self.closeAvatarButton.isHidden = true
                
            },
            completion: { _ in
                UIImageView.animate(withDuration: 0.5,
                                    animations: {
                    self.avatarImage.center = self.avatarCenter
                    self.avatarImage.transform = CGAffineTransform(scaleX: 1, y: 1)
                    self.avatarImage.layer.cornerRadius = self.avatarImage.frame.width / 2
                    self.avatarImage.layer.borderWidth = 3
                    self.foneAvatarView.alpha = 0.0
                    self.contentView.layoutIfNeeded()
                },
                                    completion: { _ in
                    self.foneAvatarView.isHidden = true
                })
            })
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
