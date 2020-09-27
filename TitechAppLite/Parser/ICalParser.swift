//
//  ICalParser.swift
//  TitechAppLite
//
//  Created by m.tomoya on 2020/09/06.
//  Copyright © 2020 tomoya. All rights reserved.
//

import Foundation

struct ICalParser {
    static func parse(from: String) -> [Event]? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        
        guard let matches = from.matches("BEGIN:VEVENT([\\s\\S]*?)END:VEVENT") else {
            return nil
        }
        
        return matches.compactMap { arr -> Event? in
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
            
            let event = Event(
                id: id,
                time: Event.Time(
                    start: startTime,
                    end: endTime
                ),
                name: name,
                description: description,
                room: room
            )
            
            return event
        }
    }
}
