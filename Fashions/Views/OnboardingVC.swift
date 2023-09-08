//
//  OnboardingViewController.swift
//  Fashions
//
//  Created by Abdallah on 4/2/23.
//

import UIKit

class OnboardingVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtnOutlet: UIButton!
    
    var slides: [onboardingSlide] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1{
            }

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = [onboardingSlide(title: "20% Discount New Arrival Product", descreption: "Publish up your selfies to make yourself more beautiful with this app.", image: UIImage(named: "onboarding1")!),onboardingSlide(title: "Take Advantage Of The Offer Shopping", descreption: "Publish up your selfies to make yourself more beautiful with this app.", image: UIImage(named: "onboarding2")!),onboardingSlide(title: "All Types Offers Within Your Reach", descreption: "Publish up your selfies to make yourself more beautiful with this app.", image: UIImage(named: "onboarding3")!)]
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {
        if currentPage == slides.count - 1 {
                        let vc = storyboard?.instantiateViewController(withIdentifier: Views.signUpVC) as! SignUpVC
                        navigationController?.pushViewController(vc, animated: true)
            
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}


extension OnboardingVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onboardingCollectionViewCell", for: indexPath) as! onboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
//        pageControl.currentPage = currentPage
    }
}
