//
//  WinView.swift
//  ProcNey
//
//  Created by mcor on 03/12/22.
//

import SwiftUI
import AVFoundation
import MediaPlayer

struct WinView: View {
    @State private var winPlayer: AVAudioPlayer!
    @State  var timeRemaining: Int
    
    
    var body: some View {
        VStack{
            Text("Voce venceu")
            Text("Tempo \(timeRemaining).0 segundos")
            
        }
            .onAppear(perform: {
                
                winPlayer = playSounds("win.mp3", 0)
                winPlayer.play()
//                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0){
//                    winPlayer?.stop()
//                    
//                }
            })
            .onDisappear {
                winPlayer?.stop()
            }
        
    }
    
}

struct WinView_Previews: PreviewProvider {
    static var previews: some View {
        WinView(timeRemaining: 0)
    }
}
