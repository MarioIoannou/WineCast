import SwiftUI

struct WineTypeTag: View {

    let type: Wine.WineType
    
    var body: some View {

        Text(typeText)
            .font(.system(size: FontSize.small, weight: .semibold))
            .foregroundStyle(tagColor)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(
                Capsule()
                    .fill(tagColor.opacity(0.15))
            )
    }
    
    private var typeText: String {

        switch type {
        case .red: return "Red"
        case .white: return "White"
        case .rose: return "Rosé"
        case .sparkling: return "Sparkling"
        }
    }
    
    private var tagColor: Color {

        switch type {
        case .red: return Color(red: 0.7, green: 0.1, blue: 0.2)
        case .white: return Color(red: 0.98, green: 0.84, blue: 0.65)
        case .rose: return Color(red: 0.957, green: 0.639, blue: 0.635)
        case .sparkling: return Color(red: 0.945, green: 0.776, blue: 0.356)
        }
    }
} 
