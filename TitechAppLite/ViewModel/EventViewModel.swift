//
//  EventViewModel.swift
//  TitechAppLite
//
//  Created by m.tomoya on 2020/08/30.
//  Copyright © 2020 tomoya. All rights reserved.
//

import Foundation
import Combine

let testData = Event(
    id: 1,
    time: Event.Time(start: "9:00", end: "10:30"),
    name: "電磁気学",
    description: "description",
    room: "W833,G114"
)

class EventViewModel: ObservableObject {
    @Published var eventlist: [EventSection] = [
        EventSection(
            id: 1,
            header: EventHeader(id: 1, month: 2, day: 28, dayOfWeek: DayOfWeek.sunday),
            events: [testData, testData]
        ),
        EventSection(
            id: 2,
            header: EventHeader(id: 1, month: 2, day: 28, dayOfWeek: DayOfWeek.sunday),
            events: [testData, testData]
        )
    ]
    
    private var cancellable: AnyCancellable!
    
    func appear() {
        cancellable = APIClient()
            .fetch(url: URL(string: "https://ocwi-mock.titech.app/ocwi/index.php?module=Ocwi&action=Webcal&iCalendarId=test")!)
                .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { result in

                },
                receiveValue: { value in
                    let events = ICalParser.parse(from: String(data: value, encoding: .utf8)!)!
                    self.eventlist.append(EventSection(id: 3, header: EventHeader(id: 3, month: 2, day: 28, dayOfWeek: DayOfWeek.sunday), events: events))
                }
            )
    }
}
