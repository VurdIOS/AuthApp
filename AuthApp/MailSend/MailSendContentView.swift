//
//  MailSendContentView.swift
//  AuthApp
//
//  Created by Камаль Атавалиев on 05.03.2024.
//

import UIKit

class MailSendContentView: UIView {
 
     lazy var mailTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "MPLUS1p-Medium", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let checkSpamTitle: UILabel = {
        let label = UILabel()
        label.text = "Если письмо не пришло, не спеши ждать совиную почту - лучше проверь ящик “Спам” \n \n (´｡• ω •｡`)"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "MailSendImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let repeatMailButton: UIButton = {
        let button = UIButton()
        button.setTitle("Письмо не пришло", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(mailTitle)
        addSubview(checkSpamTitle)
        addSubview(mainImage)
        addSubview(repeatMailButton)
        
        NSLayoutConstraint.activate([
            mailTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 36),
            mailTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 31),
            mailTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -31),
            
            checkSpamTitle.topAnchor.constraint(equalTo: mailTitle.bottomAnchor, constant: 24),
            checkSpamTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 31),
            checkSpamTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -31),
            
            mainImage.topAnchor.constraint(equalTo: checkSpamTitle.bottomAnchor, constant: 58),
            mainImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 75),
            mainImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -75),
            
            repeatMailButton.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 56),
            repeatMailButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            repeatMailButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            repeatMailButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    

}
