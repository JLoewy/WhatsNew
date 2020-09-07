//
//  WhatsNewItem.swift
//  WhatsNew
//
//  Created by Jason Loewy on 9/5/20.
//  Copyright © 2020 All rights reserved.
//

import Foundation
import UIKit

public struct WNItem: Hashable, Equatable {
    
    public enum Icon: String {
        case check = "checkmark"
        case star  = "star"
        
        var color: UIColor {
            get {
                switch self {
                    case .check: return UIColor.systemGreen
                    case .star:  return UIColor.systemOrange
                }
            }
        }
    }
    
    let icon: Icon
    let title: String
    
    public init(icon: Icon, title: String) {
        self.icon  = icon
        self.title = title
    }
}
