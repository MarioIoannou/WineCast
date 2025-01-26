import SwiftUI

struct WeatherBadge: View {

    let icon: String
    let text: String
    let color: Color
    
    var body: some View {

        HStack(spacing: Spacing.small) {
            Image(systemName: icon)
                .font(.system(size: FontSize.body))
            
            Text(text)
                .font(.system(size: FontSize.small, weight: .medium))
        }
        .padding(.horizontal, Spacing.medium)
        .padding(.vertical, Spacing.small)
        .background(
            Capsule()
                .fill(SwiftUI.Color(color).opacity(0.2))
        )
        .foregroundStyle(color)
    }
}

// #Preview {
//     HStack {
//         WeatherBadge(
//             icon: "thermometer.medium",
//             text: "25°C",
//             color: .green
//         )
        
//         WeatherBadge(
//             icon: "humidity",
//             text: "65%",
//             color: .blue
//         )
        
//         WeatherBadge(
//             icon: "cloud.rain.fill",
//             text: "Raining",
//             color: .blue
//         )
//     }
//     .padding()
// } 