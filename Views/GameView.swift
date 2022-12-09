import SwiftUI
import AVFoundation
import MediaPlayer

struct GameView: View {
    @State  var timeRemaining = 3
    @State private var showWinView: Bool = false
    @State private var showLoseView: Bool = false
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true
    
    @State var gamePlayer: AVAudioPlayer!
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("back")
                    .resizable()
                    .scaledToFill()
                VStack{
                    ZStack{
                        Image("Rectangle-Game")
                            .resizable()
                            .scaledToFit()
                        
                        HStack{
                            VStack(alignment: .leading){  
                                Text("Ajude a correspondente Choquei \n a encontrar o menino Ney")
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                    .frame(width: 553, height:75)
                                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                            }
                            Image("Ney-Objetivo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                                .padding(.leading,250)
                                .padding(.trailing,250)
                            
                            VStack(alignment: .center){
                                Text("Time: \(timeRemaining)s")
                                    .frame(width: 353, height:55)
                                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                            }
                        }
                    }.padding(.top,-58)
                    
                    VStack{
                        Grid(alignment: .center, horizontalSpacing: 60){
                            GridRow {
                                NavigationLink(destination: LoseView(timeRemaining:timeRemaining)) {
                                    Button(action: { self.showLoseView.toggle()
                                    })  {
                                        Image("Frame 1")
                                            .resizable()
                                            .frame(width: 503, height: 366)
                                      
                                    }.buttonStyle(CardButtonStyle())
                                }.buttonStyle(CardButtonStyle())
                                              
                                NavigationLink(destination: LoseView(timeRemaining:timeRemaining)) {
                                    Button(action: { self.showLoseView.toggle()
                                    }) {
                                        Image("Tv2")
                                            .resizable()
                                            .frame(width: 503, height: 366)
                                        
                                    }.buttonStyle(CardButtonStyle())
                                        .buttonStyle(PlainButtonStyle())
                                }.buttonStyle(CardButtonStyle())
                                
                                NavigationLink(destination: WinView(timeRemaining:timeRemaining)) {
                                    Button(action: { self.showWinView.toggle()
                                    }) {
                                        Image("Tv3")
                                            .resizable()
                                            .frame(width: 503, height: 366)
                                        
                                    }.buttonStyle(CardButtonStyle())
                                        .buttonStyle(PlainButtonStyle())
                                }.buttonStyle(CardButtonStyle())
                            }
                        }
                    }
                    
                    Grid(alignment: .center, horizontalSpacing: 60) {
                        GridRow {
                            NavigationLink(destination: LoseView(timeRemaining:timeRemaining)) {
                                Button(action: { self.showLoseView.toggle()
                                }) {
                                    Image("Tv4")
                                        .resizable()
                                        .frame(width: 503, height: 366)
                                }.buttonStyle(CardButtonStyle())
                            }.buttonStyle(CardButtonStyle())
                            
                            NavigationLink(destination: LoseView(timeRemaining:timeRemaining)) {
                                Button(action: { self.showLoseView.toggle()
                                }) {
                                    Image("Tv5")
                                        .resizable()
                                        .frame(width: 503, height: 366)
                                }.buttonStyle(CardButtonStyle())
                            }.buttonStyle(CardButtonStyle())
                            
                            NavigationLink(destination: LoseView(timeRemaining:timeRemaining)) {
                                Button(action: {self.showLoseView.toggle()
                                }) {
                                    Image("Tv6")
                                        .resizable()
                                        .frame(width: 503, height: 366)
                                }.buttonStyle(CardButtonStyle())
                            }.buttonStyle(CardButtonStyle())
                        }
                    }
                    
                }
                .background(NavigationLink(destination: LoseView(timeRemaining: timeRemaining), isActive: $showLoseView) {EmptyView()}
                )
            }
            .onReceive (timer) {time in
                guard isActive else { return }
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    self.showLoseView.toggle()
                    self.isActive = false
                }
            }
            
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .active {
                    isActive = true
                } else {
                    isActive = false
                }
            }
            
            .onAppear(perform: {
                gamePlayer = playSounds("MUSICA.mp3", 0)
                gamePlayer.play()
            })
            .onDisappear {
                gamePlayer?.stop()
                
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
