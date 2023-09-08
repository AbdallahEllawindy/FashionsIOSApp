//
//  Home1CollectionViewCell.swift
//  Fashions
//
//  Created by Abdallah on 4/4/23.
//

import UIKit

class Home1CollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets.
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var salePercLbl: UILabel!
    @IBOutlet weak var codLbl: UILabel!
    
    func setup(_ slide : onboardingSlide){
        img.image = slide.image
        salePercLbl.text = slide.title
        codLbl.text = slide.descreption
    }
}
