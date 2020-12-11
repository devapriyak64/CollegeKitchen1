//
//  Filter.swift
//  CollegeKitchen
//
//  Created by Vian Nguyen on 12/6/20.
//

import Foundation
import UIKit

class Filter {
    var name: String
    var didSelect: Bool
    var nameLabel: UILabel!
    
    init(name: String) {
        self.name = name
        self.didSelect = false
        self.nameLabel = UILabel(frame: CGRect.zero)
        self.nameLabel.text = self.name
        self.nameLabel.sizeToFit()
        
    }
}

