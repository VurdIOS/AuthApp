//
//  RegistrationView.swift
//  AuthApp
//
//  Created by Камаль Атавалиев on 03.03.2024.
//

import UIKit

class RegistrationView: UIViewController {
    private var ContentView =  RegistrationContentView()
    
    var viewModel: RegistrationViewModelProtocol
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupButtonsTarget()
        ContentView.delegate = self
    }
    init(viewModel: RegistrationViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        title = "Регистрация"
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
    }



}


extension RegistrationView: RegistrationContentViewDelegate {
    func check(password: String) {
        let (passwordCheckLenthLabel, passwordCheckRegistrLabel, passwordCheckContainIntLabel, passwordCheckContainSpecSymbolLabel) = viewModel.check(password: password)
        if passwordCheckLenthLabel {
            ContentView.passwordCheckLenthLabel.textColor = .green
        }
        if passwordCheckRegistrLabel {
            ContentView.passwordCheckRegistrLabel.textColor = .green
        }
        if passwordCheckContainIntLabel {
            ContentView.passwordCheckContainIntLabel.textColor = .green
        }
        if passwordCheckContainSpecSymbolLabel {
            ContentView.passwordCheckContainSpecSymbolLabel.textColor = .green
        }
    }
    
    
    
}
