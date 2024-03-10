//
//  AuthorizedViewController.swift
//  AuthApp
//
//  Created by Камаль Атавалиев on 10.03.2024.
//

import UIKit

class AuthorizedViewController: UIViewController {
    
    let WelcomeTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "С возвращением!"
        label.font = UIFont(name: "MPLUS1p-Medium", size: 24)
        label.textAlignment = .center
        return label
    }()
    
    let DescriptionTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lorby - твой личный репетитор"
        label.font = UIFont(name: "MPLUS1p-Regular", size: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "LaunchView")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let exitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выйти", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .white
        self.navigationItem.setHidesBackButton(true, animated: true)
        setupButtonsTarget()

    }
    
    private func setupUI() {
        view.addSubview(WelcomeTitle)
        view.addSubview(DescriptionTitle)
        view.addSubview(mainImage)
        view.addSubview(exitButton)
        
        NSLayoutConstraint.activate([
            WelcomeTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 118),
            WelcomeTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31),
            WelcomeTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -31),
            
            DescriptionTitle.topAnchor.constraint(equalTo: WelcomeTitle.bottomAnchor, constant: 8),
            DescriptionTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            DescriptionTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            mainImage.topAnchor.constraint(equalTo: DescriptionTitle.bottomAnchor, constant: 58),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            exitButton.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 113),
            exitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            exitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            exitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    private func setupButtonsTarget() {
        exitButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
    }

    @objc func exitButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
