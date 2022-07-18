//
//  ContentView.swift
//  SpaceXKontur
//
//  Created by Виктор Черкасов on 05.06.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var completeRocket = CompleteRocket()
    
    var body: some View {
        Group {
            if completeRocket.rockets.isEmpty || completeRocket.launches.isEmpty {
                ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                            .padding(1000)
                            .background(.black)
            } else {
                TabView {
                    ForEach(completeRocket.rockets) { rocket in
                        ScrollView {
                            MainViewModel(completeRocket: completeRocket, rocket: rocket)
                        }.edgesIgnoringSafeArea(.top)
                    }
                }.tabViewStyle(PageTabViewStyle())
                    .edgesIgnoringSafeArea(.top)
                    .background(.black)
                    
            }
        }
        //.animation(.easeIn(duration: 1))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
