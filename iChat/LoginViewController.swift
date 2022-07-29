//
//  LoginViewController.swift
//  iChat
//
//  Created by Djinsolobzik on 29.07.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    let wellcomeLabel = UILabel(name: "Wellcome, Back!", font: .avenir26())
    
    let loginWithLabel = UILabel(name: "Login With")
    let orLabel = UILabel(name: "or")
    let emailLabel = UILabel(name: "Email")
    let PasswordLabel = UILabel(name: "Password")
    
    let needAccountLabel = UILabel(name: "Need an account?")
    
    let emailTextField = OneLineTextField(font: .avenir20())
    let passwordTextField = OneLineTextField(font: .avenir20())
    
    let googleButton = UIButton(title: "Google", backgroundCollor: .white, titleColor: .black, isShadow: true)
    let loginButton = UIButton(title: "Login", backgroundCollor: .darkButton(), titleColor: .white, isShadow: false)
    let signUpButton = UIButton(title: "Sign up", backgroundCollor: .clear, titleColor: .redButton(), isShadow: false)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .mainWhite()
        setupConstraints()
    }
}

//MARK: - setup constraints
extension LoginViewController {
    private func setupConstraints() {
        wellcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(wellcomeLabel)
        
        NSLayoutConstraint.activate([
            wellcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            wellcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let googleButtonView = ButtonFormView(label: loginWithLabel, button: googleButton)
        
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], axis: .vertical, spacing: 0)
        let passwordStackView = UIStackView(arrangedSubviews: [PasswordLabel, passwordTextField], axis: .vertical, spacing: 0)
        
        let needAccountStackView = UIStackView(arrangedSubviews: [needAccountLabel, signUpButton], axis: .horizontal, spacing: 10)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let mainStackView = UIStackView(arrangedSubviews: [googleButtonView, orLabel, emailStackView, passwordStackView, loginButton], axis: .vertical, spacing: 40)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainStackView)
        
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: wellcomeLabel.bottomAnchor, constant: 100),
            mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40)
        ])
        
        needAccountStackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(needAccountStackView)
        
        NSLayoutConstraint.activate([
            needAccountStackView.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 40),
            needAccountStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40)
        ])
        
        
        
    }
}









//MARK: - SwiftUi Canvas
import SwiftUI

struct LoginViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all).previewInterfaceOrientation(.portrait)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = LoginViewController()
        func makeUIViewController(context: Context) -> LoginViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
