import SwiftUI
import AVFoundation
import MediaPlayer

struct WinView: View {
    @State private var winPlayer: AVAudioPlayer!
    @State  var timeRemaining: Int
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .center){
                Image("Back-Placar")
                    .resizable()
                    .ignoresSafeArea()
                    .frame(alignment: .center)
                ZStack(alignment: .center){
                    Image("Placar-Vitoria")
                        .resizable()
                        .scaledToFit()
                        .padding(.top, 70)
                        .padding(.bottom, 70)
                        .frame(alignment: .center)
                    VStack{
                        Text("Arrasou!!")
                            .font(Font.custom("RubikGlitch-Regular", size: 68))
                            .padding(.top, 90)
                        
                        Text("Troféu na mão e sorriso no rosto")
                            .font(Font.custom("RubikGlitch-Regular", size: 37))
                            .padding(.bottom, 9)
                        
                        Text("Você encontou neymar")
                            .font(Font.custom("RubikGlitch-Regular", size: 60))
                        
                        
                        Text("Time: \(15-timeRemaining).0s ")
                            .font(Font.custom("RubikGlitch-Regular", size: 37))
                            .padding(.bottom, 40)
                        
                        HStack(alignment: .center){
                            NavigationLink(destination: NameUserView()) {
                                ZStack{
                                    Text("Ir pro início")
                                        .font(.system(size: 40, weight: .bold, design: .rounded))
                                }
                            }
                        }
                    }.frame(width: 1200)
                        .multilineTextAlignment(.center)
                        .padding(.top, 50)
                }
            }
            .onAppear(perform: {
                winPlayer = playSounds("win.mp3", 0)
                winPlayer.play()
                
            })
            .onDisappear {
                winPlayer?.stop()
            }
        }
    }
    
}

struct WinView_Previews: PreviewProvider {
    static var previews: some View {
        WinView(timeRemaining: 0)
    }
}
