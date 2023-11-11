//
//  DetailsHeader.swift
//  Weather-App
//
//  Created by Мявкo on 5.11.23.
//

import UIKit
import SnapKit

class DetailsHeader: UICollectionReusableView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Details"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHeader(with title: String) {
        titleLabel.text = title
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
    }
    
    private func applyConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(5)
        }
    }
}
