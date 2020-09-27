//
//  EventHeader.swift
//  TitechAppLite
//
//  Created by m.tomoya on 2020/08/30.
//  Copyright © 2020 tomoya. All rights reserved.
//

import Foundation

struct EventHeader: Identifiable {
    let id: Date
    
    var headerStr: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "dMMMEEEE", options: 0, locale: Locale(identifier: "ja_JP"))
        return dateFormatter.string(from: id)
    }
}
