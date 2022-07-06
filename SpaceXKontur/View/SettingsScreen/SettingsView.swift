//
//  SettingsView.swift
//  SpaceXKontur
//
//  Created by Виктор Черкасов on 12.06.2022.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var height: Bool
    @Binding var diam: Bool
    @Binding var mass: Bool
    @Binding var load: Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    HStack {
                        Text("Настройки")
                            .foregroundColor(.white)
                    }
                    HStack {
                        Spacer()
                        
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Назад")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                    }
                }.offset(y: 20)
                Spacer()
                settings
            }.frame(width: 360, height: 350)
        }
    }
    
    var settings: some View {
        VStack(spacing: 30) {
            HStack(spacing: 50) {
                Text("Высота")
                    .fontWeight(.semibold)
                Spacer()
                Toggle("Custom Toggle", isOn: $height)
                    .toggleStyle(CustomToggleStyle(param1: "m", param2: "ft"))
            }
            HStack(spacing: 50) {
                Text("Диаметр")
                    .fontWeight(.semibold)
                Spacer()
                Toggle("Custom Toggle", isOn: $diam)
                    .toggleStyle(CustomToggleStyle(param1: "m", param2: "ft"))
            }
            HStack(spacing: 50) {
                Text("Масса")
                    .fontWeight(.semibold)
                Spacer()
                Toggle("Custom Toggle", isOn: $mass)
                    .toggleStyle(CustomToggleStyle(param1: "kg", param2: "lb"))
            }
            HStack(spacing: 50) {
                Text("Полезная нагрузка")
                    .fontWeight(.semibold)
                Spacer()
                Toggle("Custom Toggle", isOn: $load)
                    .toggleStyle(CustomToggleStyle(param1: "kg", param2: "lb"))
            }
        }.foregroundColor(.white)
    }
}
