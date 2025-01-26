import SwiftUI

struct WeatherConditionBadges: View {
    
    let humidity: Double?
    let isRaining: Bool
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: Spacing.medium) {
                
                if let humidity = humidity {
                    
                    WeatherBadge(
                        icon: "humidity",
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
