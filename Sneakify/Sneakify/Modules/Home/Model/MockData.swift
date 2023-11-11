//
//  MockData.swift
//  Sneakify
//
//  Created by Мявкo on 9.11.23.
//

import Foundation
import UIKit

struct MockData {
    
    static let shared = MockData()
    
    private let advert: Section = {
        .advert([AdvertItem(title: "Converse All-Stars Vibes", image: UIImage.converseIcon),
                 AdvertItem(title: "Fila Sneaks On The Block", image: UIImage.filaIcon),
                 AdvertItem(title: "On The Block Fila Sneaks", image: UIImage.filaIcon)])
    }()
    
    private let category: Section = {
        .categories([CategoryItem(title: "Adidas"),
                     CategoryItem(title: "Nike"),
                     CategoryItem(title: "Gucci"),
                     CategoryItem(title: "Vans"),
                     CategoryItem(title: "Converse")])
    }()
    
    private let catalog: Section = {
        .catalog([CatalogItem(title: "Nike Air Max", image: UIImage.vans, price: "350", rating: "4.8"),
                  CatalogItem(title: "Red Color Vans", image: UIImage.vans2, price: "200", rating: "4.7"),
                  CatalogItem(title: "Addidas", image: UIImage.adidas, price: "280", rating: "4.9"),
                  CatalogItem(title: "Nike 2", image: UIImage.vans3, price: "300", rating: "4.4"),
                  CatalogItem(title: "Nike Min He", image: UIImage.converseIcon, price: "320", rating: "5.0"),
                  CatalogItem(title: "Nike The Best", image: UIImage.filaIcon, price: "220", rating: "4.9")])
    }()
    
    var pageData: [Section] {
        return [advert, category, catalog]
    }
}
