//
//  RegistrationView.swift
//  AuthApp
//
//  Created by Камаль Атавалиев on 03.03.2024.
//

import UIKit

class RegistrationViewController: UIViewController {
    private var contentView =  RegistrationContentView()
    
    var viewModel: RegistrationViewModelProtocol
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupButtonsTarget()
        contentView.delegate = self
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
    }
    
    private func showBanner(withMessage: String) {
        let banner = NotificationBanner()
        banner.show(in: contentView, withMessage: withMessage, duration: 1.0)
    }



}


extension RegistrationViewController: RegistrationContentViewDelegate {
    func check(password: String) {
        contentView.setupCheckValidLabels(withStates: viewModel.check(password: password))

    }
    
    func nextButtonTapped(user: UserCredentials) {
        viewModel.nextButtonTapped(user: user) { [unowned self] result in
            if result {
                let viewController = MailSendViewController(viewModel: self.viewModel.getViewModelMailSendViewController(withMail: user.email!))
                self.navigationController?.pushViewController(viewController, animated: true)
            } else {
                showBanner(withMessage: "Вы ввели не правильные данные или такой пользователь уже существует")
            }
        }
        
    }
    
    
    
}
