//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Алексей Уланов on 08.06.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    // константа для отступов
    private let sideIset: CGFloat = 8
    
    // создаем элементы
   
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
    
    // создаем коллекцию
    private lazy var photosPreviewCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.indenifier)
        collection.delegate = self
        collection.dataSource = self
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // добавляем элементы
        contentView.addSubview(photoLable)
        contentView.addSubview(arrow)
        contentView.addSubview(photosPreviewCollection)
        
        // добавляем констрайнты
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func addConstraint() {
        
        NSLayoutConstraint.activate([
            
            contentView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            photoLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photoLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            arrow.centerYAnchor.constraint(equalTo: photoLable.centerYAnchor),
            arrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
                        
            photosPreviewCollection.topAnchor.constraint(equalTo: photoLable.bottomAnchor, constant: 12),
            photosPreviewCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photosPreviewCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photosPreviewCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photosPreviewCollection.heightAnchor.constraint(equalToConstant: 85),
        ])
    }
}

extension PhotosTableViewCell: UICollectionViewDataSource {
    
    // кол-во ячеек
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return photosArray.count
    }
    
    // источник ячеек
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.indenifier, for: indexPath) as! PhotosCollectionViewCell
        cell.photoId(with: photosArray[indexPath.item])
        cell.photoRadius(radius: 12)
        
        return cell
    }
}

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    
    // задаём размеры ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (photosPreviewCollection.bounds.width - 4 * sideIset) / 4
        let height = width
        return CGSize(width: width, height: height)
    }
}
