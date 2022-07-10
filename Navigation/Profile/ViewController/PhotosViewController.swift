//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Алексей Уланов on 28.06.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    // константа для отступов
    private let sideIset: CGFloat = 8
    
    // создаем коллекцию
    private lazy var photosCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.indenifier)
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.addSubview(photosCollection)
        
        // добавляем констрайнты
        addConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // настраиваем ТабБар и Нав.контроллер
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            photosCollection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: sideIset),
            photosCollection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -sideIset),
            photosCollection.topAnchor.constraint(equalTo: self.view.topAnchor),
            photosCollection.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    
    // кол-во ячеек
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return photosArray.count
    }
    
    // источник ячеек
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.indenifier, for: indexPath) as! PhotosCollectionViewCell
        cell.photoId(with: photosArray[indexPath.item])
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    // задаём размеры ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.bounds.width - 3 * sideIset) / 3
        let height = width
        return CGSize(width: width, height: height)
    }
}
