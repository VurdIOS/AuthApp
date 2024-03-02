//
//  EyeView.swift
//  AuthApp
//
//  Created by Камаль Атавалиев on 02.03.2024.
//

import UIKit

class EyeView: UIView {
    
    var eyeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "EyeTF"), for: .normal)
        button.contentMode = .center
        button.imageView?.contentMode = .scaleAspectFit
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
        addSubview(eyeButton)
        
        NSLayoutConstraint.activate([
            eyeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            eyeButton.heightAnchor.constraint(equalToConstant: 32),
            eyeButton.widthAnchor.constraint(equalToConstant: 32),
            eyeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            eyeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

}
