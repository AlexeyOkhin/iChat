//
//  UIlabel + Extension.swift
//  iChat
//
//  Created by Djinsolobzik on 27.07.2022.
//

import UIKit

extension UILabel {
    convenience init(name: String, font: UIFont? = .avenir20()) {
        self.init()
        self.text = name
        self.font = font
    }
}
