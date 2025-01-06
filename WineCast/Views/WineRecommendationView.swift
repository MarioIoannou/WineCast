import SwiftUI

struct WineRecommendationView: View {
    
    let wine: Wine
    let temperature: Double?
    let locationName: String?
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(spacing: Spacing.large) {
                if let temp = temperature {
                    TemperatureCard(
                        temperature: temp,
                        locationName: locationName
                    )
                }
                
                WineCard(wine: wine)
                
                PairingView(
                    description: wine.description,
                    pairingNotes: wine.pairingNotes
                )
            }
            .padding(.horizontal, Spacing.large)
            .padding(.vertical, Spacing.extraLarge)
        }
        .background(
            Colors.background
                .opacity(colorScheme == .dark ? 1 : 0.5)
                .ignoresSafeArea()
        )
    }
} 
