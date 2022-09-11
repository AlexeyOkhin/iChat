////  Created by Your Name on 30.08.22.
//  Copyright © 2022 by iOS Dev. All rights reserved.

import Foundation

protocol SelfConfiguringCell {
    
    static var reuserID: String { get }
    func configure<U: Hashable>(with value: U)
}
