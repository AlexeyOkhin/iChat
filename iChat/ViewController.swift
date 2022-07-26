//
//  ViewController.swift
//  iChat
//
//  Created by Djinsolobzik on 26.07.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }


}

import SwiftUI

struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all).previewInterfaceOrientation(.portrait)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = ViewController()
        func makeUIViewController(context: Context) -> ViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}

