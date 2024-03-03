//
//  WeatherViewModel.swift
//  MediaLabWeatherApp
//
//  Created by Ian Castillo on 3/3/24.
//

import Combine

// WeatherViewModel to interact with the WeatherService
class WeatherViewModel: ObservableObject {
    @Published var weatherResponses = [WeatherResponse]()
    @Published var isLoading = false
    @Published var searchTerm = ""
    
    private var cancellables = Set<AnyCancellable>()
    private let weatherService: WeatherServiceProtocol

    // Dependency injection for better testing and flexibility
    init(weatherService: WeatherServiceProtocol = WeatherService()) {
        self.weatherService = weatherService
    }

    // Function to fetch weather for a specific city
    func getWeather(forCity city: String) {
        isLoading = true
        weatherService.fetchWeather(forCity: city)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    // Handle the error case, possibly by showing an alert or a placeholder view.
                    print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] weatherResponse in
                self?.weatherResponses.append(weatherResponse)
            })
            .store(in: &cancellables)
    }

    // Function to handle search and fetch weather data accordingly
    func search() {
        getWeather(forCity: searchTerm)
    }
}
