//
//  LoginViewModel.swift
//  AuthApp
//
//  Created by Камаль Атавалиев on 29.02.2024.
//

import Foundation

protocol LoginViewModelProtocol {
    var access: Bool { get set }
    var onLoginResult: ((Bool, String?) -> Void)? { get set }
    func getViewModelToRegistrationView() -> RegistrationViewModelProtocol
    func loginButtonTapped(user: UserCredentials, completion: @escaping (Bool, String?) -> Void)
}


class LoginViewModel: LoginViewModelProtocol {
    var access = false
    var onLoginResult: ((Bool, String?) -> Void)?
    
    func getViewModelToRegistrationView() -> RegistrationViewModelProtocol {
        RegistrationViewModel()
    }
    
    func loginButtonTapped(user: UserCredentials, completion: @escaping (Bool, String?) -> Void) {
        NetworkLayer.shared.authenticate(userCredentials: user) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let authResponse):
                    self?.access = true
                    completion(true, nil)
                case .failure(let error):
                    self?.access = false
                    print(error.localizedDescription)
                    completion(false, error.localizedDescription)
                }
            }
        }
    }
}
