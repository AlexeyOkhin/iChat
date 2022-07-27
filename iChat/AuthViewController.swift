//
//  ViewController.swift
//  iChat
//
//  Created by Djinsolobzik on 26.07.2022.
//

import UIKit

class AuthViewController: UIViewController {
    
    let logoImage = UIImageView(image: #imageLiteral(resourceName: "Logo"), contentMode: .scaleAspectFit)
    
    let googleLabel = UILabel(name: "Get started with")
    let emailLabel = UILabel(name: "Or sign up with")
    let loginLabel = UILabel(name: "Alredy onboard?")
    
    let googleButton = UIButton(title: "Google", backgroundCollor: .white, titleColor: .black, isShadow: true)
    let emailButton = UIButton(title: "Email", backgroundCollor: .darkButton(), titleColor: .white, isShadow: false)
    let loginButton = UIButton(title: "Login", backgroundCollor: .white, titleColor: .redButton(), isShadow: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .mainWhite()
    }
    
}


















import SwiftUI

struct AuthViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all).previewInterfaceOrientation(.portrait)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = AuthViewController()
        func makeUIViewController(context: Context) -> AuthViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}

