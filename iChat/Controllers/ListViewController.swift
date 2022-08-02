//
//  ListViewController.swift
//  iChat
//
//  Created by Djinsolobzik on 01.08.2022.
//

import UIKit
import SwiftUI

struct MChat: Hashable {
    var userName: String
    var userImage: UIImage
    var lastMessage: String
    var id = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.id == rhs.id
    }
}

class ListViewController: UIViewController {
    
    let activeChats: [MChat] = [
    MChat(userName: "Bob", userImage: UIImage(named: "human1")!, lastMessage: "Hello"),
    MChat(userName: "Dob", userImage: UIImage(named: "human2")!, lastMessage: "Hello"),
    MChat(userName: "Panch", userImage: UIImage(named: "human3")!, lastMessage: "Hello"),
    MChat(userName: "Anna", userImage: UIImage(named: "human4")!, lastMessage: "Hello"),
    MChat(userName: "Tery", userImage: UIImage(named: "human5")!, lastMessage: "Hello")
    ]
    
    var collectionView: UICollectionView!
    
    enum Section: Int, CaseIterable {
        case activityChat
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, MChat>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupCollectionView()
        createDataSource()
        reloadData()
    }
}

//MARK: - setup collectionView
extension ListViewController {
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .mainWhite()
        self.view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellid")
    
    }
    
//MARK: - setup serchController
    private func setupSearchBar() {
        navigationController?.navigationBar.barTintColor = .mainWhite()
        navigationController?.navigationBar.shadowImage = UIImage()
        let searchController = UISearchController()
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
    }
    
//MARK: - create Compositional layout
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let collectionItem = NSCollectionLayoutItem(layoutSize: itemSize)
            collectionItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 10)
            
            let groupeSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                    heightDimension: NSCollectionLayoutDimension.absolute(86))
            let collectionGroupe = NSCollectionLayoutGroup.vertical(layoutSize: groupeSize, subitems: [collectionItem])
            collectionGroupe.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0)
            
            let section = NSCollectionLayoutSection(group: collectionGroupe)
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
            return section
        }
        return layout
    }
    
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, MChat>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, itemIdentifier) -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else { fatalError("not section") }
            
            switch section {
            case .activityChat:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
                cell.backgroundColor = .systemBlue
                return cell
            }
        })
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, MChat>()
        snapshot.appendSections([.activityChat])
        snapshot.appendItems(activeChats, toSection: .activityChat)
        dataSource?.apply(snapshot, animatingDifferences: true)
        
    }
}

//MARK: - searchBar delegate
extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}



//MARK: - SwiftUi Canvas
import SwiftUI

struct ListControllerProvider: PreviewProvider {
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
