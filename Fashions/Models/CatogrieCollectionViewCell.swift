//
//  CatogrieCollectionViewCell.swift
//  Fashions
//
//  Created by Abdallah on 4/7/23.
//

import UIKit

class CatogrieCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets.
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var numOfProduct: UILabel!
    
    func setup(_ slide : onboardingSlide){
        img.image = slide.image
        name.text = slide.title
        numOfProduct.text = slide.descreption
    }
  
    }
    
    
    
    

