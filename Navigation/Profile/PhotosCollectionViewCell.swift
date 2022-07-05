//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Алексей Уланов on 28.06.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    // создаем Image
    private let photoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        contentView.backgroundColor = .red
        
        // добавляем Image
        contentView.addSubview(photoImage)

        // добавляем констрайнты
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // добавляем констрайнты
    private func addConstraint() {
        
        NSLayoutConstraint.activate([
            photoImage.topAnchor.constraint (equalTo: contentView.topAnchor),
            photoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    // передаем имя файла для UIImageView
    func photoId (with photoId: String) {
        photoImage.image = UIImage(named: photoId)
    }
}
