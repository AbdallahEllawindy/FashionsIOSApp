//
//  Home.swift
//  Fashions
//
//  Created by Abdallah on 4/4/23.
//

import UIKit

class HomeVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource{
    
    //MARK: - Outlets.
    @IBOutlet weak var CollectionView1: UICollectionView!
    @IBOutlet weak var CollectionView2: UICollectionView!
    
    //MARK: - Propreties.
    var slides = [onboardingSlide(title: "50% Off ", descreption: "With code:FSCREATION", image:UIImage(named: "homeCell")!),onboardingSlide(title: "50% Off ", descreption: "With code:FSCREATION", image:UIImage(named: "homeCell")!),onboardingSlide(title: "50% Off ", descreption: "With code:FSCREATION", image:UIImage(named: "homeCell")!)]
    var newArrivalSlide = [NewArrival(name: "The Marc Jacobs", descreption: " Traveler Tote", price: " $195.00", image: UIImage(named: "bag")!),NewArrival(name: "The Marc Jacobs", descreption: " Traveler Tote", price: " $195.00", image: UIImage(named: "bag")!),NewArrival(name: "The Marc Jacobs", descreption: " Traveler Tote", price: " $195.00", image: UIImage(named: "bag")!),NewArrival(name: "The Marc Jacobs", descreption: " Traveler Tote", price: " $195.00", image: UIImage(named: "bag")!)]
    
    //MARK: - lifeCycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        CollectionView1.dataSource = self
        CollectionView1.delegate = self
        CollectionView2.dataSource = self
        CollectionView2.delegate = self
        
        let def = UserDefaults.standard
        def.set(true , forKey: UserDefaultsKeys.isUserLoggedIn)
    }
    
    //MARK: - collectionView.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == CollectionView1 {
            return slides.count
        } else {
            return newArrivalSlide.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == CollectionView1 {
            let cell = CollectionView1.dequeueReusableCell(withReuseIdentifier: "Home1CollectionViewCell", for: indexPath) as! Home1CollectionViewCell
            cell.setup(slides[indexPath.row])
            return cell
        } else {
            let cell = CollectionView2.dequeueReusableCell(withReuseIdentifier: "NewArrivalCollectionViewCell", for: indexPath) as! NewArrivalCollectionViewCell
            cell.setup(newArrivalSlide[indexPath.row])
            return cell
        }
    }
    
    //MARK: - Actions.
    @IBAction func catogriesBtnAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: Views.catogrieVC) as! CatogrieVC
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func logOutBtnTapped(_ sender: Any) {
        let def = UserDefaults.standard
        def.setValue(false, forKey: UserDefaultsKeys.isUserLoggedIn)
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            let vc = storyboard?.instantiateViewController(identifier: Views.loginVC) as! LoginVC
            appDelegate.window?.rootViewController = vc
            navigationController?.pushViewController(vc , animated: true)
        }
    }
}


