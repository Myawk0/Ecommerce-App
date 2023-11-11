//
//  ItemsCell.swift
//  Sneakify
//
//  Created by Мявкo on 10.11.23.
//

import UIKit

class CatalogCell: UICollectionViewCell {
    
    private lazy var itemView: UIView = _itemView
    
    private lazy var itemImageView: UIImageView = _itemImageView
    private lazy var titleLabel: UILabel = _titleLabel
    private lazy var priceLabel: UILabel = _priceLabel
    
    private lazy var ratingStackView: UIStackView = _ratingStackView
    private lazy var ratingImageView: UIImageView = _ratingImageView
    private lazy var ratingLabel: UILabel = _ratingLabel
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addShadow()
        addSubviews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(title: String, image: UIImage?, price: String, rating: String) {
        itemImageView.image = image
        titleLabel.text = title
        priceLabel.text = "$\(price)"
        ratingLabel.text = rating
    }
    
    private func addSubviews() {
        contentView.addSubview(itemView)
        itemView.addSubview(itemImageView)
        itemView.addSubview(titleLabel)
        itemView.addSubview(priceLabel)

        itemView.addSubview(ratingStackView)
        ratingStackView.addArrangedSubview(ratingImageView)
        ratingStackView.addArrangedSubview(ratingLabel)
    }
    
    private func applyConstraints() {
        
        itemView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        itemImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            //make.width.equalTo(contentView.bounds.width)
            //make.height.equalTo(contentView.bounds.height - 50)//.inset(30)
            make.bottom.equalToSuperview().offset(-80)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(itemImageView.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(10)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }

        ratingStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
            make.width.equalTo(45)
        }
        
        ratingImageView.snp.makeConstraints { make in
            make.width.height.equalTo(20)
        }
    }
}

private extension CatalogCell {
    
    var _itemView: UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }
    
    var _itemImageView: UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage.vans
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }
    
    var _titleLabel: UILabel {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        return label
    }
    
    var _priceLabel: UILabel {
        let label = UILabel()
        label.text = "$350"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        return label
    }
    
    var _ratingStackView: UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }
    
    var _ratingImageView: UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage.star
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    var _ratingLabel: UILabel {
        let label = UILabel()
        label.text = "4.8"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .left
        return label
    }
}
