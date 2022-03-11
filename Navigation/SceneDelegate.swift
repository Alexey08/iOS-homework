//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Алексей Уланов on 01.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: scene)
                
        let tabBarControler = UITabBarController()
        tabBarControler.tabBar.backgroundColor = UIColor.systemGray6

        let profileVC = ProfileViewController()
//        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user1"), selectedImage: UIImage(named: "user2"))
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: .add, tag: 0)
        let profileNavC = UINavigationController(rootViewController: profileVC)
        
        let feedVC = FeedViewController()
//        feedVC.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(named: "home1"), selectedImage: UIImage(named: "home2"))
        feedVC.tabBarItem = UITabBarItem(title: "Feed", image: .remove, tag: 1)
        let feedNavC = UINavigationController(rootViewController: feedVC)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemGray6
        
        profileNavC.navigationBar.standardAppearance = appearance;
        profileNavC.navigationBar.scrollEdgeAppearance = profileNavC.navigationBar.standardAppearance
       
        feedNavC.navigationBar.standardAppearance = appearance;
        feedNavC.navigationBar.scrollEdgeAppearance = feedNavC.navigationBar.standardAppearance

        tabBarControler.viewControllers = [feedNavC, profileNavC]

        window?.rootViewController = tabBarControler
        window?.makeKeyAndVisible()
        
    }
}
