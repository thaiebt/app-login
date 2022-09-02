//
//  RegisterViewController.swift
//  Login
//
//  Created by Thaina da Silva Ebert on 27/08/22.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    private var registerView: RegisterView = RegisterView()
    private var authentication: Auth?
    private var alert: Alert?
    
    override func loadView() {
        super.loadView()
        view = registerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerView.clickDelegate = self
        registerView.configTextFieldDelegate(delegate: self)
        authentication = Auth.auth()
        alert = Alert(controller: self)
    }
}

//MARK: Extension RegisterViewClickDelegate
extension RegisterViewController: RegisterViewClickDelegate {
    func registerButtonAction() {
        let email = registerView.getEmail()
        let password = registerView.getPassword()
        
        authentication?.createUser(withEmail: email, password: password, completion: { result, error in
            if let error = error {
                self.alert?.getAlert(title: "Atenção", message: "Erro ao cadastrar. Verifique os dados informados e tente novamente", buttonTitle: "Cancelar")
                print(error.localizedDescription)
                return
            }
            
            self.alert?.getAlert(title: "Sucesso", message: "Cadastro realizado com sucesso!", buttonTitle: "Ok", completion: { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            })
        })
    }
    
    func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: Extension TextFieldDelegate
extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        registerView.textFieldValidator()
    }
}
