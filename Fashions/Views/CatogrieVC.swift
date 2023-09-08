//
//  CatogrieViewController.swift
//  Fashions
//
//  Created by Abdallah on 4/7/23.
//

import UIKit

class CatogrieVC: UIViewController,UICollectionViewDelegate , UICollectionViewDataSource {
    
    //MARK: - Outlets.
    @IBOutlet weak var CatogriesCV: UICollectionView!
    
    //MARK: - Propreties.
    var catogries = [onboardingSlide(title: "New Arrivals", descreption: "208 Product", image: UIImage(named: "1")!),onboardingSlide(title: "Clothes", descreption: "358 Product", image: UIImage(named: "2")!),onboardingSlide(title: "Bags", descreption: "160 Product", image: UIImage(named: "3")!),onboardingSlide(title: "Shoese", descreption: "230 Product", image: UIImage(named: "4")!),onboardingSlide(title: "Electronics", descreption: "130 Product", image: UIImage(named: "5")!),onboardingSlide(title: "Jewelry", descreption: "87 Product", image: UIImage(named: "6")!)]
    
    //MARK: - LifeCycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        CatogriesCV.delegate = self
        CatogriesCV.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        catogries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatogrieCollectionViewCell", for: indexPath) as! CatogrieCollectionViewCell
        cell.setup(catogries[indexPath.row])
        return cell
    }
    
    //MARK: - Actions.
    @IBAction func backbtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
