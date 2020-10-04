//
//  EventListView.swift
//  TitechAppLite
//
//  Created by m.tomoya on 2020/08/16.
//  Copyright © 2020 tomoya. All rights reserved.
//

import SwiftUI

struct EventListView: View {
    @ObservedObject var viewModel = EventViewModel()
    @State private var isPresentedSettingView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.eventlist) { eventlist in
                    Section(header: EventHeaderView(headerStr: eventlist.dateStr)) {
                        ForEach(eventlist.events) { event in
                            EventRowView(event: event)
                        }
                    }
                }
                .listRowInsets(EdgeInsets())
                .navigationBarTitle(Text("スケジュール"), displayMode: .inline)
            }
            .toolbar(content: {
                Button(action: { isPresentedSettingView = true }, label: {
                    Text("設定")
                })
            })
        }
        .sheet(isPresented: $isPresentedSettingView) { EmptyView() }
        .onAppear {
            self.viewModel.appear()
        }
    }
}

struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView()
    }
}
