//
//  RegisterView.swift
//  Login
//
//  Created by Thaina da Silva Ebert on 27/08/22.
//

import UIKit

protocol RegisterViewClickDelegate: AnyObject {
    func backButtonAction()
    func registerButtonAction()
}

class RegisterView: UIView {
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var topImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "user")?.withTintColor(.darkGray, renderingMode: .alwaysTemplate)
        image.contentMode = .scaleAspectFit
        image.tintColor = UIColor(red: 252/255, green: 248/255, blue: 232/255, alpha: 1.0)
        return image
    }()
    
    private lazy var emailTextField: UITextField = {
        let textFiel = UITextField()
        textFiel.translatesAutoresizingMaskIntoConstraints = false
        textFiel.autocorrectionType = .no
        textFiel.backgroundColor = .white
        textFiel.borderStyle = .roundedRect
        textFiel.font = .systemFont(ofSize: 14)
        textFiel.textColor = .darkGray
        textFiel.placeholder = "Digite seu e-mail"
        textFiel.keyboardType = .emailAddress
        return textFiel
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textFiel = UITextField()
        textFiel.translatesAutoresizingMaskIntoConstraints = false
        textFiel.autocorrectionType = .no
        textFiel.backgroundColor = .white
        textFiel.borderStyle = .roundedRect
        textFiel.font = .systemFont(ofSize: 14)
        textFiel.textColor = .darkGray
        textFiel.placeholder = "Digite sua senha"
        textFiel.keyboardType = .default
        textFiel.isSecureTextEntry = true
        return textFiel
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.setTitleColor(UIColor(red: 252/255, green: 248/255, blue: 232/255, alpha: 1.0), for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    weak var clickDelegate: RegisterViewClickDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = UIColor(red: 148/255, green: 180/255, blue: 159/255, alpha: 1.0)
        addSubview(topImageView)
        addSubview(backButton)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(registerButton)
        
        setupConstraints()
        configButtonEnable(false)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            topImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            topImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            topImageView.heightAnchor.constraint(equalToConstant: 150),
            topImageView.widthAnchor.constraint(equalToConstant: 150),
            
            backButton.topAnchor.constraint(equalTo: topImageView.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            backButton.widthAnchor.constraint(equalToConstant: 24),
            
            emailTextField.topAnchor.constraint(equalTo: topImageView.bottomAnchor, constant: 32),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 48),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            registerButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            registerButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
        ])
    }
    
    @objc private func tappedBackButton() {
        clickDelegate?.backButtonAction()
    }
    
    @objc private func tappedRegisterButton() {
        clickDelegate?.registerButtonAction()
    }
    
    func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    func textFieldValidator() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            configButtonEnable(true)
            return
        }
        configButtonEnable(false)
    }
    
    func getEmail() -> String {
        guard let email = emailTextField.text else { return "" }
        return email
    }
    
    func getPassword() -> String {
        guard let password = passwordTextField.text else { return "" }
        return password
    }
    
    private func configButtonEnable(_ enable: Bool) {
        if enable {
            registerButton.setTitleColor(UIColor(red: 252/255, green: 248/255, blue: 232/255, alpha: 1.0), for: .normal)
            registerButton.isEnabled = true
            return
        }
        registerButton.setTitleColor(.lightGray, for: .normal)
        registerButton.isEnabled = false
    }

}
