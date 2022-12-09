import SwiftUI
import AVFoundation
import MediaPlayer

struct LoseView: View {
    @State private var losePlayer: AVAudioPlayer!
    @State  var timeRemaining: Int
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .center){
                Image("Back-Placar")
                    .resizable()
                    .ignoresSafeArea()
                    .frame(alignment: .center)
                ZStack(alignment: .center){
                    Image("Placar-Derrota")
                        .resizable()
                        .scaledToFit()
                        .padding(.top, 70)
                        .padding(.bottom, 70)
                        .frame(alignment: .center)
                    VStack{
                        Text("OPS!!")
                            .font(Font.custom("RubikGlitch-Regular", size: 68))
                            .padding(.top, 60)
                        
                        Text("não pendura essa chuteira ainda")
                            .font(Font.custom("RubikGlitch-Regular", size: 37))
                            .padding(.bottom, 9)
                        
                        Text("Tente novamente")
                            .font(Font.custom("RubikGlitch-Regular", size: 68))
                        
                        Text("Time: \(15-timeRemaining).0s ")
                            .font(Font.custom("RubikGlitch-Regular", size: 37))
                            .padding(.bottom, 40)
                        
                        HStack(alignment: .center){
                            NavigationLink(destination: GameView()) {
                                ZStack{
                                    Text("Tentar de novo")
                                        .font(.system(size: 40, weight: .bold, design: .rounded))
                                }
                            }
                            NavigationLink(destination: NameUserView()) {
                                ZStack{
                                    Text("Sair")
                                        .font(.system(size: 40, weight: .bold, design: .rounded))
                                }
                            }
                        }
                        
                    }.frame(width: 1200)
                        .multilineTextAlignment(.center)
                }
            }
            .onAppear(perform: {
                if timeRemaining == 0{
                    losePlayer = playSounds("que-tistreza.mp3", 0)
                    losePlayer.play()
                }
                else{
                    losePlayer = playSounds("faustao-errou.mp3", 0)
                    losePlayer.play()
                }
            })
            .onDisappear {
                losePlayer?.stop()
            }
            
        }
    }
}

struct LoseView_Previews: PreviewProvider {
    static var previews: some View {
        LoseView(timeRemaining: 0)
    }
}
