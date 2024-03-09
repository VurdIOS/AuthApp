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
            // Создаем экземпляр NSRegularExpression с использованием шаблона
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            
            // Находим совпадения в строке
            let matches = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))
            
            // Печатаем найденные совпадения
            for match in matches {
                let matchedString = (text as NSString).substring(with: match.range)
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
                case .success(let authResponse):
                    completion(true)
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(false)
                }
            }
        }
    }
}
