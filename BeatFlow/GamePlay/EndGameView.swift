import SwiftUI

struct EndGameView: View {
    @Binding var score: Int
    @Binding var highestCombo: Int

    var body: some View {
        NavigationView() {
            VStack{
                Text("Score: \(score) MaxCombo: \(highestCombo)")
                NavigationLink(destination: SongList()) {
                    Text("Esci")
                }
            }
        }
    }
    
}

#Preview {
    EndGameView(score: .constant(0), highestCombo: .constant(0))
}
