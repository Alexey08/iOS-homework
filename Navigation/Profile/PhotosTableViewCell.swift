//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Алексей Уланов on 08.06.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    // создаем элементы
    private let photosStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 8
        return stack
    }()
    
    private var photoLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Photos"
        lable.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        lable.textColor = .black
        return lable
    }()
    
    private let arrow: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "arrow.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24))?.withTintColor(.black, renderingMode: .alwaysOriginal)
        image.clipsToBounds = true
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // добавляем элементы
        contentView.addSubview(photoLable)
        contentView.addSubview(arrow)
        contentView.addSubview(photosStack)
        
        //наполняем стек
        fillStack()
        
        // добавляем констрайнты
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func fillStack() {
        
        for i in 0...3 {
            
            // создаем картинку
            let photoImage: UIImageView = {
                let image = UIImageView()
                image.translatesAutoresizingMaskIntoConstraints = false
                image.image = UIImage(named: photosArray[i])
                image.clipsToBounds = true
                image.layer.cornerRadius = 8
                return image
            }()
            
            // задаем размеры картинки
            NSLayoutConstraint.activate([
                photoImage.widthAnchor.constraint(equalToConstant: (contentView.bounds.width - 48) / 4),
                photoImage.heightAnchor.constraint(equalToConstant: (contentView.bounds.width - 48) / 4),
                ])
            
            // добавляем в стек
            photosStack.addArrangedSubview(photoImage)
        }
    }
    
    private func addConstraint() {
        
        NSLayoutConstraint.activate([
            
            contentView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            photoLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photoLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            arrow.centerYAnchor.constraint(equalTo: photoLable.centerYAnchor),
            arrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
                        
            photosStack.topAnchor.constraint(equalTo: photoLable.bottomAnchor, constant: 12),
            photosStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photosStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photosStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ])
    }
}
