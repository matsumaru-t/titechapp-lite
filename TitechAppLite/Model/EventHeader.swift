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
    
    var jaString: String {
        switch self {
        case .sunday:
            return "日"
        case .monday:
            return "月"
        case .tuesday:
            return "火"
        case .wednesday:
            return "水"
        case .thursday:
            return "木"
        case .friday:
            return "金"
        case .saturday:
            return "土"
        }
    }
}

struct EventHeader: Identifiable {
    let id: Int
    let month: Int
    let day: Int
    let dayOfWeek: DayOfWeek
    
    var headerString: String {
        "\(month)月\(day)日 \(dayOfWeek.jaString)曜日"
    }
}
