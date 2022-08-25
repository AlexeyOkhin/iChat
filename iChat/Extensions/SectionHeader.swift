//
//  SectionHeader.swift
//  iChat
//
//  Created by Djinsolobzik on 25.08.2022.
//

import UIKit

class SectionHeader: UIView {
    
    static let reusedId = "SectionHeader"
    
    private let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func configure(title: String, font: UIFont, color: UIColor) {
        self.title.text = title
        self.title.font = font
        self.title.textColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

