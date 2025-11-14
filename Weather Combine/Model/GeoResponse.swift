//
//  GeoResponse.swift
//  Weather Combine
//
//  Created by SAJAN  on 14/11/25.
//

import Foundation

struct GeoResponse: Codable {
    let results: [GeoCity]?
}

struct GeoCity: Codable {
    let id: Int?
    let name: String?
    let latitude: Double?
    let longitude: Double?
    let country: String?
}
