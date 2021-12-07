//
//  simpleShadow.swift
//  fortis_app
//
//  Created by Melisa on 08.11.21.
//

import UIKit

extension UIView {
 
    func setShadow(color: UIColor, opacity: Float, offsetWidth: CGFloat, offsetHeight: CGFloat, radius: CGFloat){
        
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize(width: offsetWidth, height: offsetHeight)
        layer.shadowRadius = radius
        
    }
    
    func setStackProperties(stack: UIStackView, alignment: String, distribution: String){
        
        if alignment == "c" {
            stack.alignment = .center
        }
        else if alignment == "f" {
            stack.alignment = .fill
        }
        else if alignment == "t" {
            stack.alignment = .top
        }
        
        
        if distribution == "fe" {
            stack.distribution = .fillEqually
        }
        else if distribution == "es" {
            stack.distribution = .equalSpacing
        }
        
    }
    
}
    
