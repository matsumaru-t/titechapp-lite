//
//  URLSettingView.swift
//  TitechAppLite
//
//  Created by m.tomoya on 2020/10/04.
//  Copyright © 2020 tomoya. All rights reserved.
//

import SwiftUI

struct URLSettingView: View {
    @State private var url = UserDefaults.standard.string(forKey: "ICalURL") ?? ""
    @State private var showDialog = false
    @State private var isButtonDisable = true
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("URL", text: $url, onEditingChanged: { begin in
                    let urlMatch = url.match("(https?://.*)")
                    isButtonDisable = urlMatch == nil
                }).keyboardType(.URL).autocapitalization(.none)
                Button(action: {
                    showDialog = true
                    UserDefaults.standard.set(url, forKey: "ICalURL")
                }, label: {
                    Text("保存")
                }).disabled(isButtonDisable)
                .alert(isPresented: $showDialog, content: {
                    Alert(
                        title: Text("保存完了"),
                        dismissButton: .default(Text("OK"), action: {
                            presentationMode.wrappedValue.dismiss()
                        })
                    )
                })
            }
            .navigationBarTitle(Text("カレンダーURL設定"), displayMode: .inline)
        }
    }
}

struct URLSettingView_Previews: PreviewProvider {
    static var previews: some View {
        URLSettingView()
    }
}
