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
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.eventlist.keys.sorted(), id: \.self) { key in
                    Section(header: EventHeaderView(header: EventHeader(id: key))){
                        ForEach(viewModel.eventlist[key]!) { event in
                            EventRowView(event: event)
                        }
                    }
                }
                .listRowInsets(EdgeInsets())
                .navigationBarTitle(Text("スケジュール"), displayMode: .inline)
            }
        }
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