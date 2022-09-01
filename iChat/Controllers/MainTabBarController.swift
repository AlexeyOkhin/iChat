//
//  MainTabBarController.swift
//  iChat
//
//  Created by Djinsolobzik on 01.08.2022.
//

import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let peopleViewController = PeopleViewController()
        let listViewController = ListViewController()
        
        let boldConf = UIImage.SymbolConfiguration(weight: .bold)
        
        tabBar.tintColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        
        let imagePeople = UIImage(systemName: "person.2", withConfiguration: boldConf)!
        let imageList = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldConf)!
        
        viewControllers = [
            generationNavigationController(rootViewController: listViewController, title: "Conversation", image: imageList),
            generationNavigationController(rootViewController: peopleViewController, title: "People", image: imagePeople)
        ]
    }
    
    private func generationNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigation = UINavigationController(rootViewController: rootViewController)
        navigation.tabBarItem.title = title
        navigation.tabBarItem.image = image
        return navigation
    }
}


//MARK: - SwiftUi Canvas
import SwiftUI

struct TabBarControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all).previewInterfaceOrientation(.portrait)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = MainTabBarController()
        func makeUIViewController(context: Context) -> MainTabBarController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
