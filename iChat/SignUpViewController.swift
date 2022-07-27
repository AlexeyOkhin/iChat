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
    
    let signUpButton = UIButton(title: "Sign up", backgroundCollor: .darkButton(), titleColor: .white, isShadow: false)
    let loginButton = UIButton(title: "Login", backgroundCollor: .white, titleColor: .redButton(), font: .avenir20(), isShadow: false, cornerRadius: 0)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
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

