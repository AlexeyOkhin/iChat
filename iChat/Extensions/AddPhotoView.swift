//
//  AddPhotoView.swift
//  iChat
//
//  Created by Djinsolobzik on 30.07.2022.
//

import Foundation
import UIKit

class AddPhotoView: UIView {
    let circlePhotoImageView: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "avatar")
        image.contentMode = .center
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.borderWidth = 1
       return image
    }()
    
    let plusButton: UIButton = {
        let button = UIButton(type: .system)
        let image = #imageLiteral(resourceName: "plus")
        button.setImage(image, for: .normal)
        button.tintColor = .darkButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(circlePhotoImageView)
        addSubview(plusButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            circlePhotoImageView.topAnchor.constraint(equalTo: self.topAnchor),
            circlePhotoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            circlePhotoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            circlePhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            circlePhotoImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            plusButton.leadingAnchor.constraint(equalTo: circlePhotoImageView.trailingAnchor, constant: 24),
            plusButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            plusButton.heightAnchor.constraint(equalToConstant: 30),
            plusButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        self.bottomAnchor.constraint(equalTo: circlePhotoImageView.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: plusButton.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circlePhotoImageView.layer.masksToBounds = true
        circlePhotoImageView.layer.cornerRadius = circlePhotoImageView.frame.height / 2
        
    }
}
