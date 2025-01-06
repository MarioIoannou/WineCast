import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        
        VStack(spacing: Spacing.medium) {
            
            ProgressView()
                .scaleEffect(1.5)
            Text("Getting wine recommendation...")
                .font(.system(size: FontSize.body))
                .foregroundStyle(Colors.text)
        }
    }
} 
