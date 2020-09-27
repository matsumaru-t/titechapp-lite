//
//  EventSection.swift
//  TitechAppLite
//
//  Created by m.tomoya on 2020/09/27.
//  Copyright © 2020 tomoya. All rights reserved.
//

import Foundation

struct EventSection {
    let dateStr: String
    let events: [Event]
}

extension EventSection: Identifiable {
    var id: String { dateStr }
}
