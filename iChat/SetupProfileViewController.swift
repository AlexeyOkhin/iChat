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
            setUpLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            setUpLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        photoView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(photoView)
        
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: setUpLabel.bottomAnchor, constant: 60),
            photoView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
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
