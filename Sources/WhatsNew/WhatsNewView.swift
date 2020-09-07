//
//  WhatsNewView.swift
//  WhatsNew
//
//  This is the main entry point into the WhatsNewView
//
//  Created by Jason Loewy on 9/5/20.
//  Copyright © 2020 My Macros. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
public struct WhatsNewView: View {
    
    @EnvironmentObject var styler: WNStyler
    
    let appIcon: Image
    let appTitle: String
    
    let showAppStoreItem: Bool
    
    let whatsNew: [WNSection]
    
    public var body: some View {
        
        VStack {
            WhatsNewHeader(appIcon: appIcon, appTitle: appTitle)
                .padding(.bottom, 8)
            
            WhatsNewList(whatsNew: whatsNew, showAppStoreItem: showAppStoreItem)
            
        }.padding()
        .background(styler.backgroundColor)
    }
    
    public init(appIcon: Image, appTitle: String, whatsNew: [WNSection], showAppStoreItem: Bool = false) {
        self.appIcon          = appIcon
        self.appTitle         = appTitle
        self.whatsNew         = whatsNew
        self.showAppStoreItem = showAppStoreItem
    }
}

@available(iOS 14.0, *)
struct WhatsNewView_Previews: PreviewProvider {
    static var previews: some View {
        WhatsNewView(appIcon: Image("rectangle.roundedtop.fill"), appTitle: "What's New SPM", whatsNew: [WNSection.debugPreview])
            .environmentObject(WNStyler.debugPreview)
    }
}
