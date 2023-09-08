//
//  onboardingCollectionViewCell.swift
//  Fashions
//
//  Created by Abdallah on 4/2/23.
//

import UIKit

class onboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var titelLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setup(_ slide : onboardingSlide){
        cellImg.image = slide.image
        titelLbl.text = slide.title
        descriptionLbl.text = slide.descreption
    }
}
