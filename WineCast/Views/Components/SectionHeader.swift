import SwiftUI

struct SectionHeader: View {
    
    let icon: String
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.small) {
            HStack(spacing: Spacing.medium) {
                Image(systemName: icon)
                    .font(.system(size: 24, weight: .medium))
                    .foregroundStyle(Colors.primary)
                
                Text(title)
                    .font(.system(size: FontSize.body, weight: .semibold))
                    .foregroundStyle(Colors.primary)
            }
            
            Text(subtitle)
                .font(.system(size: FontSize.small))
                .foregroundStyle(Colors.secondary)
        }
    }
} 