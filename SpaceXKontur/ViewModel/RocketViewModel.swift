//
//  RocketViewModel.swift
//  SpaceXKontur
//
//  Created by Виктор Черкасов on 16.06.2022.
//

import Foundation
import SwiftUI

struct RocketViewModel: View {
    
    var countryTranslate: [String:String] =
    [
        "Republic of the Marshall Islands" : "Маршалловы о-ва",
        "United States" : "США"
    ]
    
    var rocket: Rocket
    var launch: [Launch]
    
    @State var showSettings: Bool = false
    @State var showStarts: Bool = false
    
    @State var height: Bool = false
    @State var diam: Bool = false
    @State var mass: Bool = false
    @State var load: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 35)
                .fill(Color.black)
            VStack {
                VStack {
                    Spacer(minLength: 60)
                    HStack {
                        // Rocket label
                        Text(rocket.name)
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        //Settings Button rigth from rocket label
                        Button {
                            showSettings.toggle()
                        } label: {
                            Image(systemName: "gearshape")
                                .background(.black)
                                .foregroundColor(.white)
                                .font(.system(size: 25))
                        }.sheet(isPresented: $showSettings) {
                            SettingsView(height: $height,
                                         diam: $diam,
                                         mass: $mass,
                                         load: $load)
                        }
                    }
                }.frame(width: 360)
                
                Spacer(minLength: 50)
                DataViewOnScrollModel(height: $height,
                                      diam: $diam,
                                      mass: $mass,
                                      load: $load,
                                      rocket: rocket)
                Spacer(minLength: 40)
                //  MARK: Info Block
                VStack {
                    InfoView(firstStart: transformDate(date: rocket.firstFlight),
                             country: countryTranslate[rocket.country]!,
                             costOfStart: transformNumber(number: rocket.costPerLaunch))
                    Spacer(minLength: 50)
                    StageDataView(engCount: rocket.firstStage.engines,
                                  fielCount: String(rocket.firstStage.fuelAmountTons),
                                  time: rocket.firstStage.burnTimeSec ?? 0,
                                  stage: "Первая ступень".uppercased())
                    Spacer(minLength: 50)
                    StageDataView(engCount: rocket.secondStage.engines,
                                  fielCount: String(rocket.secondStage.fuelAmountTons),
                                  time: rocket.secondStage.burnTimeSec ?? 0,
                                  stage: "Вторая ступень".uppercased())
                    Spacer(minLength: 50)
                    
                    Button("Посмотреть запуски") {
                        showStarts.toggle()
                    }.frame(width: 300, height: 65)
                        .background(Color.init(UIColor.darkGray))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .fullScreenCover(isPresented: $showStarts) {
                            LaunchViewModel(rocketName: rocket.name, launches: launch)
                        }
                    Spacer(minLength: 50)
                    
                }.frame(width: 360)
            }
        }
    }
    
    private func transformNumber(number: Int) -> Double {
        return Double(number) / 1000000
    }
    
    private func transformDate(date: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        let date = formatter.date(from: date)!
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateStyle = .long
        
        return formatter.string(from: date)
    }
}
