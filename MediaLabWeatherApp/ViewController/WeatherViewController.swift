//
//  WeatherViewController.swift
//  MediaLabWeatherApp
//
//  Created by Ian Castillo on 3/3/24.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var viewModel = WeatherViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // Search bar to add new cities
                HStack {
                    TextField("Search for city", text: $viewModel.searchTerm, onCommit: {
                        viewModel.search()
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                    Button(action: {
                        viewModel.search()
                    }) {
                        Text("Search")
                    }
                }

                // List to display weather cards
                List(viewModel.weatherResponses, id: \.name) { weather in
                    WeatherCardView(weather: weather)
                }
            }
            .navigationTitle("WeatherApp")
            .navigationBarItems(trailing: Button("Add City") {
                // This button could trigger a modal or another view to add a new city
            })
        }
    }
}

// A card view to display weather for a single city
struct WeatherCardView: View {
    let weather: WeatherResponse

    var body: some View {
        VStack(alignment: .leading) {
            Text(weather.name)
                .font(.headline)
            HStack {
                Text("Current: \(weather.main.temp, specifier: "%.1f")°")
                Spacer()
                Text("H: \(weather.main.temp_max, specifier: "%.1f")° L: \(weather.main.temp_min, specifier: "%.1f")°")
            }
            Text(weather.weather.first?.description ?? "")
            HStack {
                Spacer()
                Text("Wind: \(weather.wind.speed, specifier: "%.1f") m/s")
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
        .shadow(radius: 5)
    }
}
