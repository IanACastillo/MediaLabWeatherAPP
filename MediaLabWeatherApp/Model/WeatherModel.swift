//
//  WeatherModel.swift
//  MediaLabWeatherApp
//
//  Created by Ian Castillo on 3/3/24.
//

import Foundation

struct WeatherResponse: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    let wind: Wind

    struct Main: Codable {
        let temp: Double
        let temp_min: Double
        let temp_max: Double
    }

    struct Weather: Codable {
        let description: String
        let icon: String
    }

    struct Wind: Codable {
        let speed: Double
        let deg: Int
    }
}
