//
//  ContentView.swift
//  DuoStreakWatch Watch App
//
//  Created by William Wilson on 18/10/2022.
//

import SwiftUI



let myURLString = "https://duome.eu/Arayme"


struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.gray)
            .foregroundColor(.black)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.6 : 0.8)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct ContentView: View {
    
    static var streak:Bool!
    
    @State var imageName = "Streak_Unfulfilled"
    
    var body: some View {
        VStack {
            
            Image(imageName).resizable().frame(width: 50, height: 60, alignment: .center).scaledToFit().onAppear(){
                getSite()
            }
            .padding(.top, 50)
            .padding(20)
            
            Button("Update", action: {
                
                getSite()
                
            }
            )    .buttonStyle(GrowingButton())
            
        }
    }
    
    
    
    func getSite(){
        
                
        DispatchQueue.global(qos: .background).async {
            let myHTMLString = try! URL(string: myURLString)

                .flatMap { try Data(contentsOf: $0) }

                .flatMap { String(data: $0, encoding: .ascii) }
            
    //            print(type(of: myHTMLString))

            if (myHTMLString!.contains("streak extended today")) {
                imageName = "Streak_FulfilledColour"
    //                Image("Streak_FulfilledColour").imageScale(.small)
                print("streak extended")
                
                

            } else {
                ContentView.streak = false
                imageName = "Streak_Unfulfilled"
                print("streak not extended")
                
                

            }
        }
        
        

    }
    

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

}



