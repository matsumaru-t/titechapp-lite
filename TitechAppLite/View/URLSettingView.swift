//
//  URLSettingView.swift
//  TitechAppLite
//
//  Created by m.tomoya on 2020/10/04.
//  Copyright © 2020 tomoya. All rights reserved.
//

import SwiftUI

struct URLSettingView: View {
    @State private var url = ""
    @State private var showDialog = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("URL", text: $url)
                Button(action: { showDialog = true }, label: {
                    Text("保存")
                })
                .alert(isPresented: $showDialog, content: {
                    Alert(title: Text("保存完了"))
                })
            }
            .background(Color("backgroundMain"))
            .navigationBarTitle(Text("カレンダーURL設定"), displayMode: .inline)
        }
    }
}

struct URLSettingView_Previews: PreviewProvider {
    static var previews: some View {
        URLSettingView()
    }
}
