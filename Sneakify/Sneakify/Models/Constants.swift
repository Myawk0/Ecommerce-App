//
//  Constants.swift
//  Weather-App
//
//  Created by Мявкo on 5.11.23.
//

import UIKit

struct K {
    
    // MARK: - CategoriesCollectionView constants

    struct CategoriesCollection {
        static let headerIdentifier = "CategoriesHeader"
        static let advertCellIdentifier = "AdvertCell"
        static let categoryCellIdentifier = "CategoriesCell"
        static let itemsCellIdentifier = "ItemsCell"
        
        static let edgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        static let edgeInset: CGFloat = 5
        static let interitemSpacing: CGFloat = 5
        static let lineSpacing: CGFloat = 30
        
        static let width = (UIScreen.main.bounds.width - lineSpacing * 2) / 2
        static let height = width - 40
        static var itemSize: CGSize {
            return CGSize(width: width, height: height)
        }
    }
    
//    // MARK: - NewsTableViewController constants
//
//    struct NewsTable {
//        static let title = "Список новостей"
//        static let cellIdentifier = "NewsItemCell"
//
//        static let contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
//    }
//
//    // MARK: - DetailsViewController constants
//
//    struct DetailsView {
//        static let title = "Детальная информация"
//    }
}

