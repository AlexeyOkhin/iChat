//
//  UISegmentetController + Extension.swift
//  iChat
//
//  Created by Djinsolobzik on 30.07.2022.
//

import Foundation
import UIKit


extension UISegmentedControl {
    convenience init(firstName: String, secondName: String) {
        self.init()
        
        self.insertSegment(withTitle: firstName, at: 0, animated: true)
        self.insertSegment(withTitle: secondName, at: 1, animated: true)
        self.selectedSegmentIndex = 0
    }
}
