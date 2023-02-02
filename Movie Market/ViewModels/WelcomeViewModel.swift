//
//  ViewModel.swift
//  Movie Market
//
//  Created by Julian Marzabal on 15/01/2023.
//

import Foundation

protocol WelcomeViewDelegate: AnyObject {
    func onSuccess()
        
    
}
class WelcomeViewModel {
    weak var delegate: WelcomeViewDelegate?
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func onSuccessEmail() {
        print("we do that")
        delegate?.onSuccess()
    }
    
    
}
