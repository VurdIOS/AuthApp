//
//  RegistrationViewModel.swift
//  AuthApp
//
//  Created by Камаль Атавалиев on 03.03.2024.
//

import Foundation

protocol RegistrationViewModelProtocol {
    func check(password: String) -> (passwordCheckLenthLabel: ValidState, passwordCheckRegistrLabel: ValidState, passwordCheckContainIntLabel: ValidState, passwordCheckContainSpecSymbolLabel: ValidState)
    func getViewModelMailSendViewController(withMail: String) -> MailSendViewModelProtocol
    func nextButtonTapped(user: UserCredentials, completion: @escaping (Bool) -> Void)

}

class RegistrationViewModel: RegistrationViewModelProtocol {
    func getViewModelMailSendViewController(withMail: String) -> MailSendViewModelProtocol {
        MailSendViewModel(mail: withMail)
    }
    
    func check(password: String) -> (passwordCheckLenthLabel: ValidState, passwordCheckRegistrLabel: ValidState, passwordCheckContainIntLabel: ValidState, passwordCheckContainSpecSymbolLabel: ValidState) {
        let CheckLenthPattern = "^.{8,15}$"
        let CheckRegistrPattern = "(?=.*[a-z])(?=.*[A-Z]).{1,}"
        let CheckContainIntPattern = "(?=.*\\d).{1,}"
        let CheckContainSpecSymbolPattern = "(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?]).{1,}"
        
        return (
            checkRegex(text: password, pattern: CheckLenthPattern),
            checkRegex(text: password, pattern: CheckRegistrPattern),
            checkRegex(text: password, pattern: CheckContainIntPattern),
            checkRegex(text: password, pattern: CheckContainSpecSymbolPattern)
        )
    }
    
    private func checkRegex(text: String, pattern: String) -> ValidState {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            
            let matches = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))
            
            for _ in matches {
                return .ok
            }
        } catch {
            return .bad
        }
        return .neutral
    }
    
    func nextButtonTapped(user: UserCredentials, completion: @escaping (Bool) -> Void) {
        NetworkLayer.shared.register(userCredentials: user ) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    completion(true)
                case .failure(_):
                    completion(false)
                }
            }
        }
    }
}
