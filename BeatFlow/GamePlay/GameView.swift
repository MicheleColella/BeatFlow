import SwiftUI
import SpriteKit

class GameManager: ObservableObject {
    @Published var score: Int = 0
    @Published var endedGame: Bool = false
    @Published var actualCombo: Int = 0
    @Published var highestCombo: Int = 0
}

struct GameView: View {
    var songInt = 1
    
    var songSelection = SongSelection()
     
    @State public var gameStarted = false // Stato per gestire l'avvio del gioco
    @StateObject private var gameManager = GameManager() // Oggetto osservabile per il punteggio del gioco
    
    private var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    private var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
    
    var arcadeGameScene: GameScene {
        let scene = GameScene()
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
        scene.gameManager = gameManager
        
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
        NavigationView(content: {
             
        
        ZStack {
            if !gameStarted && !gameManager.endedGame{
                StartButtonView(gameStarted: $gameStarted)
            }
            
            if gameStarted && !gameManager.endedGame{
                SpriteView(scene: self.arcadeGameScene)
                    .frame(width: screenWidth, height: screenHeight)
                    .statusBar(hidden: true)
                    .ignoresSafeArea()
                    .environmentObject(gameManager)
                Text("\(gameManager.score)") // Visualizza lo score
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .offset(x: -150, y: -350)
                Text("\(gameManager.actualCombo)")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .offset(x: 150, y: -350)
            }
            
            if gameStarted && gameManager.endedGame{
                EndGameView()
            }
        }
        }).navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
