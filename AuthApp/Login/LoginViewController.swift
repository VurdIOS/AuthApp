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
        view.backgroundColor = .white
    }
    
    private func setupUI() {
        ContentView = LoginContentView()
        ContentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(ContentView)
        
        NSLayoutConstraint.activate([
            ContentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ContentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func checkAllFonts() {
        
        for family in UIFont.familyNames {
            print("Font Family: \(family)")
            for fontName in UIFont.fontNames(forFamilyName: family) {
                print("  \(fontName)")
            }
        }
    }
    
    
}

