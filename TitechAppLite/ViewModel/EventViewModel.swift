//
//  EventViewModel.swift
//  TitechAppLite
//
//  Created by m.tomoya on 2020/08/30.
//  Copyright © 2020 tomoya. All rights reserved.
//

import Foundation
import Combine

class EventViewModel: ObservableObject {
    @Published var eventlist = [EventSection]()
    private var cancellable: AnyCancellable!
    
    func appear() {
        let urlStr = UserDefaults.standard.string(forKey: "ICalURL") ?? ""
        let defaultUrl = URL(string: "https://ocwi-mock.titech.app/ocwi/index.php?module=Ocwi&action=Webcal&iCalendarId=test")!
        cancellable = APIClient()
            .fetch(url: URL(string: urlStr) ?? defaultUrl)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { result in

                },
                receiveValue: { value in
                    let events = ICalParser.parse(from: String(data: value, encoding: .utf8) ?? "")
                    self.eventlist = EventListTranslator.translate(events: events ?? [], now: Date())
                }
            )
    }
}
