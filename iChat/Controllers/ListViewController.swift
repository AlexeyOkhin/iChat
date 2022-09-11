//
//  ListViewController.swift
//  iChat
//
//  Created by Djinsolobzik on 01.08.2022.
//

import UIKit
import SwiftUI

final class ListViewController: UIViewController {
    
    let activeChats = Bundle.main.decode([MChat].self, from: "activeChats.json")
    let waitingChats = Bundle.main.decode([MChat].self, from: "waitingChats.json")
    
    var collectionView: UICollectionView!
    
    enum Section: Int, CaseIterable {
        case waitingChat, activityChat
        
        func description() -> String {
            switch self {
                
            case .waitingChat:
                return "Waiting chat"
            case .activityChat:
                return "Activity chat"
            }
        }
    
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, MChat>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupCollectionView()
        createDataSource()
        reloadData()
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, MChat>()
        snapshot.appendSections([.waitingChat, .activityChat])
        snapshot.appendItems(waitingChats, toSection: .waitingChat)
        snapshot.appendItems(activeChats, toSection: .activityChat)
        dataSource?.apply(snapshot, animatingDifferences: true)
        
    }
}

//MARK: - setup collectionView

extension ListViewController {
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .mainWhite()
        self.view.addSubview(collectionView)
        
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reusedId)
        
        collectionView.register(ActiveChatCell.self, forCellWithReuseIdentifier: ActiveChatCell.reuserID)
        collectionView.register(WaitingChatCell.self, forCellWithReuseIdentifier: WaitingChatCell.reuserID)
        
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
}

//MARK: - searchBar delegate

extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

//MARK: - create DataSource

extension ListViewController {
   
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, MChat>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, chat) -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else { fatalError("not section") }
            
            switch section {
            case .activityChat:
                return self.configurate(collectionView: collectionView, cellType: ActiveChatCell.self, with: chat, for: indexPath)
            case .waitingChat:
                return self.configurate(collectionView: collectionView, cellType: WaitingChatCell.self, with: chat, for: indexPath)
            }
        })
        
        dataSource?.supplementaryViewProvider = {
            collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reusedId, for: indexPath) as? SectionHeader else {
                fatalError("Can t create section header")
            }
            guard let section = Section(rawValue: indexPath.section) else { fatalError("unknow error create section")}
            sectionHeader.configure(title: section.description(), font: .laoSangaMN20(), color: UIColor.systemGray)
            return sectionHeader
        }
    }
}


//MARK: - Setup Layout

extension ListViewController {
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
            guard let section = Section(rawValue: sectionIndex) else { fatalError("not section") }
            switch section {
            case .activityChat:
                return self.createActivitySection()
            case .waitingChat:
                return self.createWaitingSection()
            }
        }
        return layout
    }
    
    private func createWaitingSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let collectionItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupeSize = NSCollectionLayoutSize(widthDimension: .absolute(78),
                                                heightDimension: .absolute(78))
        let collectionGroupe = NSCollectionLayoutGroup.horizontal(layoutSize: groupeSize, subitems: [collectionItem])
        
        let section = NSCollectionLayoutSection(group: collectionGroupe)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 20)
        section.interGroupSpacing = 20
        section.orthogonalScrollingBehavior = .continuous
        
        let sectionHeader = createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    private func createActivitySection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let collectionItem = NSCollectionLayoutItem(layoutSize: itemSize)
        collectionItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 10)
        
        let groupeSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: NSCollectionLayoutDimension.absolute(78)
        )
        let collectionGroupe = NSCollectionLayoutGroup.vertical(layoutSize: groupeSize, subitems: [collectionItem])
        
        let section = NSCollectionLayoutSection(group: collectionGroupe)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20)
        section.interGroupSpacing = 8
        
        let sectionHeader = createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(1)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        return sectionHeader
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
