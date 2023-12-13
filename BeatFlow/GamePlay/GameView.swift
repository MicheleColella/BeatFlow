import SwiftUI
import SpriteKit

class GameManager: ObservableObject {
    @Published var score: Int = 0
    @Published var endedGame: Bool = false
    @Published var actualCombo: Int = 0
    @Published var highestCombo: Int = 0
    @Published var actualHealth: Int = 0
}

struct GameView: View {
    var songInt = 0
    
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
                    
                    
                    ZStack{
                        SpriteView(scene: self.arcadeGameScene)
                            .frame(width: screenWidth, height: screenHeight)
                            .statusBar(hidden: true)
                            .ignoresSafeArea()
                            .environmentObject(gameManager)
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
                          .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2).offset(y:-351)
                        if gameManager.score != 0{
                            Text("\(gameManager.score)")
                                .font(
                                    Font.custom("SF Compact", size: 48)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white.opacity(0.81))
                                .frame(width: 834, height: 103, alignment: .top)
                                .offset(x: 0, y: -250)
                        }
                        if gameManager.actualCombo != 0{
                            Text("×\(gameManager.actualCombo)")
                                .font(
                                    Font.custom("SF Compact", size: 36)
                                        .weight(.medium)
                                )
                                .kerning(4.32)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white.opacity(0.85))
                                .frame(width: 158, height: 43, alignment: .top)
                                .offset(x: 0, y: -230)
                        }
                    }
                }
                
                if gameStarted && gameManager.endedGame{
                    EndGameView(score: $gameManager.score, highestCombo: $gameManager.highestCombo)
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
