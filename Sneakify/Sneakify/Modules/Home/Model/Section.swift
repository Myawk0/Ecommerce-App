//
//  ListSection.swift
//  Sneakify
//
//  Created by Мявкo on 9.11.23.
//

import Foundation

enum Section {
    case advert([AdvertItem])
    case categories([CategoryItem])
    case catalog([CatalogItem])
    
    var items: [Item] {
        switch self {
        case .advert(let advertItems):
            return advertItems
        case .categories(let categoryItems):
            return categoryItems
        case .catalog(let catalogItems):
            return catalogItems
            
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .advert:
            return "Featured Products"
        case .categories:
            return "Categories"
        case .catalog:
            return "Top Selling"
        }
    }
}
