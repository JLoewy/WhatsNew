//
//  WhatsNewStyler.swift
//
//  Contains all the styling attributes from the main project
//  that will be used throughout the package
//
//  Created by Jason Loewy on 9/6/20.
//

import Foundation
import SwiftUI

@available(iOS 14.0, *)
public class WNStyler: ObservableObject {
    
    let backgroundColor: Color
    
    let textPrimary: Color
    let textSecondary: Color
    
    let appTitleFont: Font
    let majorSectionFont: Font
    let regularFont: Font
    
    public init(backgroundColor: Color,
                textPrimary: Color, textSecondary: Color,
                appTitleFont: Font, majorSectionFont: Font, regularFont: Font) {
        
        self.backgroundColor = backgroundColor
        
        self.textPrimary   = textPrimary
        self.textSecondary = textSecondary
        
        self.appTitleFont     = appTitleFont
        self.majorSectionFont = majorSectionFont
        self.regularFont      = regularFont
    }
}

#if DEBUG
@available(iOS 14.0, *)
public extension WNStyler {
    
    static let debugPreview = WNStyler(backgroundColor: .white,
                                       textPrimary: .black,
                                       textSecondary: .black,
                                       appTitleFont: Font.system(size: 40, weight: .semibold),
                                       majorSectionFont: Font.system(size: 34, weight: .semibold),
                                       regularFont: Font.system(size: 16, weight: .regular))
    
}
#endif
