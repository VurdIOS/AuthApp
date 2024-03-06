//
//  ViewController.swift
//  AuthApp
//
//  Created by Камаль Атавалиев on 29.02.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var contentView =  LoginContentView()
    
    var viewModel: LoginViewModelProtocol
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupButtonsTarget()
    }
    //    Это не работает, вьюшка смещена, не знаю как настроить, спросить на созвоне
    //    override func loadView() {
    //        view = ContentView
    //    }
    
    init(viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupUI() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupButtonsTarget() {
        contentView.loginButton.addTarget(nil, action: #selector(loginButtonTapped), for: .touchUpInside)
        contentView.signInButton.addTarget(nil, action: #selector(signInButtonTapped), for: .touchUpInside)
    }
    private func showBanner() {
        let banner = NotificationBanner()
        banner.show(in: contentView, duration: 1.0)
    }
    
    @objc func loginButtonTapped() {
        guard let login = contentView.loginTextField.text else { return }
        guard let password = contentView.passwordTextField.text else { return }
        let userCredentials = UserCredentials(username: login, email: nil, password: password)
        
        viewModel.loginButtonTapped(user: userCredentials) { [weak self] success, errorMessage in
            if success {
                print("перешли")
            } else if let message = errorMessage {
                // Показать сообщение об ошибке
                self!.showBanner()
            }
        }
    }

    
    
    @objc func signInButtonTapped() {
        let vc = RegistrationViewController(viewModel: viewModel.getViewModelToRegistrationView())
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

