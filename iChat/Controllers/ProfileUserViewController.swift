//// ProfileUserViewController.swift
// Created by Alexey Okhin for iChat on 14.09.2022.
// Using Swift 5.0
// 
//  Copyright © 2022 by iOS Dev. All rights reserved.

import UIKit

class ProfileUserViewController: UIViewController {
    
    let imageUser = UIImageView(image: #imageLiteral(resourceName: "human5"), contentMode: .scaleAspectFill)
    let containerView = UIView()
    let nameLabel = UILabel(name: "Bna Dona", font: .systemFont(ofSize: 20, weight: .light))
    let descriptionLabel = UILabel(name: "param pam pam super popular text", font: .systemFont(ofSize: 16, weight: .light))
    let messageTextfield = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeElements()
        setupConsraints()

    }
}

private extension ProfileUserViewController {
    func customizeElements() {
        imageUser.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        messageTextfield.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.backgroundColor = .mainWhite()
        containerView.layer.cornerRadius = 30
        
        descriptionLabel.numberOfLines = 0
        
        messageTextfield.borderStyle = .roundedRect
    }
    
    func setupConsraints() {
        
        view.addSubview(imageUser)
        view.addSubview(containerView)
        
        containerView.addSubview(nameLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(messageTextfield)
        
        NSLayoutConstraint.activate([
            imageUser.topAnchor.constraint(equalTo: view.topAnchor),
            imageUser.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageUser.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageUser.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 206)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 35),
            nameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 24),
            nameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -24),
        ])

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
        ])

        NSLayoutConstraint.activate([
            messageTextfield.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            messageTextfield.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            messageTextfield.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            messageTextfield.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

//MARK: - SwiftUi Canvas
import SwiftUI

struct ProfileUserProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all).previewInterfaceOrientation(.portrait)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = ProfileUserViewController()
        func makeUIViewController(context: Context) -> ProfileUserViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
