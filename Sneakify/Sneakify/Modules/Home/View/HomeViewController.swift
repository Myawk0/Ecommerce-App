//
//  ViewController.swift
//  Sneakify
//
//  Created by Мявкo on 9.11.23.
//

import UIKit
import SnapKit

class HomeViewController: BaseViewController {
    
    private lazy var collectionView: UICollectionView = _collectionView
    
    private let sections = MockData.shared.pageData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegates()
        addSubviews()
        applyConstraints()
    }
    
    private func setupDelegates() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func addSubviews() {
        view.addSubview(collectionView)
    }
    
    private func applyConstraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(20)
        }
    }
    
    private func createLayoutSection(group: NSCollectionLayoutGroup,
                               behaviour: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                               interGroupSpacing: CGFloat,
                               supplementaryItem: [NSCollectionLayoutBoundarySupplementaryItem],
                               contentInsets: NSDirectionalEdgeInsets) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behaviour
        section.interGroupSpacing = interGroupSpacing
        section.boundarySupplementaryItems = supplementaryItem
        section.contentInsets = contentInsets
        
        return section
    }
    
    private func advertLayoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:
                .fractionalHeight(0.8))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 15)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension:
                .fractionalWidth(0.5))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = createLayoutSection(group: group,
                                          behaviour: .groupPaging,
                                          interGroupSpacing: 5,
                                          supplementaryItem: [],
                                          contentInsets: NSDirectionalEdgeInsets(top: 35, leading: 0, bottom: 5, trailing: 0))
   
        return section
    }
    
    private func categoriesLayoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                              heightDimension: .fractionalHeight(0.5))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(110),
                                               heightDimension: .fractionalHeight(0.1))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = createLayoutSection(group: group,
                                          behaviour: .continuous,
                                          interGroupSpacing: 0,
                                          supplementaryItem: [supplementaryHeaderItem],
                                          contentInsets: .init(top: 0, leading: 0, bottom: 0, trailing: 0))
        
        return section
    }
    
    var supplementaryHeaderItem: NSCollectionLayoutBoundarySupplementaryItem {
        return .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .estimated(30)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
    
    private func itemsLayoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension:
                .fractionalHeight(0.9))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalHeight(0.35))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
 
        let section = createLayoutSection(group: group,
                                          behaviour: .none,
                                          interGroupSpacing: 20,
                                          supplementaryItem: [],
                                          contentInsets: .init(top: 0, leading: 0, bottom: 0, trailing: 0))
        
        return section
    }
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        UICollectionViewCompositionalLayout { sectionIndex, _ in
            
            let section = self.sections[sectionIndex]
            
            switch section {
                
            case .advert:
                return self.advertLayoutSection()
            case .categories:
                return self.categoriesLayoutSection()
            case .catalog:
                return self.itemsLayoutSection()
            }
        }
    }
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch sections[indexPath.section] {
        case .advert(let adverts):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.CategoriesCollection.advertCellIdentifier, for: indexPath) as? AdvertCell else { return UICollectionViewCell() }
     
            let advert = adverts[indexPath.row]
            cell.setupCell(title: advert.title, image: advert.image)
            
            return cell
        case .categories(let categories):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.CategoriesCollection.categoryCellIdentifier, for: indexPath) as? CategoriesCell else { return UICollectionViewCell() }
            
            let category = categories[indexPath.row]
            cell.setupCell(with: category.title)

            return cell
        case .catalog(let items):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.CategoriesCollection.itemsCellIdentifier, for: indexPath) as? CatalogCell else { return UICollectionViewCell() }
            
            let item = items[indexPath.row]
            cell.setupCell(title: item.title, image: item.image, price: item.price, rating: item.rating)
            
            return cell
        }
    }
}


// MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: K.CategoriesCollection.headerIdentifier, for: indexPath) as! DetailsHeader
            
            header.setupHeader(with: sections[indexPath.section].title)
            return header
        default: return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 35)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return K.CategoriesCollection.edgeInsets
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return K.CategoriesCollection.itemSize
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return K.CategoriesCollection.interitemSpacing
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return K.CategoriesCollection.lineSpacing
//    }
}


private extension HomeViewController {
    
    var _collectionView: UICollectionView {
        let layout = createCompositionalLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(DetailsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: K.CategoriesCollection.headerIdentifier)
        collectionView.register(AdvertCell.self, forCellWithReuseIdentifier: K.CategoriesCollection.advertCellIdentifier)
        collectionView.register(CategoriesCell.self, forCellWithReuseIdentifier: K.CategoriesCollection.categoryCellIdentifier)
        collectionView.register(CatalogCell.self, forCellWithReuseIdentifier: K.CategoriesCollection.itemsCellIdentifier)
        return collectionView
    }
}

