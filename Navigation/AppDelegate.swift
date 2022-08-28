//
//  AppDelegate.swift
//  Navigation
//
//  Created by Алексей Уланов on 01.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let tabBarControler = UITabBarController()
        tabBarControler.tabBar.backgroundColor = UIColor.systemGray6

        let profileVC = LogInViewController()
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        let profileNavC = UINavigationController(rootViewController: profileVC)
        profileNavC.navigationBar.isHidden = true
        
        // реализация Delegate
        let loginFactory = MyLoginFactory()
        profileVC.loginDelegate = loginFactory.makeLoginInspector()
        
        let feedVC = FeedViewController()
        feedVC.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "newspaper"), selectedImage: UIImage(systemName: "newspaper.fill"))
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
        
        return true
    }

}
