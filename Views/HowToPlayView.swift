import SwiftUI

struct HowToPlayView: View {
    var body: some View {
        ZStack {
            Image("back")
                .resizable()
                .ignoresSafeArea()
                .frame(alignment: .center)
            ZStack{
                Image("Rectangle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 1424, height: 939 ,alignment: .center)
                    .padding(.trailing, 250)
                VStack(alignment: .leading){
                    Text("Como Jogar")
                        .font(Font.custom("RubikGlitch-Regular", size: 72))
                    
                    Text("Ele caiu mais uma vez?").padding(8)
                       
                    Text("A correspondente Choquei precisa encontrar o menino Ney que caiu inexplicavelmente de novo!").padding(8)
                        
                    Text("Mexa em seu pad e procure nas TVs, antes do tempo acabar, o Ney correspondente ao que está no topo da tela. Selecione a TV correta e faça os paramédicos chegarem até ele!").padding(8)
                        
                        
                      
                }.multilineTextAlignment(.leading)
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .foregroundColor(Color.white)
                    .frame(width: 1200)
                    .padding(.trailing, 300)
                
            }
            Image("LaUrsa")
                .resizable()
                .scaledToFit()
                .frame(width: 705, height: 358 ,alignment: .center)
                .padding(.leading, 1080)
                .padding(.top, 730)
            
        }
    }
}

struct  HowToPlayView_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayView()
    }
}
