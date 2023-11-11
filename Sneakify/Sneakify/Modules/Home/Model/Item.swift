//
//  ListItem.swift
//  Sneakify
//
//  Created by Мявкo on 9.11.23.
//

import UIKit

protocol Item: Any {
    var title: String { get set }
}

struct AdvertItem: Item {
    var title: String
    let image: UIImage?
}

struct CategoryItem: Item  {
    var title: String
}

struct CatalogItem: Item  {
    var title: String
    let image: UIImage?
    let price: String
    let rating: String
}


