//
//  RegistrationContentView.swift
//  AuthApp
//
//  Created by Камаль Атавалиев on 03.03.2024.
//

import UIKit

enum ValidState {
    case ok
    case neutral
    case bad
}

protocol RegistrationContentViewDelegate: AnyObject {
    func check(password: String)
    func nextButtonTapped(user: UserCredentials)
}

class RegistrationContentView: UIView {
    
    weak var delegate: RegistrationContentViewDelegate?
    
    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Создать аккаунт \n Lorby"
        label.font = UIFont(name: "MPLUS1p-Medium", size: 24)!
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let mailTextField: UITextField = {
        let textField = UITextField()
        textField.text = "kamalios@mail.ru"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "MPLUS1p-Medium", size: 16)!
        textField.attributedPlaceholder = NSAttributedString(
            string: "Введи адрес почты",
            attributes: [
                NSAttributedString.Key.font: UIFont(name: "MPLUS1p-Medium", size: 16)!,
                NSAttributedString.Key.foregroundColor: UIColor.gray
            ]
        )
        
        return textField
    }()
    
    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.text = "Kamal"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "MPLUS1p-Medium", size: 16)!
        textField.attributedPlaceholder = NSAttributedString(
            string: "Придумай логин",
            attributes: [
                NSAttributedString.Key.font: UIFont(name: "MPLUS1p-Medium", size: 16)!,
                NSAttributedString.Key.foregroundColor: UIColor.gray
            ]
        )
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.text = "Kamalios123!"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "MPLUS1p-Medium", size: 16)!
        textField.isSecureTextEntry = true
        textField.attributedPlaceholder = NSAttributedString(
            string: "Создай пароль",
            attributes: [
                NSAttributedString.Key.font: UIFont(name: "MPLUS1p-Medium", size: 16)!,
                NSAttributedString.Key.foregroundColor: UIColor.gray
            ]
        )
        
        return textField
    }()
    
    let passwordCheckLenthLabel: UILabel = {
        let label = UILabel()
        label.text = "· От 8 до 15 символов"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)!
        label.textColor = .gray
        
        return label
    }()
    
    let passwordCheckRegistrLabel: UILabel = {
        let label = UILabel()
        label.text = "· Строчные и прописные буквы"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)!
        label.textColor = .gray
        
        return label
    }()
    
    let passwordCheckContainIntLabel: UILabel = {
        let label = UILabel()
        label.text = "· Минимум 1 цифра"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)!
        label.textColor = .gray
        
        return label
    }()
    
    let passwordCheckContainSpecSymbolLabel: UILabel = {
        let label = UILabel()
        label.text = "· Минимум 1 спецсимвол (!, #, $...)"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)!
        label.textColor = .gray
        
        return label
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    private let repeatPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.text = "Kamalios123!"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "MPLUS1p-Medium", size: 16)!
        textField.isSecureTextEntry = true
        textField.attributedPlaceholder = NSAttributedString(
            string: "Повтори пароль",
            attributes: [
                NSAttributedString.Key.font: UIFont(name: "MPLUS1p-Medium", size: 16)!,
                NSAttributedString.Key.foregroundColor: UIColor.gray
            ]
        )
        
        return textField
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Далее", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    //Если создать одну то где то очень жесткая утечка памяти идет
    let passwordEyeView = EyeView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    let repeatPasswordEyeView = EyeView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupTextFields()
        setupButtonsTarget()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCheckValidLabels(withStates: (ValidState, ValidState, ValidState, ValidState)) {
        let (passwordCheckLenthLabelState,
             passwordCheckRegistrLabelState,
             passwordCheckContainIntLabelState,
             passwordCheckContainSpecSymbolLabelState) = withStates
        
        setup(validLabel: passwordCheckLenthLabel, withState: passwordCheckLenthLabelState)
        setup(validLabel: passwordCheckRegistrLabel, withState: passwordCheckRegistrLabelState)
        setup(validLabel: passwordCheckContainIntLabel, withState: passwordCheckContainIntLabelState)
        setup(validLabel: passwordCheckContainSpecSymbolLabel, withState: passwordCheckContainSpecSymbolLabelState)
    }
    

    #warning("Придумать логику при которой будут bad values приходить при нажатии на кнопку")
    private func setup(validLabel: UILabel, withState: ValidState) {
        switch withState {
        case .ok:
            if validLabel.text?.last != "✅" {
                validLabel.text?.append("✅")
                validLabel.textColor = .green
            }
    
        case .neutral:
            if validLabel.text?.last == "✅" || validLabel.text?.last == "❌" {
                validLabel.text?.removeLast()
                validLabel.textColor = .gray
            }
        case .bad:
            if validLabel.text?.last != "❌" {
                validLabel.text?.append("❌")
                validLabel.textColor = .red
            }
        }
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(mailTextField)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(stackView)
        stackView.addArrangedSubview(passwordCheckLenthLabel)
        stackView.addArrangedSubview(passwordCheckRegistrLabel)
        stackView.addArrangedSubview(passwordCheckContainIntLabel)
        stackView.addArrangedSubview(passwordCheckContainSpecSymbolLabel)
        addSubview(repeatPasswordTextField)
        addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 51),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -51),
            titleLabel.heightAnchor.constraint(equalToConstant: 70),
            
            mailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            mailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            mailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            mailTextField.heightAnchor.constraint(equalToConstant: 52),
            
            loginTextField.topAnchor.constraint(equalTo: mailTextField.bottomAnchor, constant: 14),
            loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            loginTextField.heightAnchor.constraint(equalToConstant: 52),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 14),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 52),
            
            stackView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 80),
            
            repeatPasswordTextField.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 14),
            repeatPasswordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            repeatPasswordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 52),
            
            nextButton.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: 24),
            nextButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            nextButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            nextButton.heightAnchor.constraint(equalToConstant: 52),
            
        ])
    }
    
    private func setupTextFields() {
        let textFieldsHeight = passwordTextField.frame.height
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textFieldsHeight))
        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textFieldsHeight))
        let paddingView3 = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textFieldsHeight))
        let paddingView4 = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textFieldsHeight))
        
        mailTextField.leftView = paddingView
        mailTextField.leftViewMode = .always
        
        loginTextField.leftView = paddingView2
        loginTextField.leftViewMode = .always
        
        passwordTextField.leftView = paddingView3
        passwordTextField.leftViewMode = .always
        
        passwordTextField.rightView = passwordEyeView
        passwordTextField.rightViewMode = .always
        
        repeatPasswordTextField.leftView = paddingView4
        repeatPasswordTextField.leftViewMode = .always
        
        repeatPasswordTextField.rightView = repeatPasswordEyeView
        repeatPasswordTextField.rightViewMode = .always
        
    }
    
    private func setupButtonsTarget() {
        passwordTextField.addTarget(self, action: #selector(passwordChanged), for: .editingChanged)
        passwordEyeView.eyeButton.addTarget(nil, action: #selector(passwordEyeViewTapped), for: .touchUpInside)
        repeatPasswordEyeView.eyeButton.addTarget(nil, action: #selector(repeatPasswordEyeViewTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    @objc func passwordEyeViewTapped() {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc func repeatPasswordEyeViewTapped() {
        repeatPasswordTextField.isSecureTextEntry.toggle()
    }
    
    @objc func passwordChanged(_ textField: UITextField) {
        if let password = textField.text {
            delegate?.check(password: password)
        }
    }
    
    //TODO: Убрать force unwrap
    @objc func nextButtonTapped() {
        let user = UserCredentials(username: loginTextField.text!, email: mailTextField.text!, password: passwordTextField.text!)
        delegate?.nextButtonTapped(user: user)
    }
}

