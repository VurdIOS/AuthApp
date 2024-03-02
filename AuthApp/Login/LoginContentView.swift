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
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "MPLUS1p-Medium", size: 16)!
        textField.attributedPlaceholder = NSAttributedString(
            string: "Введи туда-сюда логин",
            attributes: [
                NSAttributedString.Key.font: UIFont(name: "MPLUS1p-Medium", size: 16)!,
                NSAttributedString.Key.foregroundColor: UIColor.gray
            ]
        )
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль (тоже введи)"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "MPLUS1p-Medium", size: 16)!
        textField.isSecureTextEntry = true
        textField.attributedPlaceholder = NSAttributedString(
            string: "Пароль (тоже введи)",
            attributes: [
                NSAttributedString.Key.font: UIFont(name: "MPLUS1p-Medium", size: 16)!,
                NSAttributedString.Key.foregroundColor: UIColor.gray
            ]
        )

        return textField
    }()
    
     let eyeView = EyeView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    
     let loginButton: UIButton = {
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupTextFields()
        setupButtonsTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTextFields() {
        let textFieldsHeight = passwordTextField.frame.height
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textFieldsHeight))
        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textFieldsHeight))

        loginTextField.leftView = paddingView
        loginTextField.leftViewMode = .always
        
        passwordTextField.leftView = paddingView2
        passwordTextField.leftViewMode = .always
        
        passwordTextField.rightView = eyeView
        passwordTextField.rightViewMode = .always

    }
    
    private func setupButtonsTarget() {
        eyeView.eyeButton.addTarget(nil, action: #selector(eyeButtonTapped), for: .touchUpInside)
    }
    
    @objc func eyeButtonTapped() {
        passwordTextField.isSecureTextEntry.toggle()
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
