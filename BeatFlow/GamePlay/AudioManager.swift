import AVFoundation

class AudioManager {
    static let shared = AudioManager()
    
    var audioPlayer: AVAudioPlayer?
    
    func playBackgroundMusicWithDelay(delay: TimeInterval, songName: String) {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            
            guard let path = Bundle.main.path(forResource: songName, ofType: "mp3") else {
                print("File audio non trovato")
                return
            }
            
            let url = URL(fileURLWithPath: path)
            
            do {
                // Carica in anticipo le risorse audio
                self.audioPlayer = try AVAudioPlayer(contentsOf: url)
                self.audioPlayer?.prepareToPlay()
                
                // Riproduci l'audio sul thread principale
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    self.audioPlayer?.numberOfLoops = -1
                    self.audioPlayer?.play()
                }
            } catch {
                print("Errore nella riproduzione dell'audio")
            }
        }
    }

}
