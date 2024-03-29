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
                        .foregroundColor(Color.blue) // Use blue for the city name
                    Text("Current: \(weather.main.temp, specifier: "%.1f")°")
                    Text("H: \(weather.main.temp_max, specifier: "%.1f")° L: \(weather.main.temp_min, specifier: "%.1f")°")
                    Text(weather.weather.first?.description ?? "")
                        .foregroundColor(Color.orange) // Use orange for the weather description
                    Text("Wind: \(weather.wind.speed, specifier: "%.1f") m/s")
                }
            }
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.orange.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.orange]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
        )
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
