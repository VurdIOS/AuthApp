//
//  RegistrationViewModel.swift
//  AuthApp
//
//  Created by Камаль Атавалиев on 03.03.2024.
//

import Foundation

protocol RegistrationViewModelProtocol {
    func check(password: String) -> (passwordCheckLenthLabel: Bool, passwordCheckRegistrLabel: Bool, passwordCheckContainIntLabel: Bool, passwordCheckContainSpecSymbolLabel: Bool)

}


class RegistrationViewModel: RegistrationViewModelProtocol {
    
    func check(password: String) -> (passwordCheckLenthLabel: Bool, passwordCheckRegistrLabel: Bool, passwordCheckContainIntLabel: Bool, passwordCheckContainSpecSymbolLabel: Bool) {
        return (true, true, false, true)
    }
}
