import SwiftUI

struct StartButtonView: View {
    @Binding var gameStarted: Bool
    
    var body: some View {
        VStack {
            Button(action: {
                gameStarted = true
            }) {
                Text("Start")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.8))
    }
}

#Preview {
    StartButtonView(gameStarted: .constant(false) )
}
