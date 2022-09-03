//
//  HomeView.swift
//  Login
//
//  Created by Thaina da Silva Ebert on 02/09/22.
//

import UIKit

class HomeView: UIView {
    
    private lazy var tabelView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        table.register(UserDetailsTableViewCell.self, forCellReuseIdentifier: UserDetailsTableViewCell.identifier)
        return table
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
        addSubview(tabelView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tabelView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tabelView.leftAnchor.constraint(equalTo: leftAnchor),
            tabelView.rightAnchor.constraint(equalTo: rightAnchor),
            tabelView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tabelView.delegate = delegate
        tabelView.dataSource = dataSource
    }
}
