import SwiftUI

struct GameView: View {
    var body: some View {
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
                            Text("Time")
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
                            Button(action: {
                                
                            }) {
                                
                                Image("fig1")
                                    .resizable()
                                    .frame(width: 503, height: 366)
                                    
                            }.buttonStyle(CardButtonStyle())
                            
                            Button(action: {
                                
                            }) {
                                Image("fig2")
                                    .resizable()
                                    .frame(width: 503, height: 366)
                                    
                            }.buttonStyle(CardButtonStyle())
                            Button(action: {
                                
                            }) {
                                Image("fig3")
                                    .resizable()
                                    .frame(width: 503, height: 366)
                                    
                            }.buttonStyle(CardButtonStyle())
                        }
                    }
                    
                    Grid(alignment: .center, horizontalSpacing: 60) {
                        GridRow {
                            Button(action: {
                                
                            }) {
                                Image("fig4")
                                    .resizable()
                                    .frame(width: 503, height: 366)
                            }.buttonStyle(CardButtonStyle())
                            
                            Button(action: {
                                
                            }) {
                                Image("fig5")
                                    .resizable()
                                    .frame(width: 503, height: 366)
                            }.buttonStyle(CardButtonStyle())
                            Button(action: {
                                
                            }) {
                                Image("fig6")
                                    .resizable()
                                    .frame(width: 503, height: 366)
                            }.buttonStyle(CardButtonStyle())
                            
                        }
                        
                    }
                }
            }
            
        }
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
