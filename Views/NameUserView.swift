import SwiftUI

struct NameUserView: View {
    @State var nickname: String = " "
    var body: some View {
        NavigationView {
            ZStack {
                Image("back")
                    .resizable()
                    .ignoresSafeArea()
                    .frame(alignment: .center)
                
                VStack{
                    Text("Antes de começar, insira seu nome de correspondente Choquei")
                        .font(.system(size: 82, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 60)
                    ZStack{
                        TextField("Nickname", text: $nickname)
                            .font(.custom("RubikGlitch-Regular", size: 45))
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 80)
                            .multilineTextAlignment(.center)
                            .padding(.leading,62)
                            .padding(.trailing,62)
                        Image("pomobgente")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 235 )
                            .padding(.top, -234)
                            .padding(.leading, 1450)
                    }
                    
                    if (self.nickname != " "){
                        NavigationLink(destination: HomeView(player_name: nickname).navigationBarBackButtonHidden(true)) {
                            Text("Salvar Nome")
                                .font(.system(size: 40, weight: .bold, design: .rounded))
                        }.navigationBarBackButtonHidden(true)
                            .padding(.top,-30)
                    }
                }
            }
        }
    }
}

struct NameUserView_Previews: PreviewProvider {
    static var previews: some View {
        NameUserView()
    }
}
