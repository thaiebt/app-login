//
//  UserDetailsTableViewCell.swift
//  Login
//
//  Created by Thaina da Silva Ebert on 02/09/22.
//

import UIKit

class UserDetailsTableViewCell: UITableViewCell {
    
    private lazy var userDetailsView: UserDetailsView = {
        let view = UserDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    static let identifier: String = "userDetails"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(userDetailsView)
        
        NSLayoutConstraint.activate([
            userDetailsView.topAnchor.constraint(equalTo: contentView.topAnchor),
            userDetailsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            userDetailsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            userDetailsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func updateCell(withData data: DetailUserModel) {
        userDetailsView.updateView(withData: data)
    }
}
