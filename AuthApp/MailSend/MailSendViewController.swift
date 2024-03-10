//
//  MailSendViewController.swift
//  AuthApp
//
//  Created by Камаль Атавалиев on 05.03.2024.
//

import UIKit

class MailSendViewController: UIViewController {
    
    let viewModel: MailSendViewModelProtocol
    
    let contentView = MailSendContentView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupButtonsTarget()
        title = "Регистрация"
    }
     
    init(viewModel: MailSendViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    private func setupUI() {
        contentView.mailTitle.text = "Выслали письмо со ссылкой для завершения регистрации на \(viewModel.mail)"
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
        contentView.repeatMailButton.addTarget(self, action: #selector(repeatMailButtonTapped), for: .touchUpInside)
    }
    
    @objc func repeatMailButtonTapped() {
        print("Не получил письмо")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
