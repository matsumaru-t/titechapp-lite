//
//  EventHeader.swift
//  TitechAppLite
//
//  Created by m.tomoya on 2020/08/30.
//  Copyright © 2020 tomoya. All rights reserved.
//

import Foundation

enum DayOfWeek: Int {
    case sunday = 0
    case monday = 1
    case tuesday = 2
    case wednesday = 3
    case thursday = 4
    case friday = 5
    case saturday = 6
}

struct EventHeader: Identifiable {
    let id: Int
    let month: Int
    let day: Int
    let dayOfWeek: DayOfWeek
    
    func headerToString() -> String {
        let weeks = ["日", "月", "火", "水", "木", "金", "土"]
        return String(month) + "月" + String(day) + "日 " + weeks[dayOfWeek.rawValue] + "曜日"
    }
}
