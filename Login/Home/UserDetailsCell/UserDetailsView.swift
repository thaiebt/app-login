//
//  UserDetailsView.swift
//  Login
//
//  Created by Thaina da Silva Ebert on 03/09/22.
//

import UIKit

class UserDetailsView: UIView {
    
    private lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        backgroundColor = .white
        
        addSubview(profileImage)
        addSubview(nameLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            profileImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            profileImage.widthAnchor.constraint(equalToConstant: 80),
            
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    func updateView(withData data: DetailUserModel) {
        nameLabel.text = data.name
        profileImage.image = UIImage(named: data.image)
    }
}
