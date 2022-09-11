//
//  HomeViewController.swift
//  Login
//
//  Created by Thaina da Silva Ebert on 02/09/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var homeView: HomeView = HomeView()
    
    let userData: [DetailUserModel] = [DetailUserModel(name: "Leandro", image: "menino1"),
                                    DetailUserModel(name: "Leandro", image: "menino2"),
                                    DetailUserModel(name: "Thainá", image: "menina1")]
    
    let sportData: [SportModel] = [SportModel(name: "Ciclismo", image: "ciclismo"),
                                   SportModel(name: "Corrida", image: "corrida"),
                                   SportModel(name: "Yoga", image: "yoga")]
    
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

//MARK: Extension TableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == userData.count {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SportTableViewCell.identifier, for: indexPath) as? SportTableViewCell else { return UITableViewCell() }
            cell.updateCell(data: sportData)
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserDetailsTableViewCell.identifier, for: indexPath) as? UserDetailsTableViewCell else { return UITableViewCell() }
        cell.updateCell(withData: userData[indexPath.row])
        return cell
    }
    
    
}
