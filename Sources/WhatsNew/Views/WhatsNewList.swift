//
//  WhatsNewSectionView.swift
//  WhatsNew
//
//  Created by Jason Loewy on 9/5/20.
//  Copyright © 2020 My Macros. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct WhatsNewList: View {
    
    @EnvironmentObject var styler: WNStyler
    
    let whatsNew: [WNSection]
    let showAppStoreItem: Bool
    
    var body: some View {
        
        List {
            ForEach(whatsNew, id: \.self) { currentSection in
                
                Section(header: SectionHeader(title: currentSection.title)) {
                    
                    ForEach(currentSection.items, id: \.self) {
                        WhatsNewRow(currentItem: $0)
                    }
                    
                }.background(styler.backgroundColor)
                
                // If necessary, show the app store row at the end of the first section
                // Assumed the first section is the most recent version
                if showAppStoreItem && currentSection == whatsNew[0] {
                    Section {
                        WhatsNewRow(currentItem: WNItem(icon: WNItem.Icon.star, title: "Head over to our page in the app store to see the full details of what's new."))
                    }
                }
                
                // If there are more than 1 section give a spcer between them
                if whatsNew.count > 1 && currentSection != whatsNew.last {
                    Divider()
                }
                
            }.background(styler.backgroundColor)
            
        }.background(styler.backgroundColor)
        .listStyle(PlainListStyle())
    }
}

@available(iOS 14.0, *)
struct WhatsNewList_Previews: PreviewProvider {
    static var previews: some View {
        WhatsNewList(whatsNew: [WNSection.debugPreview], showAppStoreItem: true)
    }
}

// MARK: -
// MARK: - Section Header

@available(iOS 14.0, *)
fileprivate struct SectionHeader: View {
    
    @EnvironmentObject var styler: WNStyler
    
    let title: String
    
    var body: some View {
        
        ZStack {
            styler.backgroundColor
                .padding([.leading, .trailing], -200)
                .padding(.bottom, -16)
            
            HStack {
                Text(title)
                    .font(styler.majorSectionFont)
                    .foregroundColor(styler.textPrimary)
                    .autocapitalization(.none)
                    .padding(.bottom, 8)
                
                Spacer(minLength: 0)
            }
        }.padding(.bottom, 8)
    }
    
}

// MARK: -
// MARK: - RowView

@available(iOS 14.0, *)
fileprivate struct WhatsNewRow: View {
    
    @EnvironmentObject var styler: WNStyler
    
    let currentItem: WNItem
    var body: some View {
        
        HStack(alignment: .top, spacing: 8, content: {
            
            Image(systemName: currentItem.icon.rawValue)
                .font(Font.body.weight(.semibold))
                .foregroundColor(Color(currentItem.icon.color))
                .frame(width: 16, height: 16, alignment: .top)
                .padding(.top, 4)
            
            Text("\(currentItem.title)")
                .foregroundColor(styler.textPrimary)
                .font(styler.regularFont)
            
        }).padding([.top, .bottom], 12)
    }
}

@available(iOS 14.0, *)
struct WhatsNewRow_Previews: PreviewProvider {
    static var previews: some View {
        WhatsNewRow(currentItem: WNItem(icon: WNItem.Icon.check, title: WNSection.debugPreview.items[0].title))
    }
}
