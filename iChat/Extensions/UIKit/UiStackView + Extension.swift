//
//  UiStackView + Extension.swift
//  iChat
//
//  Created by Djinsolobzik on 27.07.2022.
//

import UIKit
import SwiftUI

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat ) {
        self.init(arrangedSubviews: arrangedSubviews)
        
        self.axis = axis
        self.spacing = spacing
    }
}
