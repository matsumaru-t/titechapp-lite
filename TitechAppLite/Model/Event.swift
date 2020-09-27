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
        let startStr: String
        let endStr: String
    }
    
    let id: String
    let time: Time
    let name: String
    let description: String
    let room: String
}
