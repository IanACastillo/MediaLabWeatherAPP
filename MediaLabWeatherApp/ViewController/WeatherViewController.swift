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
                // Search bar and button
                HStack {
                    TextField("Search for city", text: $viewModel.searchTerm, onCommit: {
                        viewModel.search()
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                    Spacer() // Pushes the button to the left

                    Button(action: {
                        viewModel.search()
                    }) {
                        Text("Search")
                    }
                    .padding(.trailing, 20) // Adds padding to the trailing edge of the search button
                }

                // List of weather cards
                List(viewModel.weatherResponses, id: \.name) { weather in
                    WeatherCardView(weather: weather)
                }
            }
            .navigationTitle("WeatherApp")
            .navigationBarItems(trailing: Button("Add City") {
                // Trigger a modal or another view to add a new city
            })
        }
    }
}

struct WeatherCardView: View {
    let weather: WeatherResponse

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                // Weather image
                if let icon = weather.weather.first?.icon {
                    let imageUrl = "https://openweathermap.org/img/wn/\(icon)@2x.png"
                    AsyncImage(url: URL(string: imageUrl)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 50, height: 50)
                }

                // Weather details
                VStack(alignment: .leading) {
                    Text(weather.name)
                        .font(.headline)
                    Text("Current: \(weather.main.temp, specifier: "%.1f")°")
                    Text("H: \(weather.main.temp_max, specifier: "%.1f")° L: \(weather.main.temp_min, specifier: "%.1f")°")
                    Text(weather.weather.first?.description ?? "")
                    Text("Wind: \(weather.wind.speed, specifier: "%.1f") m/s")
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
        .shadow(radius: 5)
    }
}
