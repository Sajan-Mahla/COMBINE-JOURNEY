//
//  WeatherResponse.swift
//  Weather Combine
//
//  Created by SAJAN  on 14/11/25.
//

import Foundation

struct WeatherResponse: Codable {
    let latitude: Double?
    let longitude: Double?
    let generationtime_ms: Double?
    let utc_offset_seconds: Int?
    let timezone: String?
    let timezone_abbreviation: String?
    let elevation: Double?
    let current_weather: CurrentWeather?
}

struct CurrentWeather: Codable {
    let temperature: Double
    let windspeed: Double
    let winddirection: Double
    let weathercode: Int?
    let is_day: Int?
    let time: String?
}
