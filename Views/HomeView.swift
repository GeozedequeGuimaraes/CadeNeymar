import SwiftUI

struct HomeView: View {
    var player_name:String
   
    var body: some View {
        NavigationView {
            ZStack(alignment: .center){
                
                Image("Back-Home")
                    .resizable()
                    .ignoresSafeArea()
                    .frame(alignment: .center)
                VStack(alignment: .center){
                    VStack(alignment: .center){
                        Text("Olá, correspondente")
                            .font(.custom("RubikGlitch-Regular", size: 72))
                        Text(player_name)
                            .font(.custom("RubikGlitch-Regular", size: 65))
                        
                    }.padding(.bottom, 30)
                    HStack(alignment: .center){
                        NavigationLink(destination: HowToPlayView()) {
                            ZStack{
                                Text("Como Jogar")
                            }
                        }
                        NavigationLink(destination: GameView()) {
                            ZStack{
                                Text("Nova Partida")
                            }
                        }
                    }.font(.system(size: 40, weight: .bold, design: .rounded))
                }.padding(.top, 219)
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(player_name: "You")
        
    }
}
