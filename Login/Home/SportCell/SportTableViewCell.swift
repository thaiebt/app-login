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
    
    var data: [SportModel] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        sportView.configProtocols(delegate: self, dataSourse: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(sportView)
        
        NSLayoutConstraint.activate([
            sportView.topAnchor.constraint(equalTo: topAnchor),
            sportView.leftAnchor.constraint(equalTo: leftAnchor),
            sportView.rightAnchor.constraint(equalTo: rightAnchor),
            sportView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func updateCell(data: [SportModel]) {
        self.data = data
    }
}

extension SportTableViewCell: UICollectionViewDelegate {}

extension SportTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SportCollectionViewCell.identifier, for: indexPath) as? SportCollectionViewCell else { return UICollectionViewCell() }
        cell.updateCell(withModel: data[indexPath.row])
        return cell
    }
}

extension SportTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 100)
    }
}
