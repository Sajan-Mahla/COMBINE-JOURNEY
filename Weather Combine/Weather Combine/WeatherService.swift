//
//  WeatherService.swift
//  Weather Combine
//
//  Created by SAJAN  on 14/11/25.
//

import Foundation
import Combine

class WeatherService {

    func fetchWeather(for city: String) -> AnyPublisher<WeatherResponse?, Never> {
        // Empty search? Don't call API
        guard !city.isEmpty else {
            return Just(nil).eraseToAnyPublisher()
        }

        // 1️⃣ Build geocoding URL
        let geoURLString =
            "https://geocoding-api.open-meteo.com/v1/search?name=\(city)"
                .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

        guard let geoURL = URL(string: geoURLString) else {
            return Just(nil).eraseToAnyPublisher()
        }

        // 2️⃣ First API -> convert city name to (lat, lon)
        return URLSession.shared.dataTaskPublisher(for: geoURL)
            .map(\.data)
            .decode(type: GeoResponse.self, decoder: JSONDecoder())
            .flatMap { geo -> AnyPublisher<WeatherResponse?, Never> in

                guard let lat = geo.results?.first?.latitude,
                      let lon = geo.results?.first?.longitude else {
                    return Just(nil).eraseToAnyPublisher()
                }

                // 3️⃣ Second API -> fetch weather using lat + lon
                let weatherURL = URL(
                    string:
                        "https://api.open-meteo.com/v1/forecast?latitude=\(lat)&longitude=\(lon)&current_weather=true"
                )!

                return URLSession.shared.dataTaskPublisher(for: weatherURL)
                    .map(\.data)
                    .decode(type: WeatherResponse.self, decoder: JSONDecoder())
                    .map { Optional($0) }   // convert WeatherResponse → WeatherResponse?
                    .replaceError(with: nil)
                    .eraseToAnyPublisher()
            }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }
}
