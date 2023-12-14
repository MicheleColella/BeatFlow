import SwiftUI

struct StartButtonView: View {
    @Binding var gameStarted: Bool
    
    var body: some View {
        LinearGradient(
            stops: [
                Gradient.Stop(color: Color(red: 0.33, green: 0.16, blue: 0.53), location: 0.00),
                Gradient.Stop(color: Color(red: 0.7, green: 0.22, blue: 0.93).opacity(0.88), location: 0.51),
                Gradient.Stop(color: Color(red: 0.02, green: 0.57, blue: 0.73).opacity(0.54), location: 1.00),
            ],
            startPoint: UnitPoint(x: 0.5, y: 0),
            endPoint: UnitPoint(x: 0.5, y: 1)
        ).overlay(
            ZStack {
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 350, height: 38)
                  .background(
                    LinearGradient(
                      stops: [
                        Gradient.Stop(color: Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.3), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0), location: 1.00),
                      ],
                      startPoint: UnitPoint(x: 0.5, y: 0),
                      endPoint: UnitPoint(x: 0.5, y: 1)
                    )
                  )
                  .cornerRadius(10)
                  .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2).offset(y:-340)
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
        ).ignoresSafeArea()
    }
}

#Preview {
    StartButtonView(gameStarted: .constant(false) )
}
