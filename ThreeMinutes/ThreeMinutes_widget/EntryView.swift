//
//  EntryView.swift
//  ThreeMinutes_widgetExtension
//
//  Created by iOS123 on 2020/7/20.
//  Copyright © 2020 CQL. All rights reserved.
//

import SwiftUI

struct EntryView: View {
    let model: WidgetContent
    
    var body: some View {
      VStack(alignment: .leading) {
        Text(model.name)
          .font(.uiTitle4)
          .lineLimit(2)
          .fixedSize(horizontal: false, vertical: true)
          .padding([.trailing], 15)
          .foregroundColor(.titleText)
        
        Text(model.cardViewSubtitle)
          .font(.uiCaption)
          .lineLimit(nil)
          .foregroundColor(.contentText)
        
        Text(model.descriptionPlainText)
          .font(.uiCaption)
          .fixedSize(horizontal: false, vertical: true)
          .lineLimit(2)
          .lineSpacing(3)
          .foregroundColor(.contentText)
        
        Text(model.releasedAtDateTimeString)
          .font(.uiCaption)
          .lineLimit(1)
          .foregroundColor(.contentText)
      }
      .background(Color.cardBackground)
      .padding()
      .cornerRadius(6)
    }
}
