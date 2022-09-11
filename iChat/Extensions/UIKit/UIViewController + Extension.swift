////  Created by Your Name on 30.08.22.
//  Copyright © 2022 by iOS Dev. All rights reserved.

import UIKit

extension UIViewController {
    
    func configurate<T: SelfConfiguringCell, U: Hashable>(collectionView: UICollectionView, cellType: T.Type, with value: U, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuserID, for: indexPath) as? T else {
            fatalError("no cell")
        }
        cell.configure(with: value)
        return cell
    }
}
