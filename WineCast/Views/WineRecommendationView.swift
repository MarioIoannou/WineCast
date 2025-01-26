import SwiftUI

struct WineRecommendationView: View {
    
    let wine: Wine
    let temperature: Double?
    let locationName: String?
    let humidity: Double?
    let isRaining: Bool
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {

        ScrollView {

            VStack(spacing: Spacing.large) {
                
                if let temp = temperature {
                    TemperatureCard(
                        temperature: temp,
                        locationName: locationName,
                        humidity: humidity,
                        isRaining: isRaining
                    )
                    
                    WineCard(wine: wine)
                    
                    WineDetailsView(wine: wine)
                    
                    PairingView(
                        description: wine.description,
                        pairingNotes: wine.pairingNotes,
                        learnMore: wine.learnMore
                    )
                }
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
