//
//  ViewController.swift
//  AuthApp
//
//  Created by Камаль Атавалиев on 29.02.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var ContentView: LoginContentView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupButtonsTarget()
    }
    
    private func setupUI() {
        ContentView = LoginContentView()
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
    }

    @objc func loginButtonTapped() {
        let banner = NotificationBanner()
        banner.show(in: ContentView, duration: 1.0)
    }

}

