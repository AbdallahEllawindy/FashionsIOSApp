//
//  ViewController.swift
//  Fashions
//
//  Created by Abdallah on 4/2/23.
//

import UIKit
class ViewController: UIViewController {
    //MARK: - Outlets.
    @IBOutlet weak var loginOutlet: UIButton!
    @IBOutlet weak var signUpOutlet: UIButton!
    
    //MARK: - LifeCycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.setHidesBackButton(true, animated: true)
        loginOutlet.layer.borderWidth = 2
        loginOutlet.layer.borderColor = UIColor.white.cgColor
        signUpOutlet.layer.borderWidth = 2
        signUpOutlet.layer.borderColor = UIColor.white.cgColor
        
        
    }
    
    //MARK: - Actions.
    @IBAction func signUpAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: Views.onboardingVC) as! OnboardingVC
        navigationController?.pushViewController(vc, animated: true)
     }
    @IBAction func loginAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: Views.loginVC )as! LoginVC
        navigationController?.pushViewController(vc, animated: true)
     }
    }

