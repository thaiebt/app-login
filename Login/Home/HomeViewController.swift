//
//  HomeViewController.swift
//  Login
//
//  Created by Thaina da Silva Ebert on 02/09/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var homeView: HomeView = HomeView()
    
    override func loadView() {
        super.loadView()
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.configTableViewProtocols(delegate: self, dataSource: self)
    }
}

//MARK: Extension TableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
}

//MARK: Extension TableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserDetailsTableViewCell.identifier, for: indexPath) as? UserDetailsTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    
}
