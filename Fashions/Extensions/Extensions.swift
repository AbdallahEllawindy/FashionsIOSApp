//
//  Extensions.swift
//  Fashions
//
//  Created by Abdallah on 4/2/23.
//

import UIKit

extension UIView {
  @IBInspectable  var cornerRadius : CGFloat {
        get{
            return cornerRadius
        }
        set {
        self.layer.cornerRadius = newValue
    }
  }
}

extension  UITextField {
    @IBInspectable var underLineTf: Bool {
        get {
            return false
        }
        set {
            let underLineLayer = CALayer()
            underLineLayer.frame = CGRect(x: 0, y: self.frame.height - 1 , width: self.frame.width , height: 1 )
            underLineLayer.backgroundColor = UIColor(named: "whiteGray")?.cgColor
            self.borderStyle = .none
            self.layer.addSublayer(underLineLayer)
        }
    }
    @IBInspectable var endIcon : UIImage {
        get {
            return disabledBackground!
        }
        set(value) {
            let iconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            iconView.image = value
            self.rightView = iconView
            self.rightViewMode = .always
        }
    }
}
