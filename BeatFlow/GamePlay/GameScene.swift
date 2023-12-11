import SpriteKit
import SwiftUI

///Dichiarazione valori delle frecce
enum CutDirection {
    case any, leftToRight, rightToLeft, topToBottom, bottomToTop
}

///Dichiarazione della nota come oggetto
class Note: SKSpriteNode {
    var isCut: Bool = false
    var cutDirection: CutDirection = .any // Direzione di taglio di default
    var cubeTexture: SKTexture = SKTexture() // Texture della nota
}

///Scena Gameplay
class GameScene: SKScene {
    ///Target linee
    var heightA: CGFloat = 50 //Altezza linea 1
    var heightB: CGFloat = 250 //Altezza linea 2
    
    ///Timer canzone
    var gameTimer: Timer?
    var gameDuration: TimeInterval?
    
    ///Label di fine livello
    var endGameButton: SKSpriteNode?
    var scoreLabel: SKLabelNode!
    
    ///Punteggio
    var gameScore: GameScore?
    public var score: Int = 0
    
    ///Array note
    var notes: [Note] = []
    
    ///Valori modificabili: bpm, colonna delle noto e direzione frecce
    var songName: String?
    var bpm: Double?
    var columnSequence1: [Int]? = nil
    var columnSequence2: [Int]? = nil
    var columnSequence3: [Int]? = nil
    var cutDirections1: [CutDirection]? = nil
    var cutDirections2: [CutDirection]? = nil
    var cutDirections3: [CutDirection]? = nil
    var startDelay: Double?
    
    ///Regolazione delle note
    let distanceBetweenNotes: CGFloat = 18 // Distanza orizzontale tra le note
    let noteWidth: CGFloat = 90 // Larghezza delle note
    let noteHeight: CGFloat = 129 // Altezza delle note
    let verticalDistanceBetweenNotes: CGFloat = 250 // Distanza verticale tra le note
    
    ///Assegnazione delle texture alle note
    let arrowTextureUp = SKTexture(imageNamed: "arrow_up")
    let arrowTextureDown = SKTexture(imageNamed: "arrow_down")
    let arrowTextureLeft = SKTexture(imageNamed: "arrow_left")
    let arrowTextureRight = SKTexture(imageNamed: "arrow_right")
    
    ///Avvio della scena
    override func didMove(to view: SKView) {
        createNotes()
        drawHorizontalLines()
        
        startGameTimer()
        AudioManager.shared.playBackgroundMusicWithDelay(delay: startDelay ?? 0, songName: songName ?? "")
    }
    
