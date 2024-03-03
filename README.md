# WeatherApp

WeatherApp is a modern, user-friendly application designed to provide real-time weather information for various cities worldwide. Utilizing the OpenWeatherMap API, this app showcases the power of SwiftUI for UI design, Combine for asynchronous networking, and adheres to the MVVM architectural pattern for clear separation of concerns.

## Features

- **Real-time Weather Information:** Fetches and displays current weather data including temperature, conditions, and wind speed for a dynamically searchable list of cities.
- **Dynamic UI with SwiftUI:** Leverages SwiftUI to create a responsive and adaptive user interface.
- **Asynchronous Networking with Combine:** Utilizes Combine for efficient API requests and data handling.
- **MVVM Architecture:** Implements Model-View-ViewModel (MVVM) architecture to ensure code readability, scalability, and maintainability.
- **Dynamic Image Loading:** Manages weather condition icons dynamically with SwiftUI's `AsyncImage`.

## Setup and Running the Project

1. **Clone the Repository:**
- git clone https://github.com/yourusername/WeatherApp.git
2. **Open the Project:**
- Open `WeatherApp.xcodeproj` in Xcode.
3. **API Key Configuration:**
- Sign up for an API key at [OpenWeatherMap](https://openweathermap.org/api).
- Replace the `appid` value in the `WeatherService.swift` with your own API key.
4. **Run the Project:**
- Select a target device or simulator.
- Hit the Run button in Xcode.

## Project Structure

- **Model (`WeatherModel.swift`):** Defines the structure for the weather data.
- **View (`WeatherView.swift`):** Contains the SwiftUI views for displaying weather information.
- **ViewModel (`WeatherViewModel.swift`):** Bridges the data between the Model and the View, handling API requests and data processing.
- **Service (`WeatherService.swift`):** Manages the network requests to the OpenWeatherMap API.

## Architecture

This project is built using the **MVVM (Model-View-ViewModel)** architectural pattern, chosen for its strong separation of concerns, which facilitates easier testing and maintenance. 

## Future Improvements

- **Caching:** Implement local data caching to reduce API calls and allow offline access to previously searched weather data.
- **User Preferences:** Allow users to set preferences for units (metric, imperial) and manage a list of favorite cities.
- **Weather Forecast:** Extend functionality to include weather forecasts in addition to current conditions.
- **Internationalization:** Add support for multiple languages to enhance user accessibility.
- **Accessibility Improvements:** Ensure the app is fully accessible, including voice-over support and dynamic text sizing.

## Contributions

Contributions are welcome! Please feel free to submit a pull request or open an issue for further discussion.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ScreenShot

![Simulator Screenshot - iPhone SE (3rd generation) - 2024-03-03 at 14 12 27](https://github.com/IanACastillo/MediaLabWeatherAPP/assets/138615251/f8b6159b-b14e-4deb-a635-fa65e7176986)
