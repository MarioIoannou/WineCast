import SwiftUI

struct TemperatureCard: View {
    
    let temperature: Double
    let locationName: String?
    let humidity: Double?
    let isRaining: Bool
    
    @State private var isAnimating = false
    
    var body: some View {

        VStack(alignment: .leading, spacing: Spacing.large) {
            
            // Location and Temperature
            VStack(alignment: .leading, spacing: Spacing.large) {
                if let location = locationName {
                    Label {
                        Text(location)
                            .font(.system(size: FontSize.title, weight: .medium))
                            .foregroundStyle(Colors.secondary)
                    } icon: {
                        Image(systemName: "location.fill")
                            .font(.system(size: FontSize.title))
                            .foregroundStyle(Colors.secondary)
                    }
                }
                
                HStack(alignment: .center, spacing: Spacing.medium) {
                    ZStack {
                        Circle()
                            .fill(temperatureColor.opacity(0.15))
                            .frame(width: 64, height: 64)
                        
                        Image(systemName: temperatureIcon)
                            .font(.system(size: 32, weight: .medium))
                            .foregroundStyle(temperatureColor)
                            .symbolEffect(.bounce, value: isAnimating)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(Int(temperature))°")
                            .font(.system(size: FontSize.title, weight: .bold))
                            .foregroundStyle(Colors.primary)
                        
                        Text(temperatureDescription)
                            .font(.system(size: FontSize.small))
                            .foregroundStyle(Colors.secondary)
                    }
                    
                    Spacer()
                    
                    if humidity != nil || isRaining {
                        
                        HStack(spacing: Spacing.medium) {
                            if let humidity = humidity {
                                WeatherBadge(
                                    icon: "humidity.fill",
                                    text: "\(Int(humidity))%",
                                    color: humidityColor(humidity)
                                )
                            }
                            
                            if isRaining {
                                WeatherBadge(
                                    icon: "cloud.rain.fill",
                                    text: "Raining",
                                    color: .blue
                                )
                            }
                        }
                    }
                }
            }
        }
        .padding(Spacing.large)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Colors.background)
                .shadow(color: Color.black.opacity(0.05), radius: 12, x: 0, y: 6)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(SwiftUI.Color(Colors.primary).opacity(0.1), lineWidth: 1)
                )
        )
        .onAppear {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6).repeatForever(autoreverses: true)) {
                isAnimating.toggle()
            }
        }
    }
    
    private var temperatureIcon: String {
        if temperature < 10 {
            return "thermometer.snowflake"
        } else if temperature > 30 {
            return "thermometer.sun.fill"
        } else {
            return "thermometer.medium"
        }
    }
    
    private var temperatureDescription: String {
        if temperature < 10 {
            return "Cold"
        } else if temperature > 30 {
            return "Hot"
        } else {
            return "Moderate"
        }
    }
    
    private var temperatureColor: Color {
        if temperature < 10 {
            return .blue
        } else if temperature > 30 {
            return .orange
        } else {
            return .green
        }
    }
    
    private func humidityColor(_ humidity: Double) -> Color {
        if humidity < 40 {
            return .orange
        } else if humidity > 70 {
            return .blue
        } else {
            return .green
        }
    }
} 
