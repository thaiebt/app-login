//
//  SportTableViewCell.swift
//  Login
//
//  Created by Thaina da Silva Ebert on 03/09/22.
//

import UIKit

class SportTableViewCell: UITableViewCell {
    
    private lazy var sportView: SportView = {
        let view = SportView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    static let identifier = "sportCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(sportView)
        
        NSLayoutConstraint.activate([
            sportView.topAnchor.constraint(equalTo: contentView.topAnchor),
            sportView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            sportView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            sportView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
}
