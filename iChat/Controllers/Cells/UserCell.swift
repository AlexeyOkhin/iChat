////  Created by Your Name on 30.08.22.
//  Copyright © 2022 by iOS Dev. All rights reserved.

import UIKit

class UserCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuserID: String = "UserCell"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func configure<U>(with value: U) where U : Hashable {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
