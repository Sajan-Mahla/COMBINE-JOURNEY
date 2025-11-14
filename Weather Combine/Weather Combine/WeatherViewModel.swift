//
//  WeatherViewModel.swift
//  Weather Combine
//
//  Created by SAJAN  on 14/11/25.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var weather: WeatherResponse?

    private var cancellables = Set<AnyCancellable>()
    private let service = WeatherService()

    init() {
        setupSearchPipeline()
    }

    private func setupSearchPipeline() {
        $searchText
            .debounce(for: .milliseconds(600), scheduler: RunLoop.main)
            .removeDuplicates()
            .flatMap { query in
                self.service.fetchWeather(for: query)
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] weatherResponse in
                self?.weather = weatherResponse
            }
            .store(in: &cancellables)
    }
}
