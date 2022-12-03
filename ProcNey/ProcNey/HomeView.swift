import SwiftUI

struct HomeView: View {
    @State var nickname: String = " "
    var body: some View {
        NavigationView {
            ZStack(alignment: .center){
                Color(#colorLiteral(red: 0.03529411926865578, green: 0.0941176488995552, blue: 0.15294118225574493, alpha: 1))
                    .ignoresSafeArea()
                Image("Rectangle-Inicio")
                    .resizable()
                    .scaledToFit()
                    .frame(alignment: .center)
                    .padding(10)
                VStack(alignment: .center){
                    VStack(alignment: .center){
                        Image("tv-Inicio")
                            .resizable()
                            .frame(width: 387, height: 379, alignment: .center)
                        
                        Text("Cadê Neymar ?")
                            .font(Font.custom("RubikGlitch-Regular", size: 72))
                        TextField("nickname...", text: $nickname)
                            .font(Font.custom("RubikGlitch-Regular", size: 37))
                            
                    }
                    HStack(alignment: .center){
                        NavigationLink(destination: GameView()) {
                            ZStack{
                                Text("Nova partida")
                            }
                        }
                        NavigationLink(destination: GameView()) {
                            ZStack{
                                Text("Como jogar")
                            }
                        }
                    }.font(Font.custom("RubikGlitch-Regular", size: 37))
                }
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
