//
//  LoginAlert.swift
//  AuthApp
//
//  Created by Камаль Атавалиев on 02.03.2024.
//

import UIKit

class NotificationBanner: UIView {
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Неверный логин или пароль"
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            messageLabel.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
    
    func show(in view: UIView, duration: TimeInterval) {
        view.addSubview(self)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -50),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        view.layoutIfNeeded()
        
        // Анимация появления
        UIView.animate(withDuration: 0.5, animations: {
            self.transform = CGAffineTransform(translationX: 0, y: 50)
        }) { _ in
            // Анимация исчезновения после задержки
            UIView.animate(withDuration: 0.5, delay: duration, options: [], animations: {
                self.transform = CGAffineTransform(translationX: 0, y: -50)
            }) { _ in
                self.removeFromSuperview()
            }
        }
    }
}
