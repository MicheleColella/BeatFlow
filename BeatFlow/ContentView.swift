import SwiftUI

struct ContentView: View {
    @State private var progressValue: Float = 0.0
    let maxValue: Float = 10.0

    var body: some View {
        VStack {
            // Utilizzo di GeometryReader per impostare altezza e larghezza personalizzate
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: geometry.size.width, height: 40) // Altezza della progress bar
                        .opacity(0.3)
                        .foregroundColor(Color.gray)

                    Rectangle()
                        .frame(width: CGFloat(self.progressValue / self.maxValue) * geometry.size.width, height: 40) // Larghezza proporzionale alla progress bar
                        .foregroundColor(Color.red)
                }
            }
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
