//
//  EventHeaderView.swift
//  TitechAppLite
//
//  Created by m.tomoya on 2020/08/23.
//  Copyright © 2020 tomoya. All rights reserved.
//

import SwiftUI

struct EventHeaderView: View {
    var body: some View {
        HStack{
            Rectangle()
                .frame(width: 5.0, height: 55.0)
                .foregroundColor(Color("grayMain"))
            
            Spacer()
                .frame(width: 10.0)
            
            Text("7月18日 木曜日")
                .font(Font.system(size: 15))
                .foregroundColor(Color("textSub"))
            
            Spacer()
        }
        .background(Color("backgroundMain"))
    }
}

struct EventHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        EventHeaderView().previewLayout(.fixed(width: 375, height: 55))
    }
}
