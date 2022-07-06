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
            if completeRocket.rockets.isEmpty {
                ProgressView()
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
