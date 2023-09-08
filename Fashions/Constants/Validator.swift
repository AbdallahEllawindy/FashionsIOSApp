//
//  Validator.swift
//  Fashions
//
//  Created by Abdallah on 16/06/2023.
//

import Foundation

//MARK: - Singletone
class Validtor{
    private static let sharedInstance = Validtor()
    static func shared() -> Validtor {
        return Validtor.sharedInstance
    }
    
    //MARK: - Propreties
    private let format = "SELF MATCHES %@"
    
    func isValidEmail(email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let pred = NSPredicate(format: format, regex)
        return pred.evaluate(with: email)
    }
    func isValidPassword(password: String) -> Bool {
        let regex = "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}"
        let pred = NSPredicate(format: format, regex)
        return pred.evaluate(with: password)
    }
    func isValidPhone(number: String?) -> Bool {
        let regex = "^[0-9]{11}$"
        let pred = NSPredicate(format: format, regex)
        return pred.evaluate(with: number)
    }
}
