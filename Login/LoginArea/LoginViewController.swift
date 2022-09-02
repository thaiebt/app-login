//
//  ViewController.swift
//  Login
//
//  Created by Thaina da Silva Ebert on 17/08/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    private var loginView: LoginView = LoginView()
    private var authentication: Auth?
    private var alert: Alert?
    
    override func loadView() {
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.configTextFieldDelegate(delegate: self)
        loginView.clickDelegate = self
        authentication = Auth.auth()
        alert = Alert(controller: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

//MARK: Extension TextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        loginView.textFieldValidator()
    }
}

//MARK: Extension LoginViewClickDelegate
extension LoginViewController: LoginViewClickDelegate {
    func actionLoginButton() {
        let email = loginView.getEmail()
        let password = loginView.getPassword()
        
        authentication?.signIn(withEmail: email, password: password, completion: { result, error in
            if let error = error {
                self.alert?.getAlert(title: "Atenção", message: "Dados incorretos! Verifique as informações e tente novamente", buttonTitle: "Cancelar")
                print(error.localizedDescription)
                return
            }
            
            if result == nil {
                self.alert?.getAlert(title: "Atenção", message: "Tivemos um problema ao realizar o login. Tente novamente mais tarde", buttonTitle: "Cancelar")
                return
            }
            
            self.alert?.getAlert(title: "Sucesso", message: "Login efetuado com sucesso", buttonTitle: "OK", completion: {
                print("falta fazer fluxo")
            })
            
        })
    }
    
    func actionRegisterButton() {
        let controller = RegisterViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
