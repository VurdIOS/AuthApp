//
//  ViewController.swift
//  AuthApp
//
//  Created by Камаль Атавалиев on 29.02.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var ContentView =  LoginContentView()
    
    var viewModel: LoginViewModelProtocol
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupButtonsTarget()
    }
    
    init(viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupUI() {
        ContentView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.addSubview(ContentView)
  
        NSLayoutConstraint.activate([
            ContentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ContentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupButtonsTarget() {
        ContentView.loginButton.addTarget(nil, action: #selector(loginButtonTapped), for: .touchUpInside)
        ContentView.signInButton.addTarget(nil, action: #selector(signInButtonTapped), for: .touchUpInside)
    }

    @objc func loginButtonTapped() {
        let banner = NotificationBanner()
        banner.show(in: ContentView, duration: 1.0)
    }
    
    @objc func signInButtonTapped() {
        let vc = RegistrationView(viewModel: viewModel.getViewModelToRegistrationView())
        navigationController?.pushViewController(vc, animated: true)
    }

}

