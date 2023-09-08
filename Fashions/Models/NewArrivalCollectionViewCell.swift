//
//  NewArrivalCollectionViewCell.swift
//  Fashions
//
//  Created by Abdallah on 4/6/23.
//

import UIKit

class NewArrivalCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets.
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var describtion: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    
    func setup(_ slide : NewArrival){
        img.image = slide.image
        priceLbl.text = slide.price
        describtion.text = slide.descreption
        nameLbl.text = slide.name
    }
}
