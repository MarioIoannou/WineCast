import SwiftUI

struct WineDetailsView: View {
    
    let wine: Wine
    
    @State private var isAnimating = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: Spacing.large) {
            
            // Serving Details
            CardContainer {
                SectionHeader(
                    icon: "thermometer.medium",
                    title: "Serving Guide",
                    subtitle: "Perfect temperature and glassware"
                )
                
                HStack(spacing: Spacing.medium) {
                    DetailCard(
                        icon: "thermometer.low",
                        title: "Temperature",
                        detail: wine.servingTemperature,
                        tint: .blue,
                        isAnimating: isAnimating
                    )
                    
                    DetailCard(
                        icon: "wineglass",
                        title: "Glassware",
                        detail: wine.recommendedGlassware,
                        tint: Colors.primary,
                        isAnimating: isAnimating
                    )
                }
            }
            
            // Aging & Quick Facts
            CardContainer {
                SectionHeader(
                    icon: "clock.fill",
                    title: "Aging & Facts",
                    subtitle: "Storage and characteristics"
                )
                
                DetailCard(
                    icon: "calendar",
                    title: "Aging Potential",
                    detail: wine.agingPotential,
                    tint: .orange,
                    isAnimating: isAnimating
                )
                
                QuickFactsList(facts: wine.quickFacts, isAnimating: isAnimating)
            }
        }
        .onAppear {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                isAnimating.toggle()
            }
        }
    }
}

private struct CardContainer<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.medium) {
            content
        }
        .padding(Spacing.large)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Colors.background)
                .shadow(color: Color.black.opacity(0.05), radius: 12, x: 0, y: 6)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(SwiftUI.Color(Colors.primary).opacity(0.1), lineWidth: 1)
                )
        )
    }
}

private struct QuickFactsList: View {
    
    let facts: [String]
    let isAnimating: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.medium) {
            Text("Quick Facts")
                .font(.system(size: FontSize.small, weight: .semibold))
                .foregroundStyle(Colors.secondary)
            
            ForEach(facts, id: \.self) { fact in
                HStack(alignment: .top, spacing: Spacing.small) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: FontSize.body))
                        .foregroundStyle(Colors.primary)
                        .symbolEffect(.bounce, value: isAnimating)
                    
                    Text(fact)
                        .font(.system(size: FontSize.body))
                        .foregroundStyle(Colors.text)
                        .lineSpacing(6)
                }
                .padding(.vertical, 4)
            }
        }
        .padding(Spacing.large)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.accentColor).opacity(0.1)
                .shadow(color: Color.black.opacity(0.03), radius: 8, x: 0, y: 4)
        )
    }
}

struct DetailCard: View {
    
    let icon: String
    let title: String
    let detail: String
    let tint: Color
    let isAnimating: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.medium) {
            ZStack {
                Circle()
                    .fill(SwiftUI.Color(tint).opacity(0.15))
                    .frame(width: 48, height: 48)
                
                Image(systemName: icon)
                    .font(.system(size: FontSize.title, weight: .medium))
                    .foregroundStyle(tint)
                    .symbolEffect(.bounce, value: isAnimating)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: FontSize.small, weight: .medium))
                    .foregroundStyle(Colors.secondary)
                
                Text(detail)
                    .font(.system(size: FontSize.body, weight: .medium))
                    .foregroundStyle(Colors.text)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(Spacing.medium)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(SwiftUI.Color(tint).opacity(0.1))
        )
    }
} 
