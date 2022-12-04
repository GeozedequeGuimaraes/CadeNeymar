//
//  LoseView.swift
//  ProcNey
//
//  Created by mcor on 03/12/22.
//

import SwiftUI
import AVFoundation
import MediaPlayer

struct LoseView: View {
    @State private var losePlayer: AVAudioPlayer!
    @State  var timeRemaining: Int
    
    var body: some View {
        VStack{
            Text("Você perdeu")
            Text("Tempo \(timeRemaining).0 segundos")
            
        }
            .onAppear(perform: {
                
                losePlayer = playSounds("ole.mp3", 0)
                losePlayer.play()
            })
            .onDisappear {
                losePlayer?.stop()
            }
        
        
    }
}

struct LoseView_Previews: PreviewProvider {
    static var previews: some View {
        LoseView(timeRemaining: 0)
    }
}
