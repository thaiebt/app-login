//
//  SportCollectionViewCell.swift
//  Login
//
//  Created by Thaina da Silva Ebert on 11/09/22.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "sportCollectionCell"
    
    private lazy var cardSportView: CardSportView = {
        let view = CardSportView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(cardSportView)
        
        NSLayoutConstraint.activate([
            cardSportView.topAnchor.constraint(equalTo: topAnchor),
            cardSportView.leftAnchor.constraint(equalTo: leftAnchor),
            cardSportView.rightAnchor.constraint(equalTo: rightAnchor),
            cardSportView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])

    }
    
    func updateCell(withModel model: SportModel) {
        cardSportView.updateView(withModel: model)
    }
}
