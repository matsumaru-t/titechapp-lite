//
//  EventHeaderView.swift
//  TitechAppLite
//
//  Created by m.tomoya on 2020/08/23.
//  Copyright © 2020 tomoya. All rights reserved.
//

import SwiftUI

struct EventHeaderView: View {
    let header: EventHeader
    var body: some View {
        HStack(spacing: 10) {
            Rectangle()
                .frame(width: 5.0, height: 55.0)
                .foregroundColor(Color("grayMain"))
            
            Text(header.headerStr)
                .font(Font.system(size: 15))
                .foregroundColor(Color("textSub"))
            
            Spacer()
        }
        .background(Color("backgroundMain"))
    }
}

struct EventHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        EventHeaderView(header: EventHeader(id: Date())).previewLayout(.fixed(width: 375, height: 55))
    }
}
