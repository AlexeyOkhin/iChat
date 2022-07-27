//
//  UIButton + Extension.swift
//  iChat
//
//  Created by Djinsolobzik on 27.07.2022.
//

import UIKit

extension UIButton {
    convenience init(
        title: String,
        backgroundCollor: UIColor,
        titleColor: UIColor,
        font: UIFont? = .avenir20(),
        isShadow: Bool,
        cornerRadius: CGFloat = 4)
    {
        
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundCollor
        self.titleLabel?.font = font
        
        self.layer.cornerRadius = cornerRadius
        
        if isShadow {
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 8)
            
        }
    }
}
