import SwiftUI

struct PairingView: View {
    // MARK: - Properties
    let description: [String]
    let pairingNotes: [String]
    let learnMore: [String]
    @State private var isAnimating = false
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.large) {

            // Wine Description
            CardContainer {
                SectionHeader(
                    icon: "wineglass.fill",
                    title: "About this Wine",
                    subtitle: "Learn about the characteristics"
                )
                
                WineDescriptionList(
                    mainDescription: description.first ?? "",
                    details: Array(description.dropFirst()),
                    learnMore: learnMore,
                    isAnimating: isAnimating
                )
            }
            
            // Food Pairing
            CardContainer {
                SectionHeader(
                    icon: "fork.knife.circle.fill",
                    title: "Perfect Pairings",
                    subtitle: "Food and occasion suggestions"
                )
                
                PairingNotesList(
                    notes: pairingNotes,
                    isAnimating: isAnimating
                )
            }
        }
        .onAppear {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                isAnimating.toggle()
            }
        }
    }
}

private struct WineDescriptionList: View {
    let mainDescription: String
    let details: [String]
    let learnMore: [String]
    let isAnimating: Bool
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.medium) {

            // Main Description
            Text(mainDescription)
                .font(.system(size: FontSize.body, weight: .medium))
                .foregroundStyle(Colors.primary)
                .padding(.bottom, 4)
            
            // Details
            ForEach(details, id: \.self) { detail in
                HStack(alignment: .top, spacing: Spacing.small) {
                    Image(systemName: "circle.fill")
                        .font(.system(size: 6))
                        .foregroundStyle(Colors.primary)
                        .padding(.top, 8)
                    
                    Text(detail)
                        .font(.system(size: FontSize.body))
                        .foregroundStyle(Colors.text)
                        .lineSpacing(6)
                }
            }
            
            // Learn More 
            if !learnMore.isEmpty {
                VStack(alignment: .leading, spacing: Spacing.small) {
                    if isExpanded {
                        ForEach(learnMore, id: \.self) { fact in
                            HStack(alignment: .top, spacing: Spacing.small) {
                                Image(systemName: "info.circle.fill")
                                    .font(.system(size: FontSize.body))
                                    .foregroundStyle(Colors.primary)
                                    .symbolEffect(.bounce, value: isAnimating)
                                
                                Text(fact)
                                    .font(.system(size: FontSize.body))
                                    .foregroundStyle(Colors.text)
                                    .lineSpacing(6)
                            }
                            .padding(.vertical, 2)
                        }
                    }
                    
                    Button(action: {
                        withAnimation(.spring(response: 0.3)) {
                            isExpanded.toggle()
                        }
                    }) {
                        HStack(spacing: Spacing.small) {
                            Text(isExpanded ? "Show Less" : "Learn More")
                            Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        }
                        .font(.system(size: FontSize.small, weight: .medium))
                        .foregroundStyle(Colors.primary)
                    }
                }
            }
        }
        .padding(Spacing.large)
        .background(cardBackground)
    }
    
    private var cardBackground: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Colors.background)
            .shadow(color: Color.black.opacity(0.03), radius: 8, x: 0, y: 4)
    }
}

private struct PairingNotesList: View {
    let notes: [String]
    let isAnimating: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.medium) {
            ForEach(notes, id: \.self) { note in
                HStack(alignment: .top, spacing: Spacing.small) {
                    Image(systemName: "star.fill")
                        .font(.system(size: FontSize.body))
                        .foregroundStyle(Colors.primary)
                        .symbolEffect(.bounce, value: isAnimating)
                    
                    Text(note)
                        .font(.system(size: FontSize.body))
                        .foregroundStyle(Colors.text)
                        .lineSpacing(6)
                }
                .padding(.vertical, 4)
            }
        }
        .padding(Spacing.large)
        .background(cardBackground)
    }
    
    private var cardBackground: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Colors.background)
            .shadow(color: Color.black.opacity(0.03), radius: 8, x: 0, y: 4)
    }
}

private struct IconCircle: View {
    let icon: String
    let color: Color
    let isAnimating: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .fill(SwiftUI.Color(color).opacity(0.15))
                .frame(width: 48, height: 48)
            
            Image(systemName: icon)
                .font(.system(size: FontSize.title, weight: .medium))
                .foregroundStyle(color)
                .symbolEffect(.bounce, value: isAnimating)
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
