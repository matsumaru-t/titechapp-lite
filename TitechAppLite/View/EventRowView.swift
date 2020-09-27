//
//  EventRowView.swift
//  TitechAppLite
//
//  Created by m.tomoya on 2020/08/16.
//  Copyright © 2020 tomoya. All rights reserved.
//

import SwiftUI

struct EventRowView: View {
    let event: Event
    
    var body: some View {
        HStack{
            Rectangle()
                .frame(width: 5.0, height: 100.0)
                .foregroundColor(Color("main"))
            
            HStack{
                VStack(alignment: .leading, spacing: 21){
                    Text(event.time.startStr)
                        .font(Font.system(size: 13))
                        .foregroundColor(Color("textMain"))
                    Text(event.time.endStr)
                        .font(Font.system(size: 13))
                        .foregroundColor(Color("textSub"))

                }
                VStack(alignment: .leading, spacing: 21){
                    Text(event.name)
                        .font(Font.system(size: 15))
                        .foregroundColor(Color("textMain"))
                        .lineLimit(1)
                    Text(event.description)
                        .font(Font.system(size: 13))
                        .foregroundColor(Color("textSub"))
                        .lineLimit(1)
                }
                Spacer()
                Text(event.room)
                    .font(Font.system(size: 14))
                    .foregroundColor(Color("main"))
                    .frame(width: 40)
                    .lineLimit(2)
            }.padding()
        }
    }
}

struct EventRowView_Previews: PreviewProvider {
    static var previews: some View {
        EventRowView(event: Event(
            id: "1",
            time: Event.Time(start: Date(), end: Date(), startStr: "9:00", endStr: "10:30"),
            name: "電磁気学",
            description: "description",
            room: "W833,G114"
        )).previewLayout(.fixed(width: 375, height: 100))
    }
}
