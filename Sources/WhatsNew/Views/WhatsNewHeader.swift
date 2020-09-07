//
//  WhatsNewHeader.swift
//  WhatsNew
//
//  View that contains the app icon __ app title
//
//  Created by Jason Loewy on 9/5/20.
//  Copyright © 2020 All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct WhatsNewHeader: View {
    
    @EnvironmentObject var styler: WNStyler
    
    let appIcon: Image
    let appTitle: String
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 12) {
            appIcon
                .resizable().frame(width: 44, height: 44, alignment: .leading)
                .scaledToFit()
                .cornerRadius(12.0)
            
            Text(appTitle)
                .font(styler.appTitleFont)
                .foregroundColor(styler.textPrimary)
            Spacer()
            
        }.background(Color.clear)
        .padding()
    }
}

@available(iOS 14.0, *)
struct WhatsNewHeader_Previews: PreviewProvider {
    static var previews: some View {
        WhatsNewHeader(appIcon: Image("rectangle.roundedtop.fill"), appTitle: "What's New SPM")
            .previewDevice("iPhone 11 Pro")
    }
}
