//
//  EventSection.swift
//  TitechAppLite
//
//  Created by m.tomoya on 2020/08/30.
//  Copyright © 2020 tomoya. All rights reserved.
//

import Foundation

struct EventSection: Identifiable {
    let id: Int
    let header: EventHeader
    let events: [Event]
}
