//
//  CustomToggle.swift
//  SpaceXKontur
//
//  Created by Виктор Черкасов on 13.06.2022.
//

import Foundation
import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    var param1: String
    var param2: String
    
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            MyToggleStyle(param1: param1, param2: param2, isOn: configuration.isOn)
        }
        
    }
}

struct MyToggleStyle: View {
    var param1: String
    var param2: String
    var isOn: Bool
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(red: 0.1, green: 0.1, blue: 0.1))
                    .frame(width: 100, height: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .offset(x: 2)
                            .fill(.white)
                            .frame(width: 50, height: 35),
                        alignment: isOn ? .trailing : .leading)
                    .animation(Animation.spring())
                HStack(spacing: 40) {
                    Text(param1)
                        .foregroundColor(isOn ? Color.gray : Color.black)
                    Text(param2)
                        .foregroundColor(isOn ? Color.black : Color.gray)
                }
            }
        }
    }
}

//struct CustomToggleView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyToggleStyle(param1: "kg", param2: "lb", isOn: false)
//    }
//}
