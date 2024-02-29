//
//  LoginView.swift
//  AuthApp
//
//  Created by Камаль Атавалиев on 29.02.2024.
//

import UIKit

class LoginContentView: UIView {
    private let mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "LoginImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let welcomeTitle: UILabel = {
        let label = UILabel()
        label.text = "Вэлком бэк!"
        label.textAlignment = .center
        label.font = UIFont(name: "MPLUS1p-Medium", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введи туда-сюда логин"
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль (тоже введи)"
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("У меня еще нет аккаунта", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(mainImage)
        addSubview(welcomeTitle)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(signInButton)
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: self.topAnchor),
            mainImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mainImage.widthAnchor.constraint(equalToConstant: 186),
            mainImage.heightAnchor.constraint(equalToConstant: 194),
            
            welcomeTitle.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 31),
            welcomeTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            welcomeTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            welcomeTitle.heightAnchor.constraint(equalToConstant: 32),
            
            loginTextField.topAnchor.constraint(equalTo: welcomeTitle.bottomAnchor, constant: 28),
            loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            loginTextField.heightAnchor.constraint(equalToConstant: 52),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 14),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 52),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 24),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            signInButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 28),
            signInButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            signInButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
