import Foundation
import CoreLocation

class WeatherService: ObservableObject {
    
    private let apiKey = "f0d92d73c6e62b9afc1b7db2126e4b77"
    
    @Published var temperature: Double?
    @Published var isRaining: Bool = false
    @Published var humidity: Double?
    @Published var locationName: String?
    @Published var error: Error?
    
    func fetchWeather(for location: CLLocation) async {
        
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
            
            DispatchQueue.main.async {
                self.temperature = weather.main.temp
                self.humidity = weather.main.humidity
                self.isRaining = weather.weather.contains { $0.main.lowercased().contains("rain") }
                self.locationName = weather.name
            }
        } catch {
            DispatchQueue.main.async {
                self.error = error
            }
        }
    }
}

struct WeatherResponse: Codable {
    
    let main: MainWeather
    let weather: [Weather]
    let name: String
}

struct MainWeather: Codable {
    
    let temp: Double
    let humidity: Double
}

struct Weather: Codable {
    
    let main: String
    let description: String
} 
