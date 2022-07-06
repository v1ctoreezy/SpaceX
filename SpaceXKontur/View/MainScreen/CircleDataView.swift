//
//  CircleDataView.swift
//  SpaceXKontur
//
//  Created by Виктор Черкасов on 07.06.2022.
//

import SwiftUI

struct CircleDataView: View {
    var discribtion: String
    var data: String
    
    var body: some View{
        ZStack {
            RoundedRectangle(cornerRadius: 29)
                .fill(Color(red: 0.1, green: 0.1, blue: 0.1))
                .frame(width: 110, height: 110)
            VStack {
                Text(data)
                    .frame(height: 26)
                    .font(.custom("Montserrat-SemiBold", size: 18))
                    .foregroundColor(.white)
                Text(discribtion)
                    .font(Font.system(size: 16))
                    .foregroundColor(Color.init(UIColor.lightGray))
            }
        }
    }
}

struct CircleDataView_Previews: PreviewProvider {
    static var previews: some View {
        CircleDataView(discribtion: "Ужинов", data: "0")
    }
}
