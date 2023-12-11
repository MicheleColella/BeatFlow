import SwiftUI
import SpriteKit

class GameScore: ObservableObject {
    @Published var score: Int = 0
}

struct GameView: View {
    var songInt = 0
    
    var songSelection = SongSelection()
     
    @State public var gameStarted = false // Stato per gestire l'avvio del gioco
    @StateObject private var gameScore = GameScore() // Oggetto osservabile per il punteggio del gioco
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    private var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
    
    var arcadeGameScene: GameScene {
        let scene = GameScene()
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
        scene.gameScore = gameScore
        
        scene.startDelay = songSelection.song[songInt].startDelay
        scene.songName = songSelection.song[songInt].songName
        scene.gameDuration = songSelection.song[songInt].gameDuration
        scene.bpm = songSelection.song[songInt].bpm
        scene.columnSequence1 = songSelection.song[songInt].columnSequence1
        scene.columnSequence2 = songSelection.song[songInt].columnSequence2
        scene.columnSequence3 = songSelection.song[songInt].columnSequence3
        scene.cutDirections1 = songSelection.song[songInt].cutDirections1
        scene.cutDirections2 = songSelection.song[songInt].cutDirections2
        scene.cutDirections3 = songSelection.song[songInt].cutDirections3
        
        return scene
    }
    
    
    var body: some View {
        ZStack {
            if !gameStarted {
                StartButtonView(gameStarted: $gameStarted)
            }
            
            if gameStarted {
                SpriteView(scene: self.arcadeGameScene)
                    .frame(width: screenWidth, height: screenHeight)
                    .statusBar(hidden: true)
                    .ignoresSafeArea()
                    .environmentObject(gameScore)
                Text("\(gameScore.score)") // Visualizza lo score
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .offset(x: -150, y: -350)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
