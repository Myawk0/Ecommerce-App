//
//  UIImage.swift
//  Sneakify
//
//  Created by Мявкo on 10.11.23.
//

import UIKit

// MARK: - Methods to use

extension UIImage {
    
    static func loadedImage(with name: String, color: UIColor) -> UIImage? {
        return UIImage(named: name)?.withTintColor(color, renderingMode: .alwaysOriginal)
    }
    
    static func systemImage(with name: String, color: UIColor) -> UIImage? {
        return UIImage(systemName: name)?.withTintColor(color, renderingMode: .alwaysOriginal)
    }
    
    static func tabBarImage(with name: String, isFill: Bool) -> UIImage? {
        return loadedImage(with: name, color: isFill ? .greenColor : .lightGray)
    }
    
    static func tabBarSystemImage(with name: String, isFill: Bool) -> UIImage? {
        return systemImage(with: name, color: isFill ? .greenColor : .lightGray)
    }
}


extension UIImage {
    
    static var converseIcon: UIImage? {
        return UIImage(named: "ConverseIcon")
    }
    
    static var filaIcon: UIImage? {
        return UIImage(named: "FilaIcon")
    }
    
    static var adidas: UIImage? {
        return UIImage(named: "Adidas")
    }
    
    static var vans: UIImage? {
        return UIImage(named: "Vans")
    }
    
    static var vans2: UIImage? {
        return UIImage(named: "Vans2")
    }
    
    static var vans3: UIImage? {
        return UIImage(named: "Vans3")
    }
    
    // MARK: - System Images
    
    static var arrowRight: UIImage? {
        return systemImage(with: "arrow.backward", color: .greenColor)
    }
    
    static var star: UIImage? {
        return systemImage(with: "star.fill", color: .yellowColor)
    }
    
    // MARK: - TabBar icons
    
    /// Home icon
    
    static var homeIcon: UIImage? {
        return tabBarImage(with: "home", isFill: false)
    }
    
    static var fillHomeIcon: UIImage? {
        return tabBarImage(with: "home", isFill: true)
    }
    
    /// Favourites icon
    
    static var heartIcon: UIImage? {
        return tabBarSystemImage(with: "heart", isFill: false)
    }
    
    static var fillHeartIcon: UIImage? {
        return tabBarSystemImage(with: "heart.fill", isFill: true)
    }
    
    /// Cart icon
    
    static var cartIcon: UIImage? {
        return tabBarImage(with: "bag", isFill: false)
    }
    
    static var fillCartIcon: UIImage? {
        return tabBarImage(with: "bag", isFill: true)
    }
    
    /// Profile icon
    
    static var profileIcon: UIImage? {
        return tabBarSystemImage(with: "person", isFill: false)
    }
    
    static var fillProfileIcon: UIImage? {
        return tabBarSystemImage(with: "person.fill", isFill: true)
    }
}

