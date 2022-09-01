//
//  SignUpViewController.swift
//  iChat
//
//  Created by Djinsolobzik on 27.07.2022.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let wellcomeLabel = UILabel(name: "Wellcome, Hello!!!", font: .avenir26())
    
    let emailLabel = UILabel(name: "Email")
    let passwordLabel = UILabel(name: "Password, Hello!!!")
    let confirmPasswordLabel = UILabel(name: "Confirm password")
    
    let alredyLabel = UILabel(name: "Alreaddy onboard?")
    
    let emailTextField = OneLineTextField(font: .avenir20())
    let passwordTextField = OneLineTextField(font: .avenir20())
    let confirmPasswordTextField = OneLineTextField(font: .avenir20())
    
    let signUpButton = UIButton(title: "Sign up", backgroundCollor: .darkButton(), titleColor: .white, isShadow: false)
    let loginButton = UIButton(title: "Login", backgroundCollor: .mainWhite(), titleColor: .redButton(), font: .avenir20(), isShadow: false, cornerRadius: 0)
    
//MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainWhite()
        setupConstreints()
    }
    
}

//MARK: - Setup constreints

extension SignUpViewController {
    private func setupConstreints() {
        wellcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], axis: .vertical, spacing: 0)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 0)
        let confirmPasswordStackView = UIStackView(arrangedSubviews: [confirmPasswordLabel, confirmPasswordTextField], axis: .vertical, spacing: 0)
        
        let signUpStackView = UIStackView(arrangedSubviews: [emailStackView, passwordStackView, confirmPasswordStackView, signUpButton], axis: .vertical, spacing: 40)
        signUpStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let alreadyStackView = UIStackView(arrangedSubviews: [alredyLabel,loginButton], axis: .horizontal, spacing: 40)
        alreadyStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(wellcomeLabel)
        self.view.addSubview(signUpStackView)
        self.view.addSubview(alreadyStackView)
        
        NSLayoutConstraint.activate([
            wellcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            wellcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            signUpStackView.topAnchor.constraint(equalTo: wellcomeLabel.bottomAnchor, constant: 140),
            signUpStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            signUpStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            alreadyStackView.topAnchor.constraint(equalTo: signUpStackView.bottomAnchor, constant: 60),
            alreadyStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40)
        ])
        
    }
}



//MARK: - SwiftUi Canvas
import SwiftUI

struct SignUpViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all).previewInterfaceOrientation(.portrait)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = SignUpViewController()
        func makeUIViewController(context: Context) -> SignUpViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}

