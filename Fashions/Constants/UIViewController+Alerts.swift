//
//  Ui.swift
//  Fashions
//
//  Created by Abdallah on 16/06/2023.
//

import UIKit
extension UIViewController{
    func showAlert(message:String){
         let alert = UIAlertController(title: "sorry", message: message, preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "okay", style: .cancel))
         self.present(alert, animated: true)
     }
}
