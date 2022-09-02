//
//  Alert.swift
//  Login
//
//  Created by Thaina da Silva Ebert on 02/09/22.
//

import UIKit

class Alert {
    let controller: UIViewController
    init(controller: UIViewController) {
        self.controller =  controller
    }
    
    func getAlert(title: String, message: String, buttonTitle: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: buttonTitle, style: .cancel) { _ in
            completion?()
        }
        
        alertController.addAction(alertAction)
        controller.present(alertController, animated: true)
    }
}
