//
//  SetupProfileViewController.swift
//  iChat
//
//  Created by Djinsolobzik on 29.07.2022.
//

import UIKit

class SetupProfileViewController: UIViewController {
    
    let setUpLabel = UILabel(name: "Set up Profile", font: .avenir26())
    let photoView = AddPhotoView()
    
    let fullNameLabel = UILabel(name: "Full name")
    let aboutMeLabel = UILabel(name: "About me")
    let sexLabel = UILabel(name: "Sex")
    
    let fullNameTextField = OneLineTextField(font: .avenir20())
    let aboutMeTextField = OneLineTextField(font: .avenir20())
    
    let sexSegmentedController = UISegmentedControl(firstName: "Female", secondName: "Male")
    
    let goToChatButton = UIButton(title: "Go to chat", backgroundCollor: .darkButton(), titleColor: .white, isShadow: false)


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainWhite()
        setupConstraints()
    }
    
}



//MARK: - setup constraints

extension SetupProfileViewController {
    private func setupConstraints() {
        setUpLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(setUpLabel)
        
        NSLayoutConstraint.activate([
            setUpLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 160),
            setUpLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        photoView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(photoView)
        
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: setUpLabel.bottomAnchor, constant: 40),
            photoView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let fullNameStackView = UIStackView(arrangedSubviews: [fullNameLabel, fullNameTextField], axis: .vertical, spacing: 0)
        let aboutMeStackView = UIStackView(arrangedSubviews: [aboutMeLabel, aboutMeTextField], axis: .vertical, spacing: 0)
        
        let sexStackView = UIStackView(arrangedSubviews: [sexLabel, sexSegmentedController], axis: .vertical, spacing: 10)
        
        goToChatButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let mainStackView = UIStackView(arrangedSubviews: [fullNameStackView, aboutMeStackView, sexStackView, goToChatButton], axis: .vertical, spacing: 40)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 40),
            mainStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            mainStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
            
        ])
        
        
    }
}





//MARK: - SwiftUi Canvas
import SwiftUI

struct SetupProfileControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all).previewInterfaceOrientation(.portrait)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = SetupProfileViewController()
        func makeUIViewController(context: Context) -> SetupProfileViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
