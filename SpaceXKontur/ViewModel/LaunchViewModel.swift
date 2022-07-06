//
//  StartsViewModel.swift
//  SpaceXKontur
//
//  Created by Виктор Черкасов on 12.06.2022.
//

import SwiftUI

struct LaunchViewModel: View {
    @Environment(\.presentationMode) var presentationMode
    
    var rocketName: String
    var launches: [Launch]
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 15) {
                ZStack(alignment: .top) {
                    HStack {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            HStack {
                                Image(systemName: "chevron.backward")
                                    .foregroundColor(.white)
                                    .font(Font.system(size: 20))
                                Text("Назад")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }
                        }
                        Spacer()
                    }
                    HStack {
                        Text(rocketName)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    
                }.frame(height: 50)
                ScrollView {
                    ForEach(launches) { launch in
                        LaunchCardView(
                            name: launch.name,
                            startDate: transformDate(date: launch.dateUnix),
                            succses: launch.success)
                    }
                }
            }
        }
    }
    
    private func transformDate(date: Int) -> String {
        let epocTime = TimeInterval(date)
        let date = NSDate(timeIntervalSince1970: epocTime)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd:'T'HH:mm:ss"
        
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateStyle = .long
        
        return formatter.string(from: date as Date)
    }
}
