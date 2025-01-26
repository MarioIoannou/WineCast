import SwiftUI

struct WineCard: View {
    let wine: Wine
    @State private var isPressed = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: Spacing.medium) {

            // Header with icon and type
            HStack(alignment: .top) {
                ZStack {
                    Circle()
                        .fill(Colors.primary.opacity(0.15))
                        .frame(width: 48, height: 48)
                    
                    Image(systemName: wineTypeIcon)
                        .font(.system(size: 24, weight: .medium))
                        .foregroundStyle(Colors.primary)
                        .symbolEffect(.bounce, value: isPressed)
                }
                
                Spacer()
                
                WineTypeTag(type: wine.type)
            }
            
            // Wine Name
            VStack(alignment: .leading, spacing: Spacing.small) {
                
                Text(wine.name.first ?? "")
                    .font(.system(size: FontSize.title, weight: .bold))
                    .foregroundStyle(Colors.primary)
                
                if wine.name.count > 1 {
                    HStack(spacing: Spacing.medium) {
                        ForEach(wine.name.dropFirst(), id: \.self) { name in
                            HStack(spacing: 4) {
                                Circle()
                                    .fill(Colors.secondary)
                                    .frame(width: 4, height: 4)
                                
                                Text(name)
                                    .font(.system(size: FontSize.body, weight: .medium))
                                    .foregroundStyle(Colors.secondary)
                            }
                        }
                    }
                }
            }
            .padding(.top, Spacing.small)
        }
        .padding(Spacing.large)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Colors.background)
                .shadow(color: Color.black.opacity(0.08), radius: 12, x: 0, y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Colors.primary.opacity(0.1), lineWidth: 1)
                )
        )
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                isPressed.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isPressed.toggle()
            }
        }
    }
    
    private var wineTypeIcon: String {
        
        switch wine.type {
            
        case .red: return "wineglass.fill"
        case .white: return "wineglass"
        case .rose: return "wineglass"
        case .sparkling: return "bubbles.and.sparkles"
            
        }
    }
} 
