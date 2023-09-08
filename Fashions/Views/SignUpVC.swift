//
//  SignUpViewController.swift
//  Fashions
//
//  Created by Abdallah on 4/3/23.
//

import UIKit
import SQLite

class SignUpVC: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    //MARK: - Properties.
//   var userName: String = ""
//    var email: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    var database:Connection!
    
    
    //MARK: - Table Properties.
    let userTable: Table = Table("Users")
    let id = Expression<Int>("ID")
    let name = Expression<String>("Name")
    let email = Expression<String>("Email")
    
    //MARK: - LifeCycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    //MARK: - Validation
    private func isDataEnterd() -> Bool {
        guard userNameTextField.text != ""  else {
            showAlert(message: "Please, Enter User Name")
            return false
        }
        guard emailTextField.text != ""  else {
            showAlert(message: "Please, Enter Email")
            return false
        }
        guard passwordTextField.text != ""  else {
            showAlert(message: "Please, Enter Password")
            return false
        }
        guard confirmPasswordTextField.text != ""  else {
            showAlert(message: "Please, Confirm Password")
            return false
        }
        return true
    }
    
    private func isDataValid() -> Bool {
        guard Validtor.shared().isValidEmail(email: emailTextField.text!) else {
            showAlert (message: "please, Enter Vaild Email. Exmaple: mail@exmaple.com")
            return false
        }
        guard Validtor.shared().isValidPassword(password: passwordTextField.text!) else {
            showAlert (message: "Please, Enter Vaild Password. Example: Aa123456")
            return false
        }
        return true
    }
    private func isDataCorrect()->Bool{
        if  passwordTextField.text == confirmPasswordTextField.text {
            return true
        } else {
            showAlert(message: "Please Enter The Same Password")
            return false
        }
    }
    
    //MARK: - Actions.
    @IBAction func loginBtnAction(_ sender: Any) {
    if isDataEnterd() {
      if isDataValid() {
        if isDataCorrect(){
                   // insertUser()
                    let vc = storyboard?.instantiateViewController(withIdentifier: Views.succesfulVC )as! SuccesfulVC
                    navigationController?.pushViewController(vc, animated: true)
          }
        }
      }
    }
  }

//MARK: - Extension.
//extension SignUpVC{
//    private func setupConnection(){
//        do{
//            let documentDirectory = try FileManager.default.url(for: .documentDirectory
//                                                                , in: .userDomainMask ,
//                                                                appropriateFor: nil,
//                                                                create: true)
//            let filePath = documentDirectory.appendingPathComponent("UsersDataBase").appendingPathExtension("sqlite3")
//            let database = try Connection(filePath.path)
//            self.database = database
//        }catch{
//            print(error.localizedDescription)
//        }
//    }
//    private func createTable(){
//        let createTable = self.userTable.create { table in
//            table.column(self.id, primaryKey: true)
//            table.column(self.name)
//            table.column(self.email, unique: true)
//        }
//        do {
//            try self.database.run(createTable)
//            print("Table Created")
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//    private func insertUser(){
//        guard let name = userNameTextField.text , let email = emailTextField.text else { return
//        }
//        let insertUser = self.userTable.insert(self.name <- name ,
//                                               self.email <- email)
//        do {
//            try self.database.run(insertUser)
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//}
