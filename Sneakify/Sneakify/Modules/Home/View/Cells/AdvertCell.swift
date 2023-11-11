//
//  DetailCell.swift
//  Weather-App
//
//  Created by Мявкo on 5.11.23.
//

import UIKit

class AdvertCell: UICollectionViewCell {
    
    private lazy var advertView: UIView = _advertView
    private lazy var advertImageView: UIImageView = _advertImageView
    
    private lazy var advertDescriptionStackView: UIStackView = _advertDescriptionStackView
    private lazy var titleLabel: UILabel = _titleLabel
    private lazy var shopNowButton: UIButton = _shopNowButton
    
    private var advertWidth: CGFloat = 0
    private var advertHeight: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addShadow()
        
        addSubviews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(title: String, image: UIImage?) {
        titleLabel.text = title
        advertImageView.image = image
        
        advertWidth = image == UIImage.converseIcon ? contentView.bounds.width - 20 : contentView.bounds.width - 120
        advertHeight = image == UIImage.converseIcon ? contentView.bounds.height + 60 : contentView.bounds.height + 20
        advertImageView.snp.makeConstraints { make in
            make.width.equalTo(advertWidth)
            make.height.equalTo(advertHeight)
        }
    }
    
    private func addSubviews() {
        contentView.addSubview(advertView)
        advertView.addSubview(advertImageView)
        advertView.addSubview(advertDescriptionStackView)
        advertDescriptionStackView.addArrangedSubview(titleLabel)
        advertDescriptionStackView.addArrangedSubview(shopNowButton)
    }
    
    private func applyConstraints() {
        
        advertView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        advertImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(-15)
            make.bottom.equalToSuperview().inset(10)
        }
        
        advertDescriptionStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(5)
            make.leading.equalTo(contentView.snp.centerX).offset(15)
        }
    }
}

private extension AdvertCell {
    
    var _advertView: UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }
    
    var _advertImageView: UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage.converseIcon
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    var _advertDescriptionStackView: UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        return stackView
    }
    
    var _titleLabel: UILabel {
        let label = UILabel()
        label.text = "Converse All-Stars Vibes"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .right
        label.numberOfLines = 0
        return label
    }
    
    var _shopNowButton: UIButton {
        let button = UIButton(type: .custom)
        button.setTitle("Shop now ", for: .normal)
        button.setImage(UIImage.arrowRight, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.setTitleColor(.greenColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }
}
