//
//  simpleAnchor.swift
//  StudyApp
//
//  Created by Melisa Efe on 21.01.20.
//  Copyright © 2020 mefex001. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor, leading: NSLayoutXAxisAnchor, bottom: NSLayoutYAxisAnchor, trailing: NSLayoutXAxisAnchor) {
        translatesAutoresizingMaskIntoConstraints = false
        
        topAnchor.constraint(equalTo: top).isActive = true
        leadingAnchor.constraint(equalTo: leading).isActive = true
        bottomAnchor.constraint(equalTo: bottom).isActive = true
        trailingAnchor.constraint(equalTo: trailing).isActive = true
    
    }
    
    func anchor(top: NSLayoutYAxisAnchor, leading: NSLayoutXAxisAnchor, bottom: NSLayoutYAxisAnchor, trailing: NSLayoutXAxisAnchor, topPadding: CGFloat, leadingPadding: CGFloat, bottomPadding: CGFloat, trailingPadding: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
        leadingAnchor.constraint(equalTo: leading, constant: leadingPadding).isActive = true
        bottomAnchor.constraint(equalTo: bottom, constant: bottomPadding).isActive = true
        trailingAnchor.constraint(equalTo: trailing, constant: trailingPadding).isActive = true
    
    }
    
    func anchor(height: NSLayoutDimension, width: NSLayoutDimension, heightMultiplier: CGFloat, widthMultiplier: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: height, multiplier: heightMultiplier).isActive = true
        widthAnchor.constraint(equalTo: width, multiplier: widthMultiplier).isActive = true
    
    }
    
    func center(centerX: NSLayoutXAxisAnchor, centerY: NSLayoutYAxisAnchor){
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: centerX).isActive = true
        centerYAnchor.constraint(equalTo: centerY).isActive = true
    }
    
}
