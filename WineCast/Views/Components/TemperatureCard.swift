import SwiftUI

struct TemperatureCard: View {
    
    let temperature: Double
    let locationName: String?
    
    @State private var isAnimating = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: Spacing.medium) {
            
            if let location = locationName {
                Text(location)
                    .font(.system(size: FontSize.small, weight: .medium))
                    .foregroundStyle(Colors.secondary)
            }
            
            HStack(spacing: Spacing.medium) {

                ZStack {
                    
                    Circle()
                        .fill(Colors.primary.opacity(0.1))
                        .frame(width: 60, height: 60)
                    
                    Image(systemName: temperatureIcon)
                        .font(.system(size: 28))
                        .foregroundStyle(Colors.primary)
                        .symbolEffect(.bounce.up, value: isAnimating)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    Text("Current Temperature")
                        .font(.system(size: FontSize.small, weight: .medium))
                        .foregroundStyle(Colors.secondary)
                    
                    Text("\(Int(temperature))°C")
                        .font(.system(size: FontSize.title, weight: .bold))
                        .foregroundStyle(Colors.text)
                }
            }
        }
        .padding(Spacing.large)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Colors.background)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
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
} 
