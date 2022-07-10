//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Алексей Уланов on 01.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // создаем таблицу
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: PostTableViewCell.indenifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.indenifier)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.indenifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemGray6
        view.addSubview(tableView)
        
        // добавляем констрайнты
        addConstraint()
        
        // для скрытия клавиатуры
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // настраиваем ТабБар и Нав.контроллер
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func addConstraint() {
        
        // закрепляем tableView
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    // кол-во секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // кол-во строк
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return postArray.count
        default:
            return 0
        }
    }
    
    // источник ячеек для строк
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.indenifier, for: indexPath) as! PhotosTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.indenifier, for: indexPath) as! PostTableViewCell
            cell.setupCell(post: postArray[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension ProfileViewController: UITableViewDelegate {
    
    // добавляем хедеры
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section {
        case 0:
            let header = ProfileHeaderView()
            return header
        default:
            return nil
        }
    }
       
    // высота строк
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    // отслеживаем нажатие по ячейке
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.section {
        case 0:
            tapPhotos()
        default:
            break
        }
    }
    
    // переход на PhotosViewController
    func tapPhotos() {
        let photosVC = PhotosViewController()
        photosVC.title = "Photo Gallery"
        photosVC.view.backgroundColor = .white
        self.navigationController?.pushViewController(photosVC, animated: true)
        tabBarController?.tabBar.isHidden = true
    }
}
