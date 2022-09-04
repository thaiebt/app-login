//
//  SportView.swift
//  Login
//
//  Created by Thaina da Silva Ebert on 03/09/22.
//

import UIKit

class SportView: UIView {
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .red
        collection.showsHorizontalScrollIndicator = false
        collection.delaysContentTouches = false
        
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        
        collection.setCollectionViewLayout(layout, animated: false)
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
