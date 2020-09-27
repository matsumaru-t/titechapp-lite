//
//  Event.swift
//  TitechAppLite
//
//  Created by m.tomoya on 2020/08/30.
//  Copyright © 2020 tomoya. All rights reserved.
//

import Foundation

struct Event: Identifiable {
    struct Time {
        let start: Date
        let end: Date
        
        var startStr: String {
            start.toString()
        }
        var endStr: String {
            end.toString()
        }
    }
    
    let id: String
    let time: Time
    let name: String
    let description: String
    let room: String
}

private extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: self)
    }
}
