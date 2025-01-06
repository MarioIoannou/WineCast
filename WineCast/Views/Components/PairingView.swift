import SwiftUI

struct PairingView: View {
    
    let description: String
    let pairingNotes: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: Spacing.large) {
            
            VStack(alignment: .leading, spacing: Spacing.medium) {
                
                HStack {
                    Image(systemName: "questionmark.circle.fill")
                        .font(.system(size: 24))
                        .foregroundStyle(Colors.primary)
                    
                    Text("Why this wine?")
                        .font(.system(size: FontSize.body, weight: .semibold))
                        .foregroundStyle(Colors.primary)
                }
                
                Text(description)
                    .font(.system(size: FontSize.body))
                    .foregroundStyle(Colors.text)
                    .lineSpacing(4)
            }
            .padding(Spacing.large)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Colors.background)
                    .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
            )
            
            
            VStack(alignment: .leading, spacing: Spacing.medium) {
                
                HStack {
                    Image(systemName: "fork.knife")
                        .font(.system(size: 24))
                        .foregroundStyle(Colors.primary)
                    
                    Text("Perfect Pairings")
                        .font(.system(size: FontSize.body, weight: .semibold))
                        .foregroundStyle(Colors.primary)
                }
                
                Text(pairingNotes)
                    .font(.system(size: FontSize.body))
                    .foregroundStyle(Colors.text)
                    .lineSpacing(4)
            }
            .padding(Spacing.large)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Colors.background)
                    .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
            )
        }
    }
} 
