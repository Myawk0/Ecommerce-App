//
//  CategoriesCell.swift
//  Sneakify
//
//  Created by Мявкo on 10.11.23.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Details"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .greenColor
        contentView.layer.cornerRadius = 20
        addSubviews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(with title: String) {
        titleLabel.text = title
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
    }
    
    private func applyConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
