import SpriteKit
import SwiftUI

///Dichiarazione valori delle frecce
enum CutDirection {
    case any, right, left, down, up
}

///Dichiarazione della nota come oggetto
class Note: SKSpriteNode {
    var isCut: Bool = false
    var cutDirection: CutDirection = .any // Direzione di taglio di default
    var cubeTexture: SKTexture = SKTexture() // Texture della nota
}

///Scena Gameplay
class GameScene: SKScene {
    var progressBar: SKShapeNode?
    ///Target linee
    var heightA: CGFloat = 100 //Altezza linea 1
    var heightB: CGFloat = 300 //Altezza linea 2
    
    ///Timer canzone
    var gameTimer: Timer?
    var gameDuration: TimeInterval?
    
    ///Label di fine livello
    var endGameButton: SKSpriteNode?
    var scoreLabel: SKLabelNode!
    
    ///Punteggio
    var gameManager: GameManager?
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
    let xOffsetPos: CGFloat = 20
    let distanceBetweenNotes: CGFloat = 40 // Distanza orizzontale tra le note
    let noteWidth: CGFloat = 90 // Larghezza delle note
    let noteHeight: CGFloat = 129 // Altezza delle note
    let verticalDistanceBetweenNotes: CGFloat = 250 // Distanza verticale tra le note
    
    ///Assegnazione delle texture alle note
    let arrowTextureUp = SKTexture(imageNamed: "arrow_up")
    let arrowTextureDown = SKTexture(imageNamed: "arrow_down")
    let arrowTextureLeft = SKTexture(imageNamed: "arrow_left")
    let arrowTextureRight = SKTexture(imageNamed: "arrow_right")
    
    ///Sistema di combo
    var combo: Int = 0
    var highestCombo: Int = 0
    let baseScoreForHit: Int = 2
    
    ///Sistema di vita
    var startLife = 10
    
    var contStartMusic: Int = 0

    
    ///Avvio della scena
    override func didMove(to view: SKView) {
        drawHorizontalLines()
        
        // Calcola l'altezza totale del rettangolo in base a heightA e heightB
        let totalHeight = heightB - heightA

        // Calcola l'altezza del rettangolo utilizzando totalHeight
        let rectangleHeight = totalHeight // Puoi anche regolare questa altezza se necessario

        // Crea il rettangolo
        let rectangle = SKShapeNode(rectOf: CGSize(width: 394, height: rectangleHeight))
        rectangle.fillColor = .clear
        rectangle.strokeColor = .clear

        // Calcola la posizione Y del centro del rettangolo
        let centerY = (heightA + heightB) / 2

        // Imposta la posizione del rettangolo in base al centro Y
        rectangle.position = CGPoint(x: self.size.width / 2, y: centerY)

        // Crea il nodo sfocatura per il rettangolo
        let blur = SKSpriteNode(color: .white, size: CGSize(width: 394, height: rectangleHeight))
        blur.alpha = 0.17
        blur.position = CGPoint(x: rectangle.frame.width / 2, y: centerY)
        blur.addChild(rectangle)

        // Aggiungi il rettangolo alla scena
        addChild(blur)


        
        gameManager?.actualHealth = startLife
        createNotes()
        
        let background = SKSpriteNode(imageNamed: "back") // Sostituisci "NomeImmagineConGradiente" con il nome effettivo del tuo file di immagine
                background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
                background.zPosition = -1 // Assicurati che lo sfondo sia dietro gli altri nodi
        let scaleFactor: CGFloat = 1.1 // Incremento leggero della scala, puoi regolare questo valore come desideri
        background.setScale(scaleFactor) // Imposta la scala del background

                addChild(background)
         
        progressBar = createProgressBar()
                addChild(progressBar!)
    }
    
