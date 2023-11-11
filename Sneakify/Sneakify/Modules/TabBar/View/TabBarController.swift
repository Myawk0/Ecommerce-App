//
//  TabBarController.swift
//  Sneakify
//
//  Created by Мявкo on 11.11.23.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        // Создаем контроллеры для каждой вкладки
        //        let firstViewController = HomeViewController()
        //        let secondViewController = UIViewController()
        //        let thirdViewController = UIViewController()
        //        let fourthViewController = UIViewController()
        //
        //        // Устанавливаем текст и изображение для каждой вкладки
        //        firstViewController.tabBarItem = UITabBarItem(title: "Tab 1", image: UIImage(systemName: "star"), selectedImage: nil)
        //        secondViewController.tabBarItem = UITabBarItem(title: "Tab 2", image: UIImage(systemName: "star"), selectedImage: nil)
        //        thirdViewController.tabBarItem = UITabBarItem(title: "Tab 3", image: UIImage(systemName: "star"), selectedImage: nil)
        //        fourthViewController.tabBarItem = UITabBarItem(title: "Tab 4", image: UIImage(systemName: "star"), selectedImage: nil)
        //
        //        // Устанавливаем контроллеры в таб-бар
        //        self.viewControllers = [firstViewController, secondViewController, thirdViewController, fourthViewController]
        //
        //        //firstViewController.navigationController?.setupHomeScreenButtons()
        
        createTabBar()
        
    }
    
    func createHomeViewController() -> UINavigationController {
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage.homeIcon, selectedImage: UIImage.fillHomeIcon)
        
        let homeNC = UINavigationController(rootViewController: homeVC)
        homeVC.navigationController?.setupHomeScreenButtons()
        
        return homeNC
    }
    
    func createFavoritesViewController() -> UINavigationController {
        let favoritesVC = UIViewController()
        favoritesVC.view.backgroundColor = .systemRed
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage.heartIcon, selectedImage: UIImage.fillHeartIcon)
        
        return UINavigationController(rootViewController: favoritesVC)
    }
    
    func createCartViewController() -> UINavigationController {
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .systemGreen
        thirdVC.tabBarItem = UITabBarItem(title: "Cart", image: UIImage.cartIcon, selectedImage: UIImage.fillCartIcon)
        
        return UINavigationController(rootViewController: thirdVC)
    }
    
    func createProfileViewController() -> UINavigationController {
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .systemCyan
        thirdVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.profileIcon, selectedImage: UIImage.fillProfileIcon)
        
        return UINavigationController(rootViewController: thirdVC)
    }
    
    func createTabBar() {
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [createHomeViewController(),
                           createFavoritesViewController(),
                           createCartViewController(),
                           createProfileViewController()]
    }
    
}
