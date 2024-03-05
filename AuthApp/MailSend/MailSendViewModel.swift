//
//  MailSendViewModel.swift
//  AuthApp
//
//  Created by Камаль Атавалиев on 05.03.2024.
//

import Foundation

protocol MailSendViewModelProtocol {
    var mail: String { get }
    init(mail: String)
}


class MailSendViewModel: MailSendViewModelProtocol {
    var mail: String
    
    required init(mail: String) {
        self.mail = mail
    }
}