    ///Inizio del timer
    func startGameTimer() {
        gameTimer = Timer.scheduledTimer(timeInterval: gameDuration ?? 0, target: self, selector: #selector(endGame), userInfo: nil, repeats: false)
    }
    
    ///Quando il timer finisce avvia la funzione all'interno
    @objc func endGame() {
        showEndGameScreen()
    }
    
    ///Mostra la schermata di fine livello
    func showEndGameScreen() {
        let endGameScene = EndGameScene(size: self.size, finalScore: score)
        self.view?.presentScene(endGameScene)
    }
    
    ///Aggiornamento continuo del punteggio
    override func update(_ currentTime: TimeInterval) {
        gameScore?.score = score
    }
    
    ///Disegna le linee orizzontali
    func drawHorizontalLines() {
        let lineA = SKShapeNode()
        let lineB = SKShapeNode()
        
        let pathA = CGMutablePath()
        let pathB = CGMutablePath()
        
        let startX: CGFloat = -500
        let endX: CGFloat = 500
        
        // Crea i punti di inizio e fine per le due linee
        let startPointA = CGPoint(x: startX, y: heightA)
        let endPointA = CGPoint(x: endX, y: heightA)
        
        let startPointB = CGPoint(x: startX, y: heightB)
        let endPointB = CGPoint(x: endX, y: heightB)
        
        // Crea il percorso delle due linee
        pathA.move(to: startPointA)
        pathA.addLine(to: endPointA)
        
        pathB.move(to: startPointB)
        pathB.addLine(to: endPointB)
        
        // Imposta le proprietà delle linee
        lineA.path = pathA
        lineA.strokeColor = .red // Modifica il colore
        lineA.lineWidth = 2 // Modifica lo spessore
        
        lineB.path = pathB
        lineB.strokeColor = .blue // Modifica il colore
        lineB.lineWidth = 2 // Modifica lo spessore
        
        // Aggiungi le linee alla scena
        addChild(lineA)
        addChild(lineB)
    }
    
    ///Creazione delle note
    func createNotes() {
        let numberOfColumns = columnSequence1?.count
        let yOffsetOffset: CGFloat = 1000
        
        //Piazzamento delle note nella prima colonna
        for i in 0..<(numberOfColumns ?? 0) {
            let column = columnSequence1?[i]
            if column != 0 {
                let note = Note(color: .white, size: CGSize(width: noteWidth, height: noteHeight))
                let yOffset = size.height / 4 + CGFloat(i) * verticalDistanceBetweenNotes + yOffsetOffset // Altezza basata sull'indice
                let xPosition = 0 * (noteWidth + distanceBetweenNotes) + noteWidth / 2 + 45
                note.position = CGPoint(x: xPosition, y: yOffset)
                note.name = "Note"
                note.cutDirection = cutDirections1?[i] ?? .any // Associa la direzione di taglio alla nota
                
                // Imposta la texture del cubo per la nota attuale
                note.texture = note.cubeTexture
                
                notes.append(note)
                addChild(note)
                
                print(xPosition)}
        }
        
        //Piazzamento delle note nella seconda colonna
        for i in 0..<(numberOfColumns ?? 0) {
            let column = columnSequence2?[i]
            if column != 0 {
                let note = Note(color: .white, size: CGSize(width: noteWidth, height: noteHeight))
                let yOffset = size.height / 4 + CGFloat(i) * verticalDistanceBetweenNotes + yOffsetOffset // Altezza basata sull'indice
                let xPosition = 1 * (noteWidth + distanceBetweenNotes) + noteWidth / 2 + 45
                note.position = CGPoint(x: xPosition, y: yOffset)
                note.name = "Note"
                note.cutDirection = cutDirections2?[i] ?? .any // Associa la direzione di taglio alla nota
                
                // Imposta la texture del cubo per la nota attuale
                note.texture = note.cubeTexture
                
                notes.append(note)
                addChild(note)
                
                print(xPosition)}
        }
        
        //Piazzamento delle note nella terza colonna
        for i in 0..<(numberOfColumns ?? 0) {
            let column = columnSequence3?[i]
            if column != 0 {
                let note = Note(color: .white, size: CGSize(width: noteWidth, height: noteHeight))
                let yOffset = size.height / 4 + CGFloat(i) * verticalDistanceBetweenNotes + yOffsetOffset // Altezza basata sull'indice
                let xPosition = 2 * (noteWidth + distanceBetweenNotes) + noteWidth / 2 + 45
                note.position = CGPoint(x: xPosition, y: yOffset)
                note.name = "Note"
                note.cutDirection = cutDirections3?[i] ?? .any // Associa la direzione di taglio alla nota
                
                // Imposta la texture del cubo per la nota attuale
                note.texture = note.cubeTexture
                
                notes.append(note)
                addChild(note)
                
                print(xPosition)}
        }
        
        // Imposta le texture delle frecce sulla nota attuale
        setArrowTexturesForNotes()
        
        startNotesMovement(bpm: bpm ?? 0)
    }
    
    func setArrowTexturesForNotes() {
        for (_, note) in notes.enumerated() {
            switch note.cutDirection {
            case .topToBottom:
                note.texture = arrowTextureDown
            case .bottomToTop:
                note.texture = arrowTextureUp
            case .leftToRight:
                note.texture = arrowTextureLeft
            case .rightToLeft:
                note.texture = arrowTextureRight
            default:
                note.texture = note.cubeTexture // Se non c'è una direzione specifica, ripristina la texture del cubo
            }
        }
    }
    
    ///Avvia il movimento delle note
    func startNotesMovement(bpm: Double) {
        //Velocità delle note in base ai bpm
        let noteSpeed: CGFloat = 60 / bpm * 1000
        
        let moveAction = SKAction.moveBy(x: 0, y: -1000, duration: TimeInterval(1000 / noteSpeed)) // Modifica la durata in base alla velocità desiderata
        for note in notes {
            note.run(SKAction.repeatForever(moveAction))
        }
    }
    
    ///-----------------------  INIZIO LOGICA DEL TAGLIO  ---------------------------------
    ///Logica di taglio delle note (Da modificare)
    var touchPoints: [CGPoint] = []
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        touchPoints.append(touchLocation)
        
        for note in notes {
            if !note.isCut {
                let noteFrame = note.frame
                
                for i in 0..<touchPoints.count - 1 {
                    let startPoint = touchPoints[i]
                    let endPoint = touchPoints[i + 1]
                    
                    if noteFrame.contains(startPoint) && noteFrame.contains(endPoint) {
                        // Verifica se la posizione verticale della nota è tra l'altezza A e B
                        if note.position.y >= heightA && note.position.y <= heightB {
                            let touchAngle = atan2(endPoint.y - startPoint.y, endPoint.x - startPoint.x)
                            let noteDirection = direction(for: note.cutDirection)
                            let difference = angleDifference(angle1: touchAngle, angle2: noteDirection)
                            let tolerance: CGFloat = CGFloat.pi / 6 // 30 gradi di tolleranza
                            
                            if difference < tolerance {
                                score += 1
                                print(score)
                                // Aggiungi suono, effetti o altre azioni per indicare il taglio della nota
                                // Aggiorna il punteggio, ecc.
                                
                                
                            } else {
                                score -= 1
                                print(score)
                                // Aggiungi altre azioni o effetti per indicare un taglio errato
                            }
                            
                            note.isCut = true
                            note.removeFromParent()
                        }
                    }
                }
            }
        }
    }
    
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchPoints.removeAll()
    }
    
    func direction(for cutDirection: CutDirection) -> CGFloat {
        switch cutDirection {
        case .leftToRight:
            return CGFloat.pi // Direzione da sinistra a destra, corrispondente a 180 gradi o pi radianti
        case .rightToLeft:
            return 0 // Direzione da destra a sinistra, corrispondente a 0 gradi o 0 radianti
        case .topToBottom:
            return -CGFloat.pi / 2 // Direzione dall'alto verso il basso, corrispondente a -90 gradi o -pi/2 radianti
        case .bottomToTop:
            return CGFloat.pi / 2 // Direzione dal basso verso l'alto, corrispondente a 90 gradi o pi/2 radianti
        case .any:
            return 0 // Se non c'è una direzione specifica, si può impostare un valore predefinito (in questo caso, 0)
        }
    }
    
    func angleDifference(angle1: CGFloat, angle2: CGFloat) -> CGFloat {
        let twoPi: CGFloat = 2 * .pi
        var difference = (angle2 - angle1).truncatingRemainder(dividingBy: twoPi)
        if difference <= -CGFloat.pi {
            difference += twoPi
        }
        if difference > CGFloat.pi {
            difference -= twoPi
        }
        return abs(difference)
    }
    ///--------------------------- FINE LOGICA DEL TAGLIO -----------------------------------
    
    ///Mostra il pulsante finale
    func showEndGameButton() {
        // Crea il pulsante con un'immagine o una forma
        endGameButton = SKSpriteNode(imageNamed: "nome_dell_immagine") // Sostituisci "nome_dell_immagine" con il nome della tua immagine per il pulsante
        
        // Imposta la posizione del pulsante sulla scena
        endGameButton?.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        // Aggiungi il pulsante alla scena
        if let button = endGameButton {
            addChild(button)
        }
        
        // Aggiungi un azione al tocco del pulsante
        endGameButton?.isUserInteractionEnabled = true
        endGameButton?.name = "EndGameButton"
    }
    
    // Funzione chiamata quando tutte le note sono finite
    func allNotesFinished() {
        // Fai comparire il pulsante quando tutte le note sono state rimosse dalla scena
        showEndGameButton()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Controlla se l'utente tocca il pulsante di fine gioco
        for touch in touches {
            let location = touch.location(in: self)
            if let button = endGameButton, button.contains(location) {
                print("Torna al menu") // Azione desiderata quando si tocca il pulsante
            }
        }
    }
}


///Classe del pulsante finale
class EndGameScene: SKScene {
    let finalScore: Int
    
    init(size: CGSize, finalScore: Int) {
        self.finalScore = finalScore
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        // Crea la schermata di fine gioco con lo score ottenuto e un pulsante "Exit to Menu"
        createEndGameScreen()
    }
    
    func createEndGameScreen() {
        //Schermata di fine gioco
        let scoreLabel = SKLabelNode(text: "Final Score: \(finalScore)")
        scoreLabel.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(scoreLabel)
        
        let exitButton = SKLabelNode(text: "Exit to Menu")
        exitButton.name = "ExitButton"
        exitButton.position = CGPoint(x: size.width / 2, y: size.height / 2 - 50)
        addChild(exitButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        
        if let nodeTouched = nodes(at: touchLocation).first {
            if nodeTouched.name == "ExitButton" {
                // Assicurati di avere questa riga per eseguire il print
                print("Uscita dal gioco")
                // Includi altre azioni che desideri eseguire quando il pulsante "Exit to Menu" viene premuto
            }
        }
    }
}
