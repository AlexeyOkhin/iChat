//
//  UIImageView + Extension.swift
//  iChat
//
//  Created by Djinsolobzik on 27.07.2022.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage, contentMode: ContentMode) {
        self.init()
        self.image = image
        self.contentMode = contentMode
    }
}
