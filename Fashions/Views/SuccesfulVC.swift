//
//  SuccesfulViewController.swift
//  Fashions
//
//  Created by Abdallah on 4/3/23.
//

import UIKit

class SuccesfulVC: UIViewController {
    
    //MARK: - LifeCycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    //MARK: - Actions.
    @IBAction func successfulBtnAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: Views.homeVC) as! HomeVC
        navigationController?.pushViewController(vc, animated: true )
    }
}
