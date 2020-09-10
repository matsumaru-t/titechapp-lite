//
//  APIClient.swift
//  TitechAppLite
//
//  Created by m.tomoya on 2020/09/06.
//  Copyright © 2020 tomoya. All rights reserved.
//

import Foundation
import Combine

struct APIClient {
    let session: URLSession
    
    init() {
        session = URLSession.shared
    }
    
    func fetch(url: URL) -> AnyPublisher<Data, URLError> {
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        return session
            .dataTaskPublisher(for: request)
            .map { $0.data }
            .eraseToAnyPublisher()
    }
}
