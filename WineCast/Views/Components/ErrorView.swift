import SwiftUI

struct ErrorView: View {
    
    let retryAction: () -> Void
    
    var body: some View {
        
        VStack(spacing: Spacing.large) {
            
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 48))
                .foregroundStyle(Colors.primary)
            
            Text("Unable to get recommendation")
                .font(.system(size: FontSize.body))
                .foregroundStyle(Colors.text)
            
            Button(action: retryAction) {
                Text("Try Again")
                    .font(.system(size: FontSize.body, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, Spacing.extraLarge)
                    .padding(.vertical, Spacing.medium)
                    .background(Colors.primary)
                    .cornerRadius(12)
            }
        }
    }
} 
