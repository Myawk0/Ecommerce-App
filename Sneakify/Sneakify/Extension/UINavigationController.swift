//
//  NavigationController.swift
//  News-App
//
//  Created by Мявкo on 24.10.23.
//

import UIKit

extension UINavigationController {
    
    func setupHomeScreenButtons() {
        setupTitle(title: "Sneakify")
        setupSearchButton()
        setupNotificationButton()
    }
    
    // MARK: - Change "Back" button appearance
    
    func setupBackButton(with tintColor: UIColor = .darkGray) {
        let backButtonImage = UIImage(systemName: "chevron.backward")
        let alignInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        navigationBar.backIndicatorImage = backButtonImage?.withAlignmentRectInsets(alignInsets)
        navigationBar.backIndicatorTransitionMaskImage = backButtonImage
        navigationBar.tintColor = tintColor
        navigationBar.topItem?.title = ""
    }
    
    // MARK: - Setup Title
    
    func setupTitle(title: String, color: UIColor = .darkGray) {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = color
        titleLabel.font = .monospacedSystemFont(ofSize: 22, weight: .bold)
        topViewController?.navigationItem.titleView = titleLabel
    }
    
    // MARK: - Setup "Search" button (on the left)
    
    func setupSearchButton() {
        let alignInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        let searchIcon = UIImage(systemName: "magnifyingglass")?
            .withTintColor(.darkGray, renderingMode: .alwaysOriginal)
            .withAlignmentRectInsets(alignInsets)
        
        let searchButton = UIBarButtonItem(image: searchIcon, style: .plain, target: self, action: #selector(searchButtonTapped))

        topViewController?.navigationItem.leftBarButtonItem = searchButton
    }
    
    @objc func searchButtonTapped() {
        print("Search button tapped")
    }
    
    // MARK: - Setup "Notification" button (on the right)
    
    func setupNotificationButton() {
        let alignInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        let notificationIcon = UIImage(systemName: "bell")?
            .withTintColor(.darkGray, renderingMode: .alwaysOriginal)
            .withAlignmentRectInsets(alignInsets)
        
        let notificationButton = UIBarButtonItem(image: notificationIcon, style: .plain, target: self, action: #selector(notificationButtonTapped))
        
        topViewController?.navigationItem.rightBarButtonItem = notificationButton
    }
    
    @objc func notificationButtonTapped() {
        print("Notification button tapped")
    }
}
