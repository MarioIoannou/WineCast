import SwiftUI

struct WineTypeTag: View {
    
    let type: Wine.WineType
    
    var body: some View {
        
        Text(String(describing: type).capitalized)
            .font(.system(size: FontSize.small, weight: .semibold))
            .foregroundStyle(.white)
            .padding(.horizontal, Spacing.medium)
            .padding(.vertical, Spacing.small)
            .background(
                Capsule()
                    .fill(tagColor)
            )
    }
    
    private var tagColor: Color {
        
        switch type {
        case .red: return Colors.primary
        case .white: return Colors.secondary
        case .rose: return Color(red: 0.957, green: 0.639, blue: 0.635)
        case .sparkling: return Color(red: 0.945, green: 0.776, blue: 0.356)
            
        }
    }
} 
