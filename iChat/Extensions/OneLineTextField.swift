//
//  OneLineTextField.swift
//  iChat
//
//  Created by Djinsolobzik on 27.07.2022.
//

import UIKit

class OneLineTextField: UITextField {
    convenience init(font: UIFont? = .avenir20()) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = font
        self.borderStyle = .none
        
        let bottomBorder = UIView(frame: .zero)
        bottomBorder.backgroundColor = .bottomBorderTextField()
        bottomBorder.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(bottomBorder)
        
        NSLayoutConstraint.activate([
            bottomBorder.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomBorder.leftAnchor.constraint(equalTo: self.leftAnchor),
            bottomBorder.rightAnchor.constraint(equalTo: self.rightAnchor),
            bottomBorder.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        
        
        
        
    }
}