    func createProgressBar() -> SKShapeNode {
        let progressBarWidth: CGFloat = 400 // Larghezza della barra di avanzamento
        let progressBarHeight: CGFloat = 38 // Altezza della barra di avanzamento
        
        // Calcola la posizione X desiderata per spostare la barra più a destra nella scena
        let progressBarXPosition = self.size.width - 20 - progressBarWidth / 2
        
        let progressBar = SKShapeNode(rectOf: CGSize(width: progressBarWidth, height: progressBarHeight)) // Utilizza un arrotondamento per i bordi
        progressBar.fillColor = .clear // Imposta il colore di riempimento a trasparente
        progressBar.strokeColor = .clear // Colore del bordo della barra
        progressBar.lineWidth = 2 // Spessore del bordo
        progressBar.position = CGPoint(x: progressBarXPosition-170, y: 716) // Posiziona la barra sulla scena
        
        return progressBar
    }


        // Aggiorna la barra di avanzamento in base al tempo rimanente
    func updateProgressBar() {
        guard let gameTimer = gameTimer, let gameDuration = gameDuration else {
            return
        }

        let timeRemaining = gameTimer.fireDate.timeIntervalSinceNow
        let progress = CGFloat(1 - (timeRemaining / gameDuration)) // Calcola il progresso come percentuale completata

        if let progressBar = progressBar {
            let progressBarWidth: CGFloat = 343 // Larghezza della barra di avanzamento

            let progressBarHeight: CGFloat = 38 // Altezza della barra di avanzamento
            
            // Calcola la posizione X desiderata per spostare la barra più a sinistra nella scena
            let progressBarXPosition = 20 + progressBarWidth / 2

            if let progressBarLeft = progressBar.childNode(withName: "progressBarLeft") as? SKShapeNode {
                progressBarLeft.removeFromParent()
            }

            let red = CGFloat((0x2F & 0xFF)) / 255.0
            let green = CGFloat((0xA3 & 0xFF)) / 255.0
            let blue = CGFloat((0xC4 & 0xFF)) / 255.0

            let customColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)

            let progressBarLeft = SKShapeNode(rectOf: CGSize(width: progressBarWidth * progress, height: progressBarHeight), cornerRadius: 10)
            progressBarLeft.fillColor = customColor // Colore di riempimento della parte sinistra della barra
            progressBarLeft.strokeColor = .clear // Nessun contorno
            progressBarLeft.position = CGPoint(x: progressBarXPosition - progressBarWidth / 2 + progressBarWidth * progress / 2, y: 50)

            progressBarLeft.name = "progressBarLeft"
            progressBar.addChild(progressBarLeft)
        }
    }




    
    ///Inizio del timer
    func startGameTimer() {
        gameTimer = Timer.scheduledTimer(timeInterval: gameDuration ?? 0, target: self, selector: #selector(endGame), userInfo: nil, repeats: false)
    }
    
    ///Quando il timer finisce avvia la funzione all'interno
    @objc func endGame() {
        AudioManager.shared.stopBackgroundMusic()
        showEndGameScreen()
    }
    
    ///Mostra la schermata di fine livello
    func showEndGameScreen() {
        gameManager?.endedGame = true
    }
    
    ///Aggiornamento continuo del punteggio
    override func update(_ currentTime: TimeInterval) {
        var isFirstNoteAtHeight = false
            
            // Verifica solo la prima nota nell'array delle note
            if let firstNote = notes.first {
                // Verifica se la prima nota è già stata tagliata o se ha già superato la parte inferiore dello schermo
                if !firstNote.isCut && firstNote.position.y <= heightB && firstNote.position.y >= heightA { // altezza media 150 come specificato (50 + 250) / 2
                    isFirstNoteAtHeight = true
                }
            }
            
            // Se la prima nota è arrivata all'altezza desiderata, avvia la canzone
            if isFirstNoteAtHeight && contStartMusic == 0{
                contStartMusic += 1
                startGameTimer()
                AudioManager.shared.playBackgroundMusicWithDelay(songName: songName ?? "")
                 
                isFirstNoteAtHeight = false
            }
        
        for note in notes {
            // Verifica se la nota è già stata tagliata o se ha già superato la parte inferiore dello schermo
            if !note.isCut && note.position.y < 0 {
                // Imposta la nota come "sbagliata"
                note.isCut = true
                // Resetta la combo e sottrai una vita
                combo = 0
                gameManager?.actualHealth -= 1
                gameManager?.actualCombo = combo
                print("Nota sbagliata - Combo resettata - Vita: \(gameManager?.actualHealth ?? 0)")
                
                // Aggiungi altre azioni o effetti per indicare la nota sbagliata
                
                // Se la vita è inferiore o uguale a zero, il gioco è fallito
                if gameManager?.actualHealth ?? 0 <= 0 {
                    print("Gioco fallito")
                    gameManager?.endedGame = true
                    AudioManager.shared.stopBackgroundMusic() // Metti in pausa la canzone
                }
                
                // Rimuovi la nota dalla scena
                note.removeFromParent()
            }
        }
        
        gameManager?.score = score // Aggiorna il punteggio
        gameManager?.highestCombo = highestCombo // Aggiorna la combo massima
        
        updateProgressBar()
    }
    
    func drawHorizontalLines() {
        let widthA: CGFloat = 260
        let widthB: CGFloat = 130
        
            let lineA = SKShapeNode()
            let lineB = SKShapeNode()
            
            let pathA = CGMutablePath()
            let pathB = CGMutablePath()
            
            let startY: CGFloat = -1000
            let endY: CGFloat = 1000
            
            // Crea i punti di inizio e fine per le due linee
            let startPointA = CGPoint(x: widthA, y: startY)
            let endPointA = CGPoint(x: widthA, y: endY)
            
            let startPointB = CGPoint(x: widthB, y: startY)
            let endPointB = CGPoint(x: widthB, y: endY)
            
            // Crea il percorso delle due linee
            pathA.move(to: startPointA)
            pathA.addLine(to: endPointA)
            
            pathB.move(to: startPointB)
            pathB.addLine(to: endPointB)
            
            // Imposta le proprietà delle linee
            lineA.path = pathA
            lineA.strokeColor = .black // Modifica il colore
            lineA.lineWidth = 2 // Modifica lo spessore
            
            lineB.path = pathB
            lineB.strokeColor = .black // Modifica il colore
            lineB.lineWidth = 2 // Modifica lo spessore
            
            // Aggiungi le linee alla scena
            addChild(lineA)
            addChild(lineB)
        }

    
    ///Creazione delle note
    func createNotes() {
        let numberOfColumns1 = columnSequence1?.count
        let yOffsetOffset: CGFloat = 1000
        
        //Piazzamento delle note nella prima colonna
        for i in 0..<(numberOfColumns1 ?? 0) {
            let column = columnSequence1?[i]
            if column != 0 {
                let note = Note(color: .white, size: CGSize(width: noteWidth, height: noteHeight))
                let yOffset = size.height / 4 + CGFloat(i) * verticalDistanceBetweenNotes + yOffsetOffset // Altezza basata sull'indice
                let xPosition = 0 * (noteWidth + distanceBetweenNotes) + noteWidth / 2 + xOffsetPos
                note.position = CGPoint(x: xPosition, y: yOffset)
                note.name = "Note"
                note.cutDirection = cutDirections1?[i] ?? .any // Associa la direzione di taglio alla nota
                
                // Imposta la texture del cubo per la nota attuale
                note.texture = note.cubeTexture
                
                notes.append(note)
                addChild(note)
            }
        }
        
        //Piazzamento delle note nella seconda colonna
        let numberOfColumns2 = columnSequence2?.count
        for i in 0..<(numberOfColumns2 ?? 0) {
            let column = columnSequence2?[i]
            if column != 0 {
                let note = Note(color: .white, size: CGSize(width: noteWidth, height: noteHeight))
                let yOffset = size.height / 4 + CGFloat(i) * verticalDistanceBetweenNotes + yOffsetOffset // Altezza basata sull'indice
                let xPosition = 1 * (noteWidth + distanceBetweenNotes) + noteWidth / 2 + xOffsetPos
                note.position = CGPoint(x: xPosition, y: yOffset)
                note.name = "Note"
                note.cutDirection = cutDirections2?[i] ?? .any // Associa la direzione di taglio alla nota
                
                // Imposta la texture del cubo per la nota attuale
                note.texture = note.cubeTexture
                
                notes.append(note)
                addChild(note)
            }
        }
        
        //Piazzamento delle note nella terza colonna
        let numberOfColumns3 = columnSequence3?.count
        for i in 0..<(numberOfColumns3 ?? 0) {
            let column = columnSequence3?[i]
            if column != 0 {
                let note = Note(color: .white, size: CGSize(width: noteWidth, height: noteHeight))
                let yOffset = size.height / 4 + CGFloat(i) * verticalDistanceBetweenNotes + yOffsetOffset // Altezza basata sull'indice
                let xPosition = 2 * (noteWidth + distanceBetweenNotes) + noteWidth / 2 + xOffsetPos
                note.position = CGPoint(x: xPosition, y: yOffset)
                note.name = "Note"
                note.cutDirection = cutDirections3?[i] ?? .any // Associa la direzione di taglio alla nota
                
                // Imposta la texture del cubo per la nota attuale
                note.texture = note.cubeTexture
                
                notes.append(note)
                addChild(note)
            }
        }
        
        print("Note1")
        print(numberOfColumns1 ?? 0)
        print(cutDirections1?.count ?? 0)
        print("Note2")
        print(numberOfColumns2 ?? 0)
        print(cutDirections2?.count ?? 0)
        print("Note3")
        print(numberOfColumns3 ?? 0)
        print(cutDirections3?.count ?? 0)
        
        // Imposta le texture delle frecce sulla nota attuale
        setArrowTexturesForNotes()
        
        startNotesMovement(bpm: bpm ?? 0)
    }
    
    func setArrowTexturesForNotes() {
        for (_, note) in notes.enumerated() {
            switch note.cutDirection {
            case .down:
                note.texture = arrowTextureDown
            case .up:
                note.texture = arrowTextureUp
            case .right:
                note.texture = arrowTextureLeft
            case .left:
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
                            
                            // Dentro la condizione per un taglio corretto della nota
                            if difference < tolerance {
                                // Incrementa la combo e aggiorna il punteggio in base alla combo
                                combo += 1
                                score += baseScoreForHit + combo
                                gameManager?.actualCombo = combo
                                print("Combo x\(combo) - Score: \(score)")
                                // Aggiungi suono, effetti o altre azioni per indicare il taglio della nota
                                
                                if gameManager?.actualHealth ?? 0 < startLife
                                {
                                    gameManager?.actualHealth += 1
                                }
                                
                                // Attiva l'effetto di pulsazione del testo
                                gameManager?.isPulsating = true

                                    // Disattiva l'effetto di pulsazione dopo un certo periodo di tempo
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                        self.gameManager?.isPulsating = false
                                    }

                            } else {
                                // Resettare la combo se si sbaglia la nota
                                combo = 0
                                gameManager?.actualHealth -= 1
                                gameManager?.actualCombo = combo
                                print("Combo reset - Score: \(score)")
                                // Aggiungi altre azioni o effetti per indicare un taglio errato
                                
                                if gameManager?.actualHealth ?? 0 <= 0 {
                                    print("Gioco fallito")
                                    gameManager?.endedGame = true
                                    AudioManager.shared.stopBackgroundMusic() // Metti in pausa la canzone
                                }
                            }
                            
                            // Aggiorna la combo massima se la combo attuale supera la precedente massima
                            if combo > highestCombo {
                                highestCombo = combo
                            }

                            // Aggiungi un print per visualizzare la combo massima
                            gameManager?.highestCombo = highestCombo
                            print("Highest Combo: \(highestCombo)")

                            
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
        case .right:
            return CGFloat.pi // Direzione da sinistra a destra, corrispondente a 180 gradi o pi radianti
        case .left:
            return 0 // Direzione da destra a sinistra, corrispondente a 0 gradi o 0 radianti
        case .down:
            return -CGFloat.pi / 2 // Direzione dall'alto verso il basso, corrispondente a -90 gradi o -pi/2 radianti
        case .up:
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
}
