//
//  LoginViewController.swift
//  Fashions
//
//  Created by Abdallah on 4/3/23.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class LoginVC: UIViewController {
    //MARK: - Outlets.
    @IBOutlet weak var gmailBtnOutlet: UIButton!
    @IBOutlet weak var appleBtnOutlet: UIButton!
    
    //MARK: - LifeCycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        gmailBtnOutlet.layer.borderWidth = 2
        appleBtnOutlet.layer.borderWidth = 2
        appleBtnOutlet.layer.borderColor = UIColor(named: "whiteGray")?.cgColor
        gmailBtnOutlet.layer.borderColor = UIColor(named: "whiteGray")?.cgColor
    
    }
    
    //MARK: - Google Auth.
    func googleSignIn(){
    guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { res, error in
            
            guard error == nil else{
                print("error from auth")
                return
    }
            guard let user = res?.user,let idToken = user.idToken else{
                print("error in id token or user")
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { res, error in
                if let error = error {
                    print("Firebase base authentication faild with error : \(error.localizedDescription)")
                } else {
                    print("Firebase base authentication succeeded with user : \(res?.user.uid ?? "")")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: Views.homeVC) as! HomeVC
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                }
            }
        }
    }
    func emailSignIn(){
        Auth.auth().signIn(withEmail: "Abdallah@gmail.com", password: "123456789") { res, error in
          
          
//            guard error == nil else{
//                print(error)
//                return
//            }
//
//            guard let user = res?.user else{
//                print("error in user: \(error)")
//                return
//            }
//
//           print(user.email)
        
        }
    }

    //MARK: - Actions.
    @IBAction func googleSignUpBtn(_ sender: Any) {
        googleSignIn()
    }
    @IBAction func loginBtnAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: Views.succesfulVC )as! SuccesfulVC
        navigationController?.pushViewController(vc, animated: true)
    }
}
