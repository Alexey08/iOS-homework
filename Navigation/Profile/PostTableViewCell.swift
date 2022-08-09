//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Алексей Уланов on 31.05.2022.
//

import UIKit
import iOSIntPackage

class PostTableViewCell: UITableViewCell {
    
    // работа с фильтрами для картинок
    private let imageProcessor  = ImageProcessor()
    
    // добавляем элементы
    private var postTitle: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.numberOfLines = 2
        lable.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return lable
    }()

    private var postImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFill
        return image
    }()

    private var postDescription: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.textColor = .systemGray
        lable.numberOfLines = 0
        return lable
    }()

    private var postLikes: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = UIFont.systemFont(ofSize: 16)
        lable.textColor = .black
        return lable
    }()
    
    private var postViews: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = UIFont.systemFont(ofSize: 16)
        lable.textColor = .black
        return lable
    }()

    // заполняем Post
    public func setupCell(post: Post) {
        self.postTitle.text = post.author
        self.postDescription.text = post.description
        self.postImage.image = UIImage(named: post.image)
        filterPicture(picture: postImage.image!)
        self.postLikes.text = "Likes: \(post.likes)"
        self.postViews.text = "Views: \(post.views)"
    }
    
    // фильтруем картинку с помощью iOSIntPackage
    public func filterPicture (picture: UIImage) {
        imageProcessor.processImage(sourceImage: picture, filter: ColorFilter.colorInvert) { filterPicture in
            postImage.image = filterPicture
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // добавляем элементы
        contentView.addSubview(postTitle)
        contentView.addSubview(postImage)
        contentView.addSubview(postDescription)
        contentView.addSubview(postLikes)
        contentView.addSubview(postViews)
        
        // добавляем констрайнты
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // добавляем констрайнты
    private func addConstraint() {
        
        NSLayoutConstraint.activate([

            contentView.widthAnchor.constraint(equalTo: self.widthAnchor),

            postTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            postTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor),
            postImage.topAnchor.constraint(equalTo: postTitle.bottomAnchor, constant: 16),

            postDescription.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
            postDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            postLikes.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postLikes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postLikes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            postViews.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
