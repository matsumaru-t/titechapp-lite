//
//  Event.swift
//  TitechAppLite
//
//  Created by m.tomoya on 2020/08/30.
//  Copyright © 2020 tomoya. All rights reserved.
//

import Foundation

struct Event: Decodable, Identifiable {
    struct Time: Decodable {
        let start: String
        let end: String
    }
    
    let id: Int
    let time: Time
    let name: String
    let description: String
    let room: String
}
