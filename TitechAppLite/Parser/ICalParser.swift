//
//  ICalParser.swift
//  TitechAppLite
//
//  Created by m.tomoya on 2020/09/06.
//  Copyright © 2020 tomoya. All rights reserved.
//

import Foundation

struct ICalParser {
    static func parse(from: String) -> [Date: [Event]]? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        
        guard let matches = from.matches("BEGIN:VEVENT([\\s\\S]*?)END:VEVENT") else {
            return nil
        }
        
        let events = matches.compactMap { arr -> Event? in
            dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss"
            
            let str = arr[0]
            
            guard
                let startTimeStr = str.match("DTSTART;TZID=Asia/Tokyo:(.*)\n"),
                let endTimeStr = str.match("DTEND;TZID=Asia/Tokyo:(.*)\n"),
                let startTime = dateFormatter.date(from: startTimeStr),
                let endTime = dateFormatter.date(from: endTimeStr),
                let room = str.match("LOCATION:(.*)\n"),
                let description = str.match("DESCRIPTION:(.*)\n"),
                let name = str.match("SUMMARY:(.*)\n"),
                let id = str.match("UID:(.*?)@.*\n") else {
                    return nil
            }
            
            dateFormatter.dateFormat = "HH:mm"
            let event = Event(
                id: id,
                time: Event.Time(
                    start: startTime,
                    end: endTime,
                    startStr: dateFormatter.string(from: startTime),
                    endStr: dateFormatter.string(from: endTime)
                ),
                name: name,
                description: description,
                room: room
            )
            
            return event
        }
        
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "dMMMEEEE", options: 0, locale: Locale(identifier: "ja_JP"))
        return Dictionary(grouping: events) {
            let dateStr = dateFormatter.string(from: $0.time.start)
            return dateFormatter.date(from: dateStr)!
        }
    }
}
