//
//  StageDataView.swift
//  SpaceXKontur
//
//  Created by Виктор Черкасов on 07.06.2022.
//

import SwiftUI

struct StageDataView: View {
    var engCount: Int
    var fielCount: String
    var time: Int
    var stage: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(stage)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
            HStack {
                discribtion
                Spacer()
                data
                    .font(Font.system(size: 18, design: .default))
            }
        }
    }
    
    var data: some View {
        HStack {
            VStack(alignment: .center, spacing: 20) {
                Text("\(engCount)")
                    .foregroundColor(.white)
                    .font(.custom("Montserrat-SemiBold", size: 18))
                HStack {
                    Text("\(fielCount)")
                        .foregroundColor(.white)
                        .font(.custom("Montserrat-SemiBold", size: 18))
                    Text("ton")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                }
                HStack {
                    Text("\(time)")
                        .foregroundColor(.white)
                        .font(.custom("Montserrat-SemiBold", size: 18))
                    Text("sec")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                }
                
            }
        }
    }
    
    var discribtion: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Количество двигателей")
                .foregroundColor(.white)
                .font(.body)
                .fontWeight(.light)
            Text("Количество топлива")
                .foregroundColor(.white)
                .font(.body)
                .fontWeight(.light)
            Text("Время сгорания")
                .foregroundColor(.white)
                .font(.body)
                .fontWeight(.light)
        }
    }
}

struct StageDataView_Previews: PreviewProvider {
    static var previews: some View {
        StageDataView(engCount: 3, fielCount: "123", time: 333, stage: "Первая ступень")
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
    }
}
