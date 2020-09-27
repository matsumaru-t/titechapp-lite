//
//  EventListTranslator.swift
//  TitechAppLite
//
//  Created by m.tomoya on 2020/09/27.
//  Copyright © 2020 tomoya. All rights reserved.
//

import Foundation

struct EventListTranslator {
    static func translate(events: [Event], now: Date) -> [EventSection] {
        let sectionNum = 120
        
        let days = (0..<sectionNum).map { Date(timeInterval: Double($0 * 60 * 60 * 24), since: now ).beginningOfDay() }
        let eventDictionary = Dictionary(grouping: events) { $0.time.start.beginningOfDay() }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "dMMMEEEE", options: 0, locale: Locale(identifier: "ja_JP"))
        
        return days.map {
            EventSection(dateStr: dateFormatter.string(from: $0), events: eventDictionary[$0] ?? [])
        }
    }
}

private extension Date {
    func beginningOfDay() -> Date {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.startOfDay(for: self)
    }
}
