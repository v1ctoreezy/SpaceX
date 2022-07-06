//
//  InfoView.swift
//  SpaceXKontur
//
//  Created by Виктор Черкасов on 07.06.2022.
//

import SwiftUI

struct InfoView: View {
    var firstStart: String
    var country: String
    var costOfStart: Int
    
    var body: some View {
        HStack {
            discribtion
            Spacer()
            data
        }
    }
    
    var data: some View {
        ZStack {
            VStack(alignment: .trailing, spacing: 20) {
                Text("\(firstStart)")
                    .foregroundColor(.white)
                    .font(.body)
                Text(country)
                    .foregroundColor(.white)
                    .font(.body)
                Text("$\(String(costOfStart)) млн")
                    .foregroundColor(.white)
                    .font(.body)
            }
        }
    }
    
    var discribtion: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Первый запуск")
                .foregroundColor(.white)
                .font(.body)
                .fontWeight(.light)
            Text("Страна")
                .foregroundColor(.white)
                .font(.body)
                .fontWeight(.light)
            Text("Стоимость запуска")
                .foregroundColor(.white)
                .font(.body)
                .fontWeight(.light)
        }
    }
}

struct InfoDataView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(firstStart: "24 марта 2006 г.", country: "USA", costOfStart: 6700000)
            .preferredColorScheme(.dark)
    }
}
