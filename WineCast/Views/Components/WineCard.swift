import SwiftUI

struct WineCard: View {
    
    let wine: Wine
    
    @State private var isPressed = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: Spacing.medium) {
            
            HStack {
                Image(systemName: wineTypeIcon)
                    .font(.system(size: 32))
                    .foregroundStyle(Colors.primary)
                    .symbolEffect(.bounce, value: isPressed)
                
                Spacer()
                
                WineTypeTag(type: wine.type)
            }
            .padding(.bottom, Spacing.small)
            
            Text(wine.name)
                .font(.system(size: FontSize.title, weight: .bold))
                .foregroundStyle(Colors.primary)
                .padding(.bottom, Spacing.small)
        }
        .padding(Spacing.large)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Colors.background)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
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
        case .rose: return "drop.fill"
        case .sparkling: return "bubbles.and.sparkles"
        }
    }
} 
