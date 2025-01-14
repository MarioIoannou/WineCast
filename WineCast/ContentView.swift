//
//  ContentView.swift
//  WineCast
//
//  Created by Marios Ioannou on 6/1/25.
//

import SwiftUI
import CoreLocation
import SafariServices

struct ContentView: View {
    
    @StateObject private var locationManager = LocationManager()
    @StateObject private var weatherService = WeatherService()
    
    @State private var currentWine: Wine?
    @State private var isLoading = true
    @State private var showSettings = false
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Colors.background
                    .ignoresSafeArea()
                
                if isLoading {
                    LoadingView()
                } else if let wine = currentWine {
                    WineRecommendationView(
                        wine: wine,
                        temperature: weatherService.temperature,
                        locationName: weatherService.locationName
                    )
                } else {
                    ErrorView {
                        Task {
                            await fetchWineRecommendation()
                        }
                    }
                }
            }
            .navigationTitle("WineCast")
            .navigationBarTitleDisplayMode(.large)
            .task {
                await fetchWineRecommendation()
            }
            .alert("Location Access Required", 
                   isPresented: .constant(locationManager.error != nil),
                   actions: {
                if locationManager.authorizationStatus == .denied {
                    Button("Open Settings") {
                        showSettings = true
                    }
                }
                Button("Retry") {
                    Task {
                        await fetchWineRecommendation()
                    }
                }
                Button("Cancel", role: .cancel) {}
            }, message: {
                Text(locationManager.error?.localizedDescription ?? "Unknown error")
            })
            .sheet(isPresented: $showSettings) {
                if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
                    SafariView(url: settingsUrl)
                }
            }
        }
    }
    
    private func fetchWineRecommendation() async {
        
        isLoading = true
        defer { isLoading = false }
        
        locationManager.requestLocation()
        
        
        for _ in 0..<10 {
            
            if let location = locationManager.location {
                print("Got location: \(location.coordinate)")
                await weatherService.fetchWeather(for: location)
                
                if let temperature = weatherService.temperature {
                    print("Got temperature: \(temperature)°C")
                    currentWine = WineRecommendationService.shared.recommendWine(
                        temperature: temperature,
                        isRaining: weatherService.isRaining,
                        humidity: weatherService.humidity ?? 0
                    )
                    return
                }
            }
            try? await Task.sleep(for: .seconds(1))
        }
        
        print("Failed to get location or weather data")
    }
}

struct SafariView: UIViewControllerRepresentable {
    
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}

#Preview {
    ContentView()
}
