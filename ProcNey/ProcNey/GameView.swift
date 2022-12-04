import SwiftUI

struct GameView: View {
    @State  var timeRemaining = 30
    @State private var showWinView: Bool = false
    @State private var showLoseView: Bool = false
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true
    
    var body: some View {
        //NavigationView{
        ZStack {
            Image("back")
                .resizable()
                .scaledToFill()
            VStack{
                ZStack{
                    Image("Rectangle-game")
                        .resizable()
                        .scaledToFit()
                    
                    
                    HStack{
                        VStack(alignment: .leading){
                            Image("Line")
                                .resizable()
                                .frame(width: 403, height:3)
                            
                            Text("Ajude a correspondente Choquei \n a encontrar o menino Ney")
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                                .frame(width: 553, height:75)
                                .padding(.top, -15)
                                .font(Font.custom("RubikGlitch-Regular", size: 27))
                        }
                        
                        Image("Ney-Objetivo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .padding(.leading,250)
                            .padding(.trailing,250)
                        
                        
                        VStack(alignment: .trailing){
                            Text("\(timeRemaining)s")
                                .frame(width: 353, height:55)
                                .font(Font.custom("RubikGlitch-Regular", size: 27))
                            
                            Image("Line")
                                .resizable()
                                .frame(width: 403, height:3)
                                .padding(.top, -18)
                            
                        }
                    }
                    
                }.padding(.top,-58)
                
                VStack{
                    Grid(alignment: .center, horizontalSpacing: 60){
                        GridRow {
                            
                            Button(action: { self.showWinView.toggle()
                                
                            })  {
                                Image("fig1")
                                    .resizable()
                                    .frame(width: 503, height: 366)
                                
                            }.buttonStyle(CardButtonStyle())
                                .sheet(isPresented: $showWinView) {
                                    WinView(timeRemaining: timeRemaining)
                                }
                            
                            Button(action: { self.showLoseView.toggle()
                                
                            }) {
                                Image("fig2")
                                    .resizable()
                                    .frame(width: 503, height: 366)
                                
                            }.buttonStyle(CardButtonStyle())
                                .sheet(isPresented: $showLoseView) {
                                    LoseView(timeRemaining: timeRemaining)
                                }
                            
                            Button(action: { self.showLoseView.toggle()
                                
                            }) {
                                Image("fig3")
                                    .resizable()
                                    .frame(width: 503, height: 366)
                                
                            }.buttonStyle(CardButtonStyle())
                                .sheet(isPresented: $showWinView) {
                                    LoseView(timeRemaining: timeRemaining)
                                }
                        }
                    }
                    
                    Grid(alignment: .center, horizontalSpacing: 60) {
                        GridRow {
                            Button(action: { self.showLoseView.toggle()
                                
                            }) {
                                Image("fig4")
                                    .resizable()
                                    .frame(width: 503, height: 366)
                            }.buttonStyle(CardButtonStyle())
                                .sheet(isPresented: $showWinView) {
                                    LoseView(timeRemaining: timeRemaining)
                                }
                            
                            Button(action: { self.showLoseView.toggle()
                                
                            }) {
                                Image("fig5")
                                    .resizable()
                                    .frame(width: 503, height: 366)
                            }.buttonStyle(CardButtonStyle())
                                .sheet(isPresented: $showWinView) {
                                    LoseView(timeRemaining: timeRemaining)
                                }
                            
                            Button(action: {self.showLoseView.toggle()
                                
                            }) {
                                Image("fig6")
                                    .resizable()
                                    .frame(width: 503, height: 366)
                            }.buttonStyle(CardButtonStyle())
                                .sheet(isPresented: $showWinView) {
                                    LoseView(timeRemaining: timeRemaining)
                                }
                            
                        }
                        
                    }
                    
                }
            }
            
        }
        .onReceive (timer) {time in
            guard isActive else { return }
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                self.showLoseView.toggle()
//                self.sheet(isPresented: $showLoseView) {
//                    LoseView()
//                }
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
        
        
    }
    
}
//}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
