//
//  WeatherService.swift
//  MediaLabWeatherApp
//
//  Created by Ian Castillo on 3/3/24.
//

import Combine
import Foundation

// Define a service protocol for fetching weather, which will help with dependency injection and unit testing.
protocol WeatherServiceProtocol {
    func fetchWeather(forCity city: String) -> AnyPublisher<WeatherResponse, Error>
}

// WeatherService conforming to WeatherServiceProtocol
class WeatherService: WeatherServiceProtocol {
    func fetchWeather(forCity city: String) -> AnyPublisher<WeatherResponse, Error> {
        let escapedCity = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(escapedCity)&appid=d4277b87ee5c71a468ec0c3dc311a724"
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
