//
//  CardSportView.swift
//  Login
//
//  Created by Thaina da Silva Ebert on 11/09/22.
//

import UIKit

class CardSportView: UIView {
    
    private lazy var cardImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
        
        addSubview(cardImage)
        addSubview(nameLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cardImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            cardImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            cardImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            cardImage.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -16),
            
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func updateView(withModel model: SportModel) {
        cardImage.image = UIImage(named: model.image)
        nameLabel.text = model.name
    }
}
