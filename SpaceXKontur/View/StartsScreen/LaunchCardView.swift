//
//  StartCardView.swift
//  SpaceXKontur
//
//  Created by Виктор Черкасов on 13.06.2022.
//

import SwiftUI

struct LaunchCardView: View {
    var name: String
    var startDate: String
    var succses: Bool?
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 360, height: 100)
                .cornerRadius(20)
                .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(name)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Text(startDate)
                        .foregroundColor(Color.init(UIColor.lightGray))
                        .fontWeight(.light)
                }
                Spacer()
                if succses != nil {
                    PaperPlaneView(succses: succses!)
                }
            }.frame(width: 330, height: 100)
        }
    }
}

struct StartCardView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchCardView(name: "Heavy Holidays", startDate: "6 января, 2022", succses: false)
            .previewLayout(.sizeThatFits)
        LaunchCardView(name: "Heavy Holidays", startDate: "6 января, 2022", succses: true)
            .previewLayout(.sizeThatFits)
    }
}
