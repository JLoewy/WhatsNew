//
//  WhatsNewSection.swift
//  WhatsNew
//
//  Created by Jason Loewy on 9/5/20.
//  Copyright © 2020 All rights reserved.
//

import Foundation

public struct WNSection: Hashable {
    
    let isMajor: Bool
    
    let title: String
    let items: [WNItem]
    
    public init(isMajor: Bool, title: String, items: [WNItem]) {
        self.isMajor = isMajor
        self.title   = title
        self.items   = items
    }
}

#if DEBUG
extension WNSection {
    
    public static let debugPreview = WNSection(isMajor: true,
                                               title: "What's New in 2020.21",
                                               items: [
                                                WNItem(icon: WNItem.Icon.check, title: "You can now do stuff to interact with things!"),
                                                WNItem(icon: WNItem.Icon.check, title: "Even more nonsense than before"),
                                                WNItem(icon: WNItem.Icon.check, title: "In this version, you can use the app"),
                                                WNItem(icon: WNItem.Icon.check, title: "Fixed a bug where your microwave would turn on when using the app"),
                                               ])
    
}
#endif
